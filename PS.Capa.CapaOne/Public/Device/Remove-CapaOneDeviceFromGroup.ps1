function Remove-CapaOneDeviceFromGroup {
    <#
    .SYNOPSIS
    Removes devices from a CapaOne group.
    .DESCRIPTION
    Unassigns one or more devices from the specified group.
    .PARAMETER GroupId
    Identifier of the group.
    .PARAMETER DeviceId
    One or more device identifiers to remove.
    .EXAMPLE
    PS> Remove-CapaOneDeviceFromGroup -GroupId 10 -DeviceId 1,2
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
    # https://dash.capaone.com/api/organizations/145/management/group/61f3b53ce0dd3767e7c92bf6/windows/endpoint
    $BaseUri = "/organizations/{{OrgId}}"
    $Payload = @{
        endpointRefIds = $DeviceId
    }
    $response = (Invoke-CapaOneApi -Path "$BaseUri/management/group/$GroupId/windows/endpoint" -Method Delete -Payload $Payload)
}