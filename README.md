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
