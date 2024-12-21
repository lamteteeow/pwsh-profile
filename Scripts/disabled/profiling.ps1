$p = 0
1..10 | ForEach-Object {
    Write-Progress -Id 1 -Activity 'pwsh' -PercentComplete $_
    $p += (Measure-Command {
            # Remove "-noprofile" to include profile loading time
            pwsh -noprofile -command 1
        }).TotalMilliseconds
}
Write-Progress -id 1 -Activity 'profile' -Completed
$p = $p / 10
$p