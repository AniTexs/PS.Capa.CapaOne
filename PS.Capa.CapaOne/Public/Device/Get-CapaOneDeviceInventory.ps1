function Get-CapaOneDeviceInventory {
    <#
    .SYNOPSIS
    Retrieves inventory details for a device.
    .DESCRIPTION
    Returns security, software, hardware, and driver information for the specified device ID.
    .PARAMETER DeviceId
    Identifier of the device.
    .EXAMPLE
    PS> Get-CapaOneDeviceInventory -DeviceId 123
    #>
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