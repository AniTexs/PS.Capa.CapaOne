function Get-CapaOneMDMAppleVPP {
    <#
    .SYNOPSIS
    Retrieves Apple VPP information.
    .DESCRIPTION
    Calls the Apple Volume Purchase Program endpoint for the current organization.
    .EXAMPLE
    PS> Get-CapaOneMDMAppleVPP
    #>
    [CmdletBinding()]
    param ()
    $BaseUri = "/organizations/{{OrgId}}/apple"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/vpp").content
    $response
}