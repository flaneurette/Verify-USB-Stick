@echo off
setlocal

REM Choose mode: GENERATE or VERIFY
set MODE=VERIFY

if /I "%MODE%"=="GENERATE" (
    for /R %%F in (*) do (
        if /I not "%%~xF"==".sha256" (
            certutil -hashfile "%%F" SHA256 > "%%F.sha256"
        )
    )
    echo Hash files generated.
) else if /I "%MODE%"=="VERIFY" (
    for /R %%F in (*.sha256) do (
        set HASHFILE=%%F
        set FILE=%%~dpnF
        for /f "skip=1 tokens=*" %%H in ('type "%%F"') do (
            certutil -hashfile "%%~dpnF%%~xF" SHA256 | find /i "%%H" >nul
            if errorlevel 1 (
                echo Verification FAILED: %%~dpnF%%~xF
            ) else (
                echo Verified: %%~dpnF%%~xF
            )
            goto :next
        )
        :next
    )
    echo Verification complete.
)

pause
