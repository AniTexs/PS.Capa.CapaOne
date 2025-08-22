function Get-CapaOneTag {
    [CmdletBinding()]
    param ()
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/tag")
    $response.Content
}