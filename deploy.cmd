@echo off
rem Copies the mod into your Zomboid folder: mods\ to play it, Workshop\ to upload it.
set MOD=ApocalypseAndChill
set WS=%USERPROFILE%\Zomboid\Workshop\%MOD%

rmdir /S /Q "%USERPROFILE%\Zomboid\mods\%MOD%" 2>nul
xcopy "%~dp0Contents\mods\%MOD%" "%USERPROFILE%\Zomboid\mods\%MOD%" /Y /I /E /Q >nul

rmdir /S /Q "%WS%" 2>nul
xcopy "%~dp0Contents" "%WS%\Contents" /Y /I /E /Q >nul
copy /Y "%~dp0workshop.txt" "%WS%" >nul
if exist "%~dp0preview.png" copy /Y "%~dp0preview.png" "%WS%" >nul

echo [%MOD%] Deployed.
