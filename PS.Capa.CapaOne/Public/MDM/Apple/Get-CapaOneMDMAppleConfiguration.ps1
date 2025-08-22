function Get-CapaOneMDMAppleConfiguration {
    <#
    .SYNOPSIS
    Retrieves Apple MDM configuration.
    .DESCRIPTION
    Calls the Apple configuration endpoint for the organization.
    .EXAMPLE
    PS> Get-CapaOneMDMAppleConfiguration
    #>
    [CmdletBinding()]
    param ()
    $BaseUri = "/organizations/{{OrgId}}/apple"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/configuration")
    $response
}