# List files
function lf { Get-ChildItem -Path $pwd -File }

# Lazy default Git add, commit, and push
function lagit { git add .; git commit -a -m "lazy commit $args"; git push origin main; }

# Reload profile
function reload { & $profile }

# Create empty file
function touch ($file) { "" | Out-File $file -Encoding ascii }

# List files with exa in long format and show all files
function ll { exa -l -a }

# List files with exa in tree format
function lt { exa -l --tree }

# Convert to JSON
function jj { $P | ConvertTo-Json -Depth 100 }

# List USB devices
function lsusb { Get-PnpDevice -PresentOnly | Where-Object { $_.InstanceId -match '^USB' } | Format-Table -Wrap -AutoSize }