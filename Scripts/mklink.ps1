function mklink ($link, $target) {
    New-Item -Path $link -ItemType SymbolicLink -Value $target
}