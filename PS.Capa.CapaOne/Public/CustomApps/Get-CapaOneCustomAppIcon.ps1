function Get-CapaOneCustomAppIcon {
    <#
    .SYNOPSIS
    Retrieves the icon for a custom application.
    .DESCRIPTION
    Downloads the icon image for the specified custom app ID.
    .PARAMETER Id
    Identifier of the custom application.
    .EXAMPLE
    PS> Get-CapaOneCustomAppIcon -Id 42
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $Id
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/appEnrollment/$Id/thumb")

    $response
}