function Get-CapaOneDeviceAODLogs {
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