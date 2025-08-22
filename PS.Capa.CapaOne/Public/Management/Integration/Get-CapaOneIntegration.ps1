function Get-CapaOneIntegration {
    [CmdletBinding()]
    param ()
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/management/integration")
    $response
}