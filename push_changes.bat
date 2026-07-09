@echo off
title Despliegue de Certificados Rosymer Martinez PWA
echo ============================================================
echo   Despliegue y Commit Automatizado para PWA Certificados RM
echo ============================================================
echo.

:: 1. Comprobar e importar iconos desde la carpeta de descargas
echo [+] Verificando si generaste los iconos usando 'generate_icons.html'...
if exist "%USERPROFILE%\Downloads\icon-192.png" (
    echo [✓] Se encontro 'icon-192.png' en Descargas. Copiandolo al proyecto...
    move /y "%USERPROFILE%\Downloads\icon-192.png" "%~dp0icon-192.png" >nul
)
if exist "%USERPROFILE%\Downloads\icon-512.png" (
    echo [✓] Se encontro 'icon-512.png' en Descargas. Copiandolo al proyecto...
    move /y "%USERPROFILE%\Downloads\icon-512.png" "%~dp0icon-512.png" >nul
)

:: 2. Verificar que los iconos existan en el proyecto
if not exist "%~dp0icon-192.png" (
    echo [!] ADVERTENCIA: No se encontro 'icon-192.png' en el proyecto ni en Descargas.
    echo     Para un correcto funcionamiento de la PWA, abre 'generate_icons.html' 
    echo     en tu navegador y haz clic en 'Generar y Descargar Iconos'.
    echo.
    set /p RESP="¿Deseas continuar con el commit de todas formas? (S/N): "
    if /i "%RESP%" neq "S" goto fin
)

:: 3. Agregar y hacer Commit
echo.
echo [+] Agregando archivos de produccion a Git...
git add "%~dp0index.html" "%~dp0sw.js" "%~dp0manifest.json" "%~dp0Logo Rosy.png" "%~dp0generate_icons.html"
if exist "%~dp0icon-192.png" git add "%~dp0icon-192.png"
if exist "%~dp0icon-512.png" git add "%~dp0icon-512.png"

echo [+] Realizando Commit...
git commit -m "Finalizacion de PWA de Certificados de Autenticidad RM (Carga de logotipos locales, autocompletado y tamano y posicion de QR)"

:: 4. Enviar a GitHub
echo.
echo [+] Enviando cambios a GitHub (repositorio origin/main)...
git push origin main
if %errorlevel% neq 0 (
    echo.
    echo [x] Error al empujar a GitHub. Revisa tus credenciales o si el repositorio origin ya esta configurado.
) else (
    echo.
    echo [✓] ¡Proceso completado con exito! Todo tu codigo de produccion esta en GitHub.
)

:fin
echo.
pause
