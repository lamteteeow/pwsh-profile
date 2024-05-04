# List files (disabled due to lf used for lf file manager)
# function lf { Get-ChildItem -Path $pwd -File }

# Lazy default Git add, commit, and push
function lagit { git add .; git commit -a -m "lazy commit $args"; git push origin main; }

# Lazy Git cache clear
function lacache { git rm -r --cached .; git add .; git commit -m "clear cache"; }

# Lazy Git revert to last commit
function larevert { git reset --hard HEAD~1;}

# Reload profile
function reload { & $profile }

# Create empty file
function touch ($file) { "" | Out-File $file -Encoding ascii }

# List files with lsd in long format and show all files
function ll { lsd -l -a }

# List files with exa in tree format
function lt { lsd -l --tree }

# Convert to JSON
function jj { $P | ConvertTo-Json -Depth 100 }

# List USB devices
function lsusb { Get-PnpDevice -PresentOnly | Where-Object { $_.InstanceId -match '^USB' } | Format-Table -Wrap -AutoSize }

# Find files
function ff($name) {
    Get-ChildItem -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | ForEach-Object {
        Write-Output "$($_.directory)\$($_)"
    }
}

# Network Utilities
function Get-PubIP { (Invoke-WebRequest http://ifconfig.me/ip).Content }

# Find and Replace with sed
function sed($file, $find, $replace) {
    (Get-Content $file).replace("$find", $replace) | Set-Content $file
}

# Properties and definition
function which($name) {
    Get-Command $name | Select-Object -ExpandProperty Definition
}

# Kill process
function pkill($name) {
    Get-Process $name -ErrorAction SilentlyContinue | Stop-Process
}
