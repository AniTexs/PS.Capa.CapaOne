function Remove-CapaOneDeviceFromGroup {
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