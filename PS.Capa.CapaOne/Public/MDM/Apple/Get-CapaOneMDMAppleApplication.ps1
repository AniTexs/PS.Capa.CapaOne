function Get-CapaOneMDMAppleApplication {
    <#
    .SYNOPSIS
    Retrieves Apple MDM applications.
    .DESCRIPTION
    Calls the Apple application endpoint for the current organization.
    .EXAMPLE
    PS> Get-CapaOneMDMAppleApplication
    #>
    [CmdletBinding()]
    param ()
    $BaseUri = "/organizations/{{OrgId}}/apple"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/application")
    $response
}