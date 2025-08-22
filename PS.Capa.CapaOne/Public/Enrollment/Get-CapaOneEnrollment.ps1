function Get-CapaOneEnrollment {
    <#
    .SYNOPSIS
    Retrieves enrollment information from CapaOne.
    .DESCRIPTION
    Calls the enrollment endpoint for the current organization.
    .EXAMPLE
    PS> Get-CapaOneEnrollment
    #>
    [CmdletBinding()]
    param (
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/enrollment")
    $response
}