@echo off
REM Batch file to copy post-processor files to Inventor CAM Posts directory
REM This script copies marlin_cnc_marlin20.cps, marlin_cnc_common.js, and marlin_cnc_marlin20.json
REM to the Autodesk Inventor CAM Posts folder

echo ====================================
echo Ender CNC Mill Post-Processor Installer
echo ====================================
echo.

REM Set source directory (current directory where batch file is located)
set SOURCE_DIR=%~dp0

REM Set base destination directory
set DEST_BASE=C:\Users\Public\Documents\Autodesk

REM Check if Autodesk directory exists
if not exist "%DEST_BASE%" (
    echo ERROR: Autodesk directory not found at %DEST_BASE%
    echo Please ensure Inventor CAM is installed.
    pause
    exit /b 1
)

REM Find Inventor CAM directory
echo Searching for Inventor CAM installation...
set FOUND=0

for /d %%D in ("%DEST_BASE%\Inventor CAM*") do (
    set DEST_DIR=%%D\Posts
    set FOUND=1
    goto :found
)

:found
if %FOUND%==0 (
    echo ERROR: Inventor CAM directory not found in %DEST_BASE%
    echo Please ensure Inventor CAM is installed.
    pause
    exit /b 1
)

REM Create Posts directory if it doesn't exist
if not exist "%DEST_DIR%" (
    echo Creating Posts directory: %DEST_DIR%
    mkdir "%DEST_DIR%"
)

echo.
echo Source: %SOURCE_DIR%
echo Destination: %DEST_DIR%
echo.

REM Copy files
echo Copying files...
echo.

if exist "%SOURCE_DIR%marlin_cnc_marlin20.cps" (
    copy /Y "%SOURCE_DIR%marlin_cnc_marlin20.cps" "%DEST_DIR%\"
    if %ERRORLEVEL% EQU 0 (
        echo [OK] marlin_cnc_marlin20.cps
    ) else (
        echo [FAILED] marlin_cnc_marlin20.cps
    )
) else (
    echo [NOT FOUND] marlin_cnc_marlin20.cps
)

if exist "%SOURCE_DIR%marlin_cnc_common.js" (
    copy /Y "%SOURCE_DIR%marlin_cnc_common.js" "%DEST_DIR%\"
    if %ERRORLEVEL% EQU 0 (
        echo [OK] marlin_cnc_common.js
    ) else (
        echo [FAILED] marlin_cnc_common.js
    )
) else (
    echo [NOT FOUND] marlin_cnc_common.js
)

if exist "%SOURCE_DIR%marlin_cnc_marlin20.json" (
    copy /Y "%SOURCE_DIR%marlin_cnc_marlin20.json" "%DEST_DIR%\"
    if %ERRORLEVEL% EQU 0 (
        echo [OK] marlin_cnc_marlin20.json
    ) else (
        echo [FAILED] marlin_cnc_marlin20.json
    )
) else (
    echo [NOT FOUND] marlin_cnc_marlin20.json
)

echo.
echo ====================================
echo Installation complete!
echo ====================================
echo.
echo Please restart Inventor CAM to see the new post-processor.
echo The post-processor will appear as "Marlin CNC Milling/Laser - Marlin 2.0"
echo in the post-processor list.
echo.

pause
