Invoke-Expression (&starship init powershell)

$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml" # Default location

$ENV:STARSHIP_CACHE = "$HOME\AppData\Local\Temp" # Logging

$ENV:TERM = "xterm-256color"

# Set default encoding to UTF8 (cmdlets such as Out-File and Set-Content will use UTF-8 encoding by default)
# $PSDefaultParameterValues['*:Encoding'] = 'utf8'
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding


# Functions/Imports
# . C:\Users\Admin\Documents\PowerShell\Scripts\sudo.ps1 (does not seem to work)
. C:\Users\Admin\Documents\PowerShell\Scripts\basic_fn.ps1
. C:\Users\Admin\Documents\PowerShell\Scripts\prompt.ps1
. C:\Users\Admin\Documents\PowerShell\Scripts\psreadline.ps1
. C:\Users\Admin\Documents\PowerShell\Scripts\chocolatey.ps1
. C:\Users\Admin\Documents\PowerShell\Scripts\ya.ps1
. C:\Users\Admin\Documents\PowerShell\Scripts\zoxide.ps1
# . C:\Users\Admin\Documents\PowerShell\Scripts\pyvenv.ps1 (switching to use uv for env management)
. C:\Users\Admin\Documents\PowerShell\Scripts\mklink.ps1

# Modules

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module
Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58

# Ensure Terminal-Icons module is installed before importing
if (-not (Get-Module -ListAvailable -Name Terminal-Icons)) {
    Install-Module -Name Terminal-Icons -Scope CurrentUser -Force -SkipPublisherCheck
}
Import-Module -Name Terminal-Icons

# Aliases
# Set-Alias vi vim
Set-Alias nvi neovide # nv is taken as New-Variable in pwsh
# Set-Alias -Name 'cat' -Value 'bat' -Force -Option 'Constant', 'AllScope' # Not good practice to override bulit-in aliases

