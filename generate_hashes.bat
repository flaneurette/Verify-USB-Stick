@echo off
setlocal

set OUTFILE=hashes_sha256.txt
if exist "%OUTFILE%" del "%OUTFILE%"

for %%F in (*) do (
    if /I not "%%~nxF"=="%OUTFILE%" (
        echo %%~nxF>>"%OUTFILE%"
        certutil -hashfile "%%F" SHA256>>"%OUTFILE%"
        echo.>>"%OUTFILE%"
    )
)

echo Done.
pause
