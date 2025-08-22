function Get-CapaOneIntegration {
    <#
    .SYNOPSIS
    Retrieves integration information.
    .DESCRIPTION
    Calls the integration endpoint for the current organization.
    .EXAMPLE
    PS> Get-CapaOneIntegration
    #>
    [CmdletBinding()]
    param ()
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/management/integration")
    $response
}