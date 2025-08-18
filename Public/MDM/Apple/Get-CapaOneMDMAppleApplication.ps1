function Get-CapaOneMDMAppleApplication {
    [CmdletBinding()]
    param ()
    $BaseUri = "/organizations/{{OrgId}}/apple"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/application")
    $response
}