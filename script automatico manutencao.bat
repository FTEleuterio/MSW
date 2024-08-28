@echo off 
echo.
echo     __________________
echo    / ____/_  __/ ____/
echo   / /_    / / / __/   
echo  / __/   / / / /___   
echo /_/     /_/ /_____/   
                      

echo Meu Script de Manutencao em lote de Fernando Teixeira Eleuterio

sfc /scannow

rem Comando DISM funciona nas versão Win10 e 11 
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth

rem Faz limpeza dos arquivos temporários do Windows
del c:\Windows\Temp\* /s /q

rem Faz limpeza dos arquivos temporários da pasta TEMP na raíz
del /q/f/s %temp%\*

rem Faz limpeza dos arquivos temporarios dos usuários no appdata
/d %%F in (C:\Users\*) do del %%F\AppData\Local\Temp\* /s /q

rem defrag C: /U /V
defrag C: -f/v

rem CASO PRECISAR SOMENTE DESFRAGMENTAR COMENTE A LINHA DO CHKDSK
rem Verificação e reparo do disco
@echo off
echo y | chkdsk C: /r /f

rem reiniciar
shutdown /r /t 0
rem desligar
rem shutdown /s /t 0
