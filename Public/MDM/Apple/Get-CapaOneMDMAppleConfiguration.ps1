function Get-CapaOneMDMAppleConfiguration {
    [CmdletBinding()]
    param ()
    $BaseUri = "/organizations/{{OrgId}}/apple"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/configuration")
    $response
}