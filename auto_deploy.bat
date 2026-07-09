@echo off
chcp 65001 >nul
title Despliegue y Generacion de Iconos PWA
echo ============================================================
echo   Creando Iconos y Subiendo a GitHub (Certificados RM)
echo ============================================================
echo.

echo [+] 1. Generando icon-192.png e icon-512.png desde "Logo Rosy.png"...
powershell -Command "Add-Type -AssemblyName System.Drawing; if (-not (Test-Path 'Logo Rosy.png')) { Write-Error 'Logo Rosy.png no encontrado'; exit 1 }; $img = [System.Drawing.Image]::FromFile('Logo Rosy.png'); function Resize-Image($size, $outputPath) { $bmp = New-Object System.Drawing.Bitmap($size, $size); $g = [System.Drawing.Graphics]::FromImage($bmp); $g.Clear([System.Drawing.Color]::White); $maxDim = $size * 0.70; $w = $img.Width; $h = $img.Height; if ($w -gt $h) { $newH = ($h * $maxDim)/$w; $newW = $maxDim } else { $newW = ($w * $maxDim)/$h; $newH = $maxDim }; $x = ($size - $newW)/2; $y = ($size - $newH)/2; $g.DrawImage($img, $x, $y, $newW, $newH); $bmp.Save($outputPath, [System.Drawing.Imaging.ImageFormat]::Png); $g.Dispose(); $bmp.Dispose() }; Resize-Image 192 'icon-192.png'; Resize-Image 512 'icon-512.png'; $img.Dispose(); Write-Host 'Iconos generados exitosamente.'"

echo.
echo [+] 2. Agregando archivos a Git...
git add index.html sw.js manifest.json "Logo Rosy.png" icon-192.png icon-512.png generate_icons.html

echo [+] 3. Guardando version (Commit)...
git commit -m "Finalizacion PWA con auto-generacion de iconos locales"

echo [+] 4. Subiendo actualizaciones a GitHub...
git push origin main

echo.
echo ============================================================
echo   ¡PROCESO COMPLETADO! 
echo   Los iconos se crearon y todo esta en produccion.
echo ============================================================
pause
