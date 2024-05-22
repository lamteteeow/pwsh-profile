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
. C:\Users\Admin\Documents\PowerShell\Scripts\pyvenv.ps1

# Modules

#34de4b3d-13a8-4540-b76d-b9e8d3851756 PowerToys CommandNotFound module
Import-Module "C:\Program Files\PowerToys\WinUI3Apps\..\WinGetCommandNotFound.psd1"
#34de4b3d-13a8-4540-b76d-b9e8d3851756

# Ensure Terminal-Icons module is installed before importing
if (-not (Get-Module -ListAvailable -Name Terminal-Icons)) {
    Install-Module -Name Terminal-Icons -Scope CurrentUser -Force -SkipPublisherCheck
}
Import-Module -Name Terminal-Icons

# Aliases
# Set-Alias vi vim
Set-Alias nvi neovide # nv is taken as New-Variable in pwsh
# Set-Alias -Name 'cat' -Value 'bat' -Force -Option 'Constant', 'AllScope' # Not good practice to override bulit-in aliases
