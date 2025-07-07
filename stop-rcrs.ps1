# stop-rcrs.ps1

# Load the configuration file
$config = Import-PowerShellDataFile -Path "rcrs-config.psd1"

# Retrieve the server and client directory path
$rcrsServer = $config.RCRSServer
$rcrsClient = $config.RCRSClient

$javaProcess = Get-Process -Name "java"

foreach ($process in $javaProcess) {
    $commandLine = $process.CommandLine
    $processType = $null
    if ($commandLine -like "*kernel.StartKernel*") {
        $processType = "kernel (server)"
    }
    if ($commandLine -like "*collapse.CollapseSimulator*") {
        $processType = "collapse simulator (server)"
    }
    if ($commandLine -like "*clear.ClearSimulator*") {
        $processType = "clear simulator (server)"
    }
    if ($commandLine -like "*traffic3.simulator.TrafficSimulator*") {
        $processType = "traffic simulator (server)"
    }
    if ($commandLine -like "*misc.MiscSimulator*") {
        $processType = "misc simulator (server)"
    }
    if ($commandLine -like "*sample.SampleViewer*") {
        $processType = "viewer (server)"
    }
    if ($commandLine -like "*sample.SampleCivilian*") {
        $processType = "civilian (server)"
    }

    if ($commandLine -like "*adf.core.Main*") {
        $processType = "agents (client)"
    }

    if ($null -eq $processType) {
        continue # Not target
    }

    Stop-Process -Id $process.Id
    Write-Host "Stopped $processType (PID: $($process.Id))"
}

$bashProcess = Get-Process -Name "bash"

foreach ($process in $bashProcess) {
    $commandLine = $process.CommandLine
    $processType = $null

    if ($commandLine -like "*start.sh*") {
        $processType = "bash to start server"
    }

    if ($null -eq $processType) {
        continue # Not target
    }

    Stop-Process -Id $process.Id
    Write-Host "Stopped $processType (PID: $($process.Id))"
}
