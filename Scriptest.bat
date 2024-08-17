@echo off 
echo.
echo     __________________
echo    / ____/_  __/ ____/
echo   / /_    / / / __/   
echo  / __/   / / / /___   
echo /_/     /_/ /_____/   
                       

:menu
rem cls
rem pular linhas
echo.
echo. 
echo Meu Script de Manutencao de Fernando Teixeira Eleuterio

rem pular linhas
echo.
      

echo 1. Reparo de Arquivos de Sistema
echo 2. Reparo da Imagem do Sistema
echo 3. Limpeza de Arquivos Temporarios
echo 4. Desfragmentar Unidade C
echo 5. Informacao de Sistema
echo 6. Informacao Serie Bios
echo 7. Informacao de Bateria Notebook
echo 8. Sair

set /p escolha=Escolha uma opcao: 
if "%escolha%"=="1" goto opcao1
if "%escolha%"=="2" goto opcao2
if "%escolha%"=="3" goto opcao3
if "%escolha%"=="4" goto opcao4
if "%escolha%"=="5" goto opcao5
if "%escolha%"=="6" goto opcao6
if "%escolha%"=="7" goto opcao7
if "%escolha%"=="8" goto sair

goto menu

:opcao1
echo Voce escolheu a opcao 1!
sfc /scannow
pause
goto menu

:opcao2
echo Voce escolheu a opcao 2!
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth
pause

goto menu


:opcao3
echo Voce escolheu a opcao 3!
rem Faz limpeza dos arquivos tempor�rios do Windows
del c:\Windows\Temp\* /s /q
rem Faz limpeza dos arquivos tempor�rios da pasta TEMP na ra�z
del /q/f/s %temp%\*
rem Faz limpeza dos arquivos temporarios dos usu�rios no appdata
/d %%F in (C:\Users\*) do del %%F\AppData\Local\Temp\* /s /q

pause
goto menu

:opcao4
echo Voce escolheu a opcao 4!
rem defrag C: /U /V
defrag C: -f /v
rem se for fazer o script em execu��o em lote colocar shutdow -s no final para que ao concluir a desfragmenta��o o comando shutdow execute sem precisar precionar a tecla

pause
goto menu

:opcao5
echo Voce escolheu a opcao 5!
rem Verifica informa��es completas do Sistema
systeminfo

pause
goto menu

:opcao6
echo Voce escolheu a opcao 6!
rem Verifica n�mero de s�rie da BIOS
wmic bios get serialnumber

pause
goto menu


:opcao7
echo Voce escolheu a opcao 7!
rem Informa��o da bateria gerando arqwuivo .html
powercfg /batteryreporte
pause
goto menu

:opcao8
:sair
exit