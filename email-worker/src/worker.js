import PostalMime from 'postal-mime';

export default {
  async email(message, env, ctx) {
    // 1. Forward a copy first, always — this guarantees the human never loses an email even
    // if parsing or the GitHub logging step below fails for any reason.
    try {
      await message.forward(env.FORWARD_TO);
    } catch (err) {
      console.error('Forward failed:', err);
    }

    // 2. Parse it and log it to GitHub, so Claude (and anyone else) can see new leads without
    // needing access to the inbox itself.
    try {
      const email = await PostalMime.parse(message.raw);
      const receivedAt = new Date().toISOString();
      const safeStamp = receivedAt.replace(/[:.]/g, '-');
      const subject = email.subject || '(no subject)';
      const body = (email.text || email.html || '').slice(0, 20000);

      const record = {
        receivedAt,
        from: message.from,
        to: message.to,
        subject,
        body,
      };

      const path = `leads/inbox/${safeStamp}.json`;
      const content = btoa(unescape(encodeURIComponent(JSON.stringify(record, null, 2))));

      const res = await fetch(
        `https://api.github.com/repos/${env.GITHUB_OWNER}/${env.GITHUB_REPO}/contents/${path}`,
        {
          method: 'PUT',
          headers: {
            Authorization: `Bearer ${env.GITHUB_TOKEN}`,
            'User-Agent': 'dsl-lead-router',
            Accept: 'application/vnd.github+json',
          },
          body: JSON.stringify({
            message: `New lead: ${subject}`,
            content,
          }),
        }
      );

      if (!res.ok) {
        console.error('GitHub log failed:', res.status, await res.text());
      }
    } catch (err) {
      // Don't reject the email over a logging failure — the forward above already succeeded.
      console.error('Lead logging failed (email was still forwarded):', err);
    }
  },
};
