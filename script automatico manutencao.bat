@echo off 
echo.
echo     __________________
echo    / ____/_  __/ ____/
echo   / /_    / / / __/   
echo  / __/   / / / /___   
echo /_/     /_/ /_____/   
                      

echo Meu Script de Manutencao em lote de Fernando Teixeira Eleuterio

sfc /scannow

rem Comando DISM funciona nas vers�o Win10 e 11 
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth

rem Faz limpeza dos arquivos tempor�rios do Windows
del c:\Windows\Temp\* /s /q

rem Faz limpeza dos arquivos tempor�rios da pasta TEMP na ra�z
del /q/f/s %temp%\*

rem Faz limpeza dos arquivos temporarios dos usu�rios no appdata
/d %%F in (C:\Users\*) do del %%F\AppData\Local\Temp\* /s /q

rem defrag C: /U /V
defrag C: -f/v

shutdow -s