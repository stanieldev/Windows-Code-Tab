# File: remove.ps1
# Author: Stanley Goodwin
# Description:
#   Removes the Code tab keys from the registry.
#   The original folder and its data stays under %UserProfile%.


# Remove custom keys from registry
$regeditparams = @{
    FilePath     = "$Env:SystemRoot\REGEDIT.exe"
    ArgumentList = "/s", "$(Get-Location)\remove.reg"
    Verb         = "RunAs"
    PassThru     = $true
    Wait         = $true
}
$removekeys = Start-Process @regeditparams
if ($removekeys.ExitCode -eq 0) { "Successfully removed keys from registry!" }
else { "Failed to remove keys from registry! Exit code: $($removekeys.ExitCode)" }