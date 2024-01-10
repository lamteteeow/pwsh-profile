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

