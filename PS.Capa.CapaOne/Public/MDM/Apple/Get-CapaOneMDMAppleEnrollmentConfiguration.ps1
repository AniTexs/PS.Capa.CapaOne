function Get-CapaOneMDMAppleEnrollmentConfiguration {
    <#
    .SYNOPSIS
    Retrieves Apple enrollment configuration.
    .DESCRIPTION
    Calls the Apple enrollment configuration endpoint for the organization.
    .PARAMETER ParameterName
    Placeholder parameter reserved for future use.
    .EXAMPLE
    PS> Get-CapaOneMDMAppleEnrollmentConfiguration
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [TypeName]
        $ParameterName
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/apple/enrollmentConfiguration")
    $response
}