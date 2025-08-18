function Get-CapaOneDevice {
    [CmdletBinding()]
    param (
        [string]
        $Name,
        [ValiDateSet("Laptop","Desktop","Virtual")]
        [string]
        $Type
    )
    $Devices = (Invoke-CapaOneApi -Path "/organizations/{{OrgId}}/device/list").content
    if(-not [String]::IsNullOrWhiteSpace($Name)){
        $Devices = $Devices | Where-Object name -Like $Name
    }
    if(-not [String]::IsNullOrWhiteSpace($Type)){
        $Devices = $Devices | Where-Object deviceType -eq $Name
    }
    foreach ($d in $devices) {
        $d.PSObject.TypeNames.Insert(0,'Capa.CapaOne.Device')
    }
    return $Devices
}