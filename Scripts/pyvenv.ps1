# under development
function pyvenv {
    param (
        [switch]$Create,
        [switch]$Activate,
        [string]$PythonVersion,
        [string]$OutputDirectory = (Get-Location).Path
    )

    $venvPath = Join-Path -Path $OutputDirectory -ChildPath "venv"

    if ($Create) {
        Write-Host "asdasdasd"

        # Check if the venv folder already exists
        if (-not (Test-Path $venvPath)) {
            # Create the venv folder
            New-Item -ItemType Directory -Path $venvPath | Out-Null
        }
        switch ($PythonVersion) {
            "10" { python310 -m venv . }
            "11" { python311 -m venv . }
            "12" { python3 -m venv . }
            Default { Write-Host "Unsupported Python version flag. Currently 10, 11 or 12." }
        }
    }

    if ($Activate) {
        # Activate the virtual environment
        $activateScript = Join-Path -Path $venvPath -ChildPath "Scripts\Activate.ps1"
        if (Test-Path $activateScript) {
            & $activateScript
        }
        else {
            Write-Host "Failed to activate the virtual environment."
        }
    }
}