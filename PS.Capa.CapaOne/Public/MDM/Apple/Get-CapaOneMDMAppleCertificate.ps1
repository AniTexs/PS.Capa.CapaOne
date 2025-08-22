function Get-CapaOneMDMAppleCertificate {
    <#
    .SYNOPSIS
    Retrieves Apple MDM certificates.
    .DESCRIPTION
    Calls the Apple cluster endpoint to obtain certificate information.
    .EXAMPLE
    PS> Get-CapaOneMDMAppleCertificate
    #>
    [CmdletBinding()]
    param ()
    $BaseUri = "/organizations/{{OrgId}}/apple"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/cluster")
    $response
}