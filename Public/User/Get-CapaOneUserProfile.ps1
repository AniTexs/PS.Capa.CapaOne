function Get-CapaOneUserProfile {
    [CmdletBinding()]
    param ()
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/user/profile")
    $response
}