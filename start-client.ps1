# start-client.ps1

# Load the configuration file
$config = Import-PowerShellDataFile -Path "rcrs-config.psd1"

# Retrieve the client directory path
$rcrsClient = $config.RCRSClient

Write-Host "Starting RoboCupRescue Simulation client..."
Write-Host "Client: $rcrsClient"

# Construct the gradlew path and args
$gradlew = Join-Path -Path $rcrsClient -ChildPath "gradlew.bat"
$loader = "adf.impl.DefaultLoader"
$params = $args -join " "
$gradlewArgs = "launch --args=`"$loader $params`""

# Start client
try {
    $process = Start-Process -FilePath $gradlew `
                             -ArgumentList $gradlewArgs `
                             -WorkingDirectory $rcrsClient `
                             -PassThru
    Write-Host "RoboCupRescue Rescue client started (PID: $($process.Id))"
}
catch {
    Write-Error "Failed to start client: $($_.Exception.Message)"
    exit 1
}
