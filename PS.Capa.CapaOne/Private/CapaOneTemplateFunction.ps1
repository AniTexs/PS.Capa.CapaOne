function FunctionName {
    [CmdletBinding()]
    param ()
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/device/list")
}