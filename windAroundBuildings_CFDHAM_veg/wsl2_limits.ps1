# Check global WSL2 configuration
$wslConfigPath = "$env:USERPROFILE\.wslconfig"
if (Test-Path $wslConfigPath) {
    Write-Host "Global WSL2 configuration (.wslconfig):"
    Get-Content $wslConfigPath
} else {
    Write-Host "No global .wslconfig file found."
}

# Check WSL2 kernel parameters
wsl --exec cat /proc/cmdline

# Check memory info
Write-Host "`nMemory Info:"
wsl --exec free -h

# Check CPU info
Write-Host "`nCPU Info:"
wsl --exec lscpu | Select-String -Pattern "CPU\(s\):|Thread\(s\) per core:|Core\(s\) per socket:"

# Check disk usage
Write-Host "`nDisk Usage:"
wsl --exec df -h /