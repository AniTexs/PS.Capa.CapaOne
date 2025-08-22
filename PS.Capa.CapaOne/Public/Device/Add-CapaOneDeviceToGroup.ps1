function Add-CapaOneDeviceToGroup {
    <#
    .SYNOPSIS
    Adds devices to a CapaOne group.
    .DESCRIPTION
    Assigns one or more devices to the specified group.
    .PARAMETER GroupId
    Identifier of the group.
    .PARAMETER DeviceId
    One or more device identifiers to add.
    .EXAMPLE
    PS> Add-CapaOneDeviceToGroup -GroupId 10 -DeviceId 1,2
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $GroupId,
        [Parameter(Mandatory)]
        [string[]]
        $DeviceId
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $Payload = @{
        endpointRefIds = $DeviceId
    }
    $response = (Invoke-CapaOneApi -Path "$BaseUri/management/group/$GroupId/windows/endpoint" -Method Put -Payload $Payload)
}