[![PSScriptAnalyzer](https://github.com/AniTexs/PS.Capa.CapaOne/actions/workflows/powershell.yml/badge.svg)](https://github.com/AniTexs/PS.Capa.CapaOne/actions/workflows/powershell.yml)
[![Publish to PowerShell Gallery](https://github.com/AniTexs/PS.Capa.CapaOne/actions/workflows/release.yml/badge.svg)](https://github.com/AniTexs/PS.Capa.CapaOne/actions/workflows/release.yml)


# Introduction
This Powershell Module provides a programmatic way to interact with CapaOne.
This is not a complete module and does not have every single API gateway inside it, you are welcome to create more in a PR.


# Installation

Install the module:
```pwsh
Install-Module PS.Capa.CapaOne
```
Import the Module
```pwsh
Import-Module PS.Capa.CapaOne
```


# Usage
## Authentication
```pwsh
# Require a local user in CapaOne, not a SSO user.
# Use the Username/Email & Password for the account
# I'd recommend to create a dedicated user for this with a loooong password.
$Credential = Get-Credential
Connect-CapaOne -Credential $CapaOneCredential
# Connect-CapaOne does not output anything.
```

## Get Devices
```pwsh
# Get All devices
Get-CapaOneDevice

# Search for device(s)
Get-CapaOneDevice -Name "{{ComputerName}}"
```
### Output:
```sh
id                 : **Device Id**
orgId              : 1234
serviceId          : 1234567890
deviceType         : Virtual
osName             : Microsoft Windows 11 Enterprise
name               : **HOSTNAME**
webUrl             : **CAPAONE WEB URL**
lastUpdate         : 20-08-2025 04:32:35
osStartUp          : 13-08-2025 01:49:48
serviceStartUp     : 13-08-2025 01:50:01
lastSetOffline     : 20-08-2025 04:32:25
lastCheckIn        : 22-08-2025 05:04:58
online             : True
virtual            : True
winget             : False
wingetVersion      : 
osVersion          : **REDACTED**
osSerial           : **REDACTED**
platform           : win_x64
agentVersion       : 1.1.1173.0
agentVersionPadded : **REDACTED**
state              : READY
motherboardUuid    : **REDACTED**
motherboardSerial  : **REDACTED**
hardDriverSerial   : 
aodContext         : False
tags               : **REDACTED**
configs            : 
enrollmentId       : 
software           : @{compliant=False; patchCount=3; failedPatchCount=1; severity=0; pendingReboot=False}
driver             : @{compliant=True; patchCount=0; isSupported=False}
```

## Get Groups
```pwsh
# Get All Groups
Get-CapaOneGroup

# Get Specific Group
Get-CapaOneGroup -Name "DK"

# Get Groups assigned to device
$Device = Get-CapaOneDevice -Name "{{ComputerName}}"
$Device | Get-CapaOneDeviceGroup
```

## Get Tags
```pwsh
Get-CapaOneTag
```

## All Commands
```
Add-CapaOneDeviceToGroup
Connect-CapaOne
Get-CapaOneApplication
Get-CapaOneConnectionResponse
Get-CapaOneContracts
Get-CapaOneCustomApp
Get-CapaOneCustomAppIcon
Get-CapaOneDevice
Get-CapaOneDeviceAODLogs
Get-CapaOneDeviceGroup
Get-CapaOneDeviceInventory
Get-CapaOneDeviceUpdate
Get-CapaOneGroup
Get-CapaOneIntegration
Get-CapaOneMDM
Get-CapaOneMDMAndroidEndpoint
Get-CapaOneMDMAppleApplication
Get-CapaOneMDMAppleCertificate
Get-CapaOneMDMAppleConfiguration
Get-CapaOneMDMAppleEndpoint
Get-CapaOneMDMAppleEnrollmentConfiguration
Get-CapaOneMDMAppleVPP
Get-CapaOneReport
Get-CapaOneSessionVariable
Get-CapaOneTag
Get-CapaOneUser
Get-CapaOneUserProfile
New-CapaOneGroup
Remove-CapaOneGroup
Sync-CapaOneIntegration
Update-CapaOneGroup
```