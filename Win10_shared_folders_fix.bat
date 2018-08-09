@echo off
goto check_Permissions

:check_Permissions
    echo Administrative permissions required.
    echo Detecting permissions...
    echo.
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
        goto autoServices
    ) else (
        echo Failure: Execute this script with Administrative permissions.
        goto end
    )

:autoServices 
    sc config Browser start= auto
    sc config FDPHost start= auto
    sc config FDResPub start= auto
    sc config NetMan start= auto
    sc config UPnPHost start= auto
    sc config PNRPSvc start= auto
    sc config P2PSvc start= auto
    sc config P2PIMSvc start= auto
    echo.
    echo ----------------------------------------------------------------
    echo   End of script, Have a good time
    echo ----------------------------------------------------------------
    goto end

:end
    pause