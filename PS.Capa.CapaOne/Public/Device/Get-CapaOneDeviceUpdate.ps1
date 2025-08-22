function Get-CapaOneDeviceUpdate {
    <#
    .SYNOPSIS
    Retrieves update status for a device.
    .DESCRIPTION
    Gets pending or installed updates for the specified device.
    .PARAMETER DeviceId
    Identifier of the device.
    .PARAMETER IncludeNotInstalled
    Include updates that are not installed.
    .PARAMETER IncludeInstalled
    Include updates that are already installed.
    .EXAMPLE
    PS> Get-CapaOneDeviceUpdate -DeviceId 1 -IncludeNotInstalled
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
    $Response = Invoke-CapaOneApi -Path "/organizations/$($Script:CapaOneStructure.OrgId)/device/$($DeviceId)/patch" -Method Get
    $Output = @()
    $Output += $Response | ForEach-Object {
        if($_.Status.Code -eq 302){
            $_
        }
    }
    if($IncludeNotInstalled.IsPresent){
        $Output += $Response | ForEach-Object {
            if($_.Status.Code -eq 404){
                $_
            }
        }
    }
    if($IncludeInstalled.IsPresent){
        $Output += $Response | ForEach-Object {
            if($_.Status.Code -eq 200){
                $_
            }
        }
    }

    return $Output
}