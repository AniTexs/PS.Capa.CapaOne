function Get-CapaOneMDMAppleCertificate {
    [CmdletBinding()]
    param ()
    $BaseUri = "/organizations/{{OrgId}}/apple"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/cluster")
    $response
}