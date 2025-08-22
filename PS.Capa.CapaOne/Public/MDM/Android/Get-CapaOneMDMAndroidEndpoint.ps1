function Get-CapaOneMDMAndroidEndpoint {
    <#
    .SYNOPSIS
    Retrieves Android MDM endpoints.
    .DESCRIPTION
    Calls the Android enterprise endpoint for the current organization.
    .EXAMPLE
    PS> Get-CapaOneMDMAndroidEndpoint
    #>
    [CmdletBinding()]
    param (
    )
    $BaseUri = "/organizations/{{OrgId}}/android/enterprise/{{AndroidEnterprise}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/endpoint").content
    $response
}