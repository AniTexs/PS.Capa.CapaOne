function Get-CapaOneMDMAppleVPP {
    [CmdletBinding()]
    param ()
    $BaseUri = "/organizations/{{OrgId}}/apple"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/vpp").content
    $response
}