# Run `Measure-Script -Top 5 $profile` (installed from Module `PSProfiler` to profile this

# Initialize Starship prompt (~300ms)
Invoke-Expression (&starship init powershell)

$ENV:STARSHIP_CONFIG = "$HOME\.config\starship.toml" # Default location

$ENV:STARSHIP_CACHE = "$HOME\AppData\Local\Temp" # Logging

$ENV:TERM = "xterm-256color"

# Set default encoding to UTF8 (cmdlets such as Out-File and Set-Content will use UTF-8 encoding by default) (~5ms)
# $PSDefaultParameterValues['*:Encoding'] = 'utf8'
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# Import all scripts (not subfolder) (~65ms)
$scriptPath = Join-Path $PSScriptRoot "Scripts"
Get-ChildItem -Path $scriptPath -Filter *.ps1 | ForEach-Object { . $_.FullName }

# Modules

# This has error
# PowerToys CommandNotFound module to recommend packages from Winget
# Import-Module -Name Microsoft.WinGet.CommandNotFound


# # Very slow to check (~350ms)
# # Ensure Terminal-Icons module is installed before importing
# if (-not (Get-Module -ListAvailable -Name Terminal-Icons)) {
    #     Install-Module -Name Terminal-Icons -Scope CurrentUser -Force -SkipPublisherCheck
    # }
    # Import-Module -Name Terminal-Icons
    
    # Aliases
    # Set-Alias vi vim
    # Set-Alias nvi neovide # nv is taken as New-Variable in pwsh
    # Set-Alias -Name 'cat' -Value 'bat' -Force -Option 'Constant', 'AllScope' # Not good practice to override bulit-in aliases
    
#f45873b3-b655-43a6-b217-97c00aa0db58
(& uv generate-shell-completion powershell) | Out-String | Invoke-Expression
(& uvx --generate-shell-completion powershell) | Out-String | Invoke-Expression
