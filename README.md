# Verify-USB-Stick
Verify files on a USB stick, to detect if stick has gone corrupted.

## Installation

Place the `generate_hashes.bat` file on a USB stick and double click it to create hashes for all files.

Use the `recursive.bat` to scan all folders instead of the root.

## Verify

Lateron, you can verify the files again in powershell:

```powershell
Get-FileHash file.bin -Algorithm SHA256
```

## Recursive

If you used `recursive.bat` run `check-recursive.bat`
