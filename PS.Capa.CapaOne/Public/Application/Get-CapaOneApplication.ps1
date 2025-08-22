function Get-CapaOneApplication {
    <#
    .SYNOPSIS
    Retrieves applications from CapaOne.
    .DESCRIPTION
    Calls the application endpoint for the current organization.
    .EXAMPLE
    PS> Get-CapaOneApplication
    #>
    [CmdletBinding()]
    param ()
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/application")
    $response.content
}