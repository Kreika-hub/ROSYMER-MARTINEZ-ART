Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Image]::FromFile("C:\Users\HP\Desktop\ROSY WORD\Logo Rosy.png")
function Resize-Image($size, $outputPath) {
    $bmp = New-Object System.Drawing.Bitmap($size, $size)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.Clear([System.Drawing.Color]::White)
    $maxDim = $size * 0.70
    $w = $img.Width
    $h = $img.Height
    if ($w -gt $h) {
        $newH = ($h * $maxDim) / $w
        $newW = $maxDim
    } else {
        $newW = ($w * $maxDim) / $h
        $newH = $maxDim
    }
    $x = ($size - $newW) / 2
    $y = ($size - $newH) / 2
    $g.DrawImage($img, $x, $y, $newW, $newH)
    $bmp.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose()
    $bmp.Dispose()
}
Resize-Image 192 "C:\Users\HP\Desktop\ROSY WORD\icon-192.png"
Resize-Image 512 "C:\Users\HP\Desktop\ROSY WORD\icon-512.png"
$img.Dispose()
Write-Output "Icons generated successfully!"
