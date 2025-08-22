function Get-CapaOneEnrollment {
    <#
    .SYNOPSIS
    Retrieves enrollment information from CapaOne.
    .DESCRIPTION
    Calls the enrollment endpoint for the current organization.
    .PARAMETER ParameterName
    Placeholder parameter reserved for future functionality.
    .EXAMPLE
    PS> Get-CapaOneEnrollment
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [TypeName]
        $ParameterName
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/enrollment")
    $response
}