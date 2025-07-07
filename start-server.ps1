# start-server.ps1

# Load the configuration file
$config = Import-PowerShellDataFile -Path "rcrs-config.psd1"

# Retrieve the server directory path and Git Bash path
$rcrsServer = $config.RCRSServer
$gitBash = $config.GitBash

Write-Host "Starting RoboCupRescue Simulation server..."
Write-Host "Server: $rcrsServer"
Write-Host "Git Bash: $gitBash"

# Construct the path
$scriptsDir = Join-Path -Path $rcrsServer -ChildPath "scripts"
$startScript = Join-Path -Path $scriptsDir -ChildPath "start.sh"

# Start server
try {
    $process = Start-Process -FilePath "$gitBash" `
                             -ArgumentList $startScript `
                             -WorkingDirectory $scriptsDir `
                             -PassThru
    Write-Host "RoboCupRescue Rescue server started (PID: $($process.Id))"
}
catch {
    Write-Error "Failed to start server: $($_.Exception.Message)"
    exit 1
}
