# File: create.ps1
# Author: Stanley Goodwin
# Description:
#   Creates a Code tab under This PC stored in the Local User.
#   Also adds registry keys to work properly.


# Code variables
$CodeFolder = "$env:USERPROFILE\Code"
$CodeIniFile = @"
[.ShellClassInfo]
IconResource=C:\WINDOWS\System32\SHELL32.dll,2
"@


# Create folder if it doesn't already exist
IF (Test-Path $CodeFolder) {
  Write-Host "Folder already exists. Skipping creation..."
}
ELSE {
  # Create Code folder
  New-Item -Path $CodeFolder -ItemType Directory
  (Get-Item $CodeFolder -Force).Attributes = "ReadOnly, Directory"

  # Create the folder's desktop.ini file
  Add-Content "$($CodeFolder)\desktop.ini" -Value $CodeIniFile
  (Get-Item "$($CodeFolder)\desktop.ini" -Force).Attributes = "Hidden, System, Archive"
}


# Add custom keys to registry
$regeditparams = @{
  FilePath     = "$Env:SystemRoot\REGEDIT.exe"
  ArgumentList = "/s", "$(Get-Location)\create.reg"
  Verb         = "RunAs"
  PassThru     = $true
  Wait         = $true
}
$addkeys = Start-Process @regeditparams
if ($addkeys.ExitCode -eq 0) { "Successfully added keys to registry!" }
else { "Failed to add keys to registry! Exit code: $($addkeys.ExitCode)" }


# Reload File Explorer
taskkill /F /IM explorer.exe
Start-Process explorer.exe