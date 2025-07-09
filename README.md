# RoboCupRescue Simulation Scripts for Windows

## Overview

This project provides PowerShell scripts designed to facilitate the execution of RoboCupRescue Simulation programs on Windows environments.

## Problem Statement

Windows does not natively support running `.sh` (shell) scripts without WSL (Windows Subsystem for Linux). Furthermore, the `kill.sh` script (used for stopping RoboCupRescue Simulation server) fails on Windows due to fundamental differences in process handling.

## Solution

This project addresses these challenges by offering:

* **Script Execution with Git Bash**: PowerShell scripts that leverage Git Bash for executing the necessary `.sh` files. Git Bash is usually installed by default alongside Git.
* **Program Stop Script for Windows Environments**: A script designed to correctly identify and stop RoboCupRescue Simulation processes, by following Windows' native process behavior.

Since Git installation is a common prerequisite for RoboCupRescue Simulation development, Git Bash is assumed to be already available in developers' environments.

## Usage

### Setup

First, you need to configure the scripts for your environment.

Create a file named `rcrs-config.psd1`. You can do this by copying and renaming the provide sample file, `rcrs-config.psd1.sample`.

In this configuration file, you must specify the following paths:

- The directory path to your RCRS Server
- The directory path to your RCRS Client (rescue agents)
- The full file path to `bash.exe` from your Git Bash installation

### Starting the Simulation

To run the simulation, run the following scripts:

```PowerShell
./start-server.ps1
./start-client.ps1
```

Each script will launch its process in new terminal window. This means the output logs will appear in the new windows, leaving your original terminal free for other commands.

### Stopping the Simulation

To stop the simulation, run the following script:

```
./stop-rcrs.ps1
```

Unlike the `kill.sh` script provided by `rcrs-server`, this script also terminates the client processes. Furthermore, while `kill.sh` broadly terminates `java` processes, `stop-rcrs.ps1` specifically identifies and terminates individual simulation components and client. This prevents the accidental closure of other unrelated Java applications on your system.

## License

This project is licensed under the [MIT License](LICENSE).
