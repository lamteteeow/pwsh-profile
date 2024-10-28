# Make sure the (current-user, current-host) $PROFILE file exists.
if (-not (Test-Path $PROFILE)) { $null = New-Item -Force $PROFILE }

# Import PSReadLine
if ($host.Name -eq 'ConsoleHost') {
    Import-Module PSReadLine
    Import-Module -Name Terminal-Icons
}

# Change hint color to cyan
Set-PSReadLineOption -Colors @{ 
    # InlinePrediction = 'red'
    Default = 'magenta'
    # Command                = $PSStyle.Foreground.FromRGB(0x0000FF)
    # Comment                = $PSStyle.Foreground.FromRGB(0x006400)
    # ContinuationPrompt     = $PSStyle.Foreground.FromRGB(0x0000FF)
    # Default                = $PSStyle.Foreground.FromRGB(0x0000FF)
    # Emphasis               = $PSStyle.Foreground.FromRGB(0x287BF0)
    # Error                  = $PSStyle.Foreground.FromRGB(0xE50000)
    # InlinePrediction       = $PSStyle.Foreground.FromRGB(0x93A1A1)
    # Keyword                = $PSStyle.Foreground.FromRGB(0x00008b)
    # ListPrediction         = $PSStyle.Foreground.FromRGB(0x06DE00)
    # Member                 = $PSStyle.Foreground.FromRGB(0x000000)
    # Number                 = $PSStyle.Foreground.FromRGB(0x800080)
    # Operator               = $PSStyle.Foreground.FromRGB(0x757575)
    # Parameter              = $PSStyle.Foreground.FromRGB(0x000080)
    # String                 = $PSStyle.Foreground.FromRGB(0x8b0000)
    # Type                   = $PSStyle.Foreground.FromRGB(0x008080)
    # Variable               = $PSStyle.Foreground.FromRGB(0xff4500)
    # ListPredictionSelected = $PSStyle.Background.FromRGB(0x93A1A1)
    # Selection              = $PSStyle.Background.FromRGB(0x00BFFF)
}

# With these bindings, up arrow/down arrow will work like PowerShell/cmd if the current command line is blank.
# If you've entered some text though, it will search the history for commands that start with the currently entered text.
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# Enable bash style completion without using Emacs mode (not roll but menu style)
# Set-PSReadLineKeyHandler -Key Tab -Function Complete

# If the character following the cursor is not the quote typed, then a matched pair of quotes is inserted and the cursor is placed inside the the matched quotes.
# If the character following the cursor is the quote typed, the cursor is simply moved past the quote without inserting anything.
Set-PSReadLineKeyHandler -Chord '"', "'" `
    -BriefDescription SmartInsertQuote `
    -LongDescription "Insert paired quotes if not already on a quote" `
    -ScriptBlock {
    param($key, $arg)

    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

    if ($line.Length -gt $cursor -and $line[$cursor] -eq $key.KeyChar) {
        # Just move the cursor
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor + 1)
    }
    else {
        # Insert matching quotes, move cursor to be in between the quotes
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert("$($key.KeyChar)" * 2)
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor - 1)
    }
}