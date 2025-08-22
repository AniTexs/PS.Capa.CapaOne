function Get-CapaOneMDMAppleEnrollmentConfiguration {
    <#
    .SYNOPSIS
    Retrieves Apple enrollment configuration.
    .DESCRIPTION
    Calls the Apple enrollment configuration endpoint for the organization.
    .EXAMPLE
    PS> Get-CapaOneMDMAppleEnrollmentConfiguration
    #>
    [CmdletBinding()]
    param (
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/apple/enrollmentConfiguration")
    $response
}