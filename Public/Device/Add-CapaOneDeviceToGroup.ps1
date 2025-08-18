function Add-CapaOneDeviceToGroup {
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