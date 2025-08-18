function Get-CapaOneDeviceInventory {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $DeviceId
    )
    @{
        Security =(Invoke-CapaOneApi -Path "/organizations/$($Script:CapaOneStructure.OrgId)/device/$DeviceId/inventory/security").dictionaries
        Software =(Invoke-CapaOneApi -Path "/organizations/$($Script:CapaOneStructure.OrgId)/device/$DeviceId/inventory/software").dictionary
        Hardware =(Invoke-CapaOneApi -Path "/organizations/$($Script:CapaOneStructure.OrgId)/device/$DeviceId/inventory/hardware").dictionaries
        Drivers = (Invoke-CapaOneApi -Path "/organizations/$($Script:CapaOneStructure.OrgId)/device/$DeviceId/inventory/driver").dictionary
    }
}