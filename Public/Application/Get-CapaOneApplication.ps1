function Get-CapaOneApplication {
    [CmdletBinding()]
    param ()
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/application")
    $response.content
}