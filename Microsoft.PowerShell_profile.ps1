Invoke-Expression (&starship init powershell)

$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml" # Default location

$ENV:STARSHIP_CACHE = "$HOME\AppData\Local\Temp" # Logging


# Functions/Imports
. C:\Users\Admin\Documents\PowerShell\Scripts\sudo.ps1
. C:\Users\Admin\Documents\PowerShell\Scripts\basic_fn.ps1
. C:\Users\Admin\Documents\PowerShell\Scripts\prompt.ps1
. C:\Users\Admin\Documents\PowerShell\Scripts\psreadline.ps1
. C:\Users\Admin\Documents\PowerShell\Scripts\chocolatey.ps1


# Aliases
Set-Alias vi vim
# Set-Alias -Name 'cat' -Value 'bat' -Force -Option 'Constant', 'AllScope' # Not good practice to override bulit-in aliases


#34de4b3d-13a8-4540-b76d-b9e8d3851756 PowerToys CommandNotFound module

Import-Module "C:\Program Files\PowerToys\WinUI3Apps\..\WinGetCommandNotFound.psd1"
#34de4b3d-13a8-4540-b76d-b9e8d3851756
