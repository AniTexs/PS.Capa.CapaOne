function Get-CapaOneCustomApp {
    <#
    .SYNOPSIS
    Retrieves custom applications from CapaOne.
    .DESCRIPTION
    Lists all custom applications or a specific app when an ID is supplied.
    .PARAMETER Id
    Optional application identifier.
    .EXAMPLE
    PS> Get-CapaOneCustomApp
    #>
    [CmdletBinding()]
    param (
        [string]
        $Id
    )
    $BaseUri = "/organizations/{{OrgId}}"
    if([string]::IsNullOrEmpty($Id)){
        $response = (Invoke-CapaOneApi -Path "$BaseUri/appEnrollment")
    }else{
        $response = (Invoke-CapaOneApi -Path "$BaseUri/appEnrollment/$Id")
    }
    $response
}