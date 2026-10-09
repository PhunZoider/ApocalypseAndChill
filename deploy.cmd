@echo off
rem Copies the mod into your local Zomboid mods folder for testing.
rmdir /S /Q "%USERPROFILE%\Zomboid\mods\ApocalypseAndChill" 2>nul
xcopy "%~dp0Contents\mods\ApocalypseAndChill" "%USERPROFILE%\Zomboid\mods\ApocalypseAndChill" /Y /I /E /Q
