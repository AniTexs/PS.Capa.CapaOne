function Get-CapaOneDeviceUpdate {
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