@echo off
color 0a
mode con:cols=70 lines=35
title WindowsTool Version: 1.31.03.17

:beginOfProgram
echo 	Welcome!
echo 	Time: [%time%][%date%]
echo 	Version: 1.31.03.17
goto :mainOfProgram

:mainOfProgram
echo [--------------------------------------------------------------------]
echo [ 0 = Exit                     A = ...
echo [ 1 = Tools Color              B = ...
echo [ 2 = Shutdown your computer   C = Control Pannel
echo [ 3 = Restart your computer    D = ...
echo [ 4 = Show Wi-Fi Password      E = ...
echo [____________________________________________________________________]
echo **********************************************************************
echo [%time%] Enter your number or string:
set /p var_main=
if %var_main%==0 goto :endOfProgram
if %var_main%==1 goto :colorProgram
if %var_main%==2 goto :shutdownPC
if %var_main%==3 goto :restartPC
if %var_main%==4 goto :showWiFi

if %var_main%==c goto :openControl
if %var_main%==C goto :openControl

	:colorProgram
	echo **********************************************************************
	echo [             0 = Black                   8 = Gray                   ]
    echo [             1 = Blue                    9 = Light Blue             ]
    echo [             2 = Green                   A = Light Green            ]
    echo [             3 = Aqua                    B = Light Aqua             ]
    echo [             4 = Red                     C = Light Red              ]
    echo [             5 = Purple                  D = Light Purple           ]
    echo [             6 = Yellow                  E = Light Yellow           ]
    echo [             7 = White                   F = Bright White           ]
    echo **********************************************************************
    echo [%time%] Enter your color:
    set /p var_color=
    color %var_color%
    echo [%time%] ##############################################... Done!
    goto :backOfProgram

    :cancelPC
    echo [%time%] Enter 0 (cancel) or 00 (continue):
    set /p var_cancel=
    if %var_cancel%==0 (
    		shutdown /a
    		cls
    		echo [%time%] ##############################################... Done!
    		echo [%time%] Logoff is cancelled.
    		goto :backOfProgram
    	)

    :shutdownPC
	echo [%time% ========================================= %date%]
    echo [%time%] Enter your seconds:
    set /p var_shutdown=
    shutdown /s /t %var_shutdown%
    call :cancelPC

    :restartPC
	echo [%time% ========================================= %date%]
    echo [%time%] Enter your seconds:
    set /p var_restart=
    shutdown /r /t %var_restart%
    call :cancelPC

    :showWiFi
    echo [%time%] Enter to show profile
    pause
    mode con:cols=80 lines=40
    netsh wlan show profiles
	echo [%time% ========================================= %date%]
	echo [%time%] Enter profile name:
	set /p var_profileWiFi=
	netsh wlan show profiles name="%var_profileWiFi%" key=clear
	echo [%time% ========================================= %date%]
	echo [%time%] Key Content is your Wi-Fi Password.
	pause >null
	goto :backOfProgram

	:openControl
	control
	cls
	mode con:cols=70 lines=35
	echo [%time%] ##############################################... Done!
	goto :backOfProgram

:backOfProgram
echo [####################################################################]
echo [                              1 = Home                              ]
echo [                              0 = Exit                              ]
echo [____________________________________________________________________]
echo **********************************************************************
echo [%time%] Enter your choose:
set /p var_back=
if %var_back%==1 (
		cls
		mode con:cols=70 lines=35
		goto :beginOfProgram
	)
if %var_back%==0 (
		cls
		mode con:cols=70 lines=35
		goto :endOfProgram
	)

:endOfProgram
echo [####################################################################]
echo [ +, Design by bvtri                    +, Author: bvtri             ]
echo [ +, Mailto: bvtrivn@gmail.com          +, FB: fb.com/username       ]
echo [____________________________________________________________________]
pause >null
exit