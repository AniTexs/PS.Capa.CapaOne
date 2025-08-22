function Get-CapaOneDeviceAODLogs {
    <#
    .SYNOPSIS
    Retrieves Admin On Demand logs for a device.
    .DESCRIPTION
    Gets AOD log entries for the specified device, optionally including installation status.
    .PARAMETER DeviceId
    Identifier of the device.
    .PARAMETER IncludeNotInstalled
    Include logs for actions that were not installed.
    .PARAMETER IncludeInstalled
    Include logs for actions that were installed.
    .EXAMPLE
    PS> Get-CapaOneDeviceAODLogs -DeviceId 123
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $DeviceId,
        [switch]
        $IncludeNotInstalled,
        [switch]
        $IncludeInstalled
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/adminondemand/device/$($DeviceId)")
    $Response.data | ForEach-Object {
        @{
            Date = [System.DateTimeOffset]::FromUnixTimeSeconds([Math]::Floor($_.timestamp / 1000)).UtcDateTime
            Username = $_.username
            LogType = $_.LogType
            Soruce = $_.Source
        }
    }
}