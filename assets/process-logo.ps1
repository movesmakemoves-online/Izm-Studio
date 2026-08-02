Add-Type -AssemblyName System.Drawing

$srcPath = "C:\Users\izmwe\Documents\claude files\Izm Media Services\assets\izm-logo.png"
$blackOut = "C:\Users\izmwe\Documents\claude files\Izm Media Services\assets\izm-logo-black.png"
$whiteOut = "C:\Users\izmwe\Documents\claude files\Izm Media Services\assets\izm-logo-white.png"

$srcBmp = New-Object System.Drawing.Bitmap($srcPath)
$w = $srcBmp.Width
$h = $srcBmp.Height

# Pass 1: chroma-key white out to transparent, keep black ink -> izm-logo-black.png
$blackBmp = New-Object System.Drawing.Bitmap($w, $h, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
$g1 = [System.Drawing.Graphics]::FromImage($blackBmp)
$attr1 = New-Object System.Drawing.Imaging.ImageAttributes
$attr1.SetColorKey([System.Drawing.Color]::FromArgb(245,245,245), [System.Drawing.Color]::FromArgb(255,255,255))
$g1.DrawImage($srcBmp, (New-Object System.Drawing.Rectangle(0,0,$w,$h)), 0, 0, $w, $h, [System.Drawing.GraphicsUnit]::Pixel, $attr1)
$g1.Dispose()
$blackBmp.Save($blackOut, [System.Drawing.Imaging.ImageFormat]::Png)

# Pass 2: invert RGB of the black-transparent version -> white ink, alpha preserved
$whiteBmp = New-Object System.Drawing.Bitmap($w, $h, [System.Drawing.Imaging.PixelFormat]::Format32bppArgb)
$g2 = [System.Drawing.Graphics]::FromImage($whiteBmp)
$cm = New-Object System.Drawing.Imaging.ColorMatrix
$cm.Matrix00 = -1; $cm.Matrix11 = -1; $cm.Matrix22 = -1; $cm.Matrix33 = 1
$cm.Matrix40 = 1; $cm.Matrix41 = 1; $cm.Matrix42 = 1; $cm.Matrix44 = 1
$attr2 = New-Object System.Drawing.Imaging.ImageAttributes
$attr2.SetColorMatrix($cm)
$g2.DrawImage($blackBmp, (New-Object System.Drawing.Rectangle(0,0,$w,$h)), 0, 0, $w, $h, [System.Drawing.GraphicsUnit]::Pixel, $attr2)
$g2.Dispose()
$whiteBmp.Save($whiteOut, [System.Drawing.Imaging.ImageFormat]::Png)

$srcBmp.Dispose(); $blackBmp.Dispose(); $whiteBmp.Dispose()
Write-Output "Done"
