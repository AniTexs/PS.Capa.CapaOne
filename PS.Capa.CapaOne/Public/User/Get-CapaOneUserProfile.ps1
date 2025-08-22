function Get-CapaOneUserProfile {
    <#
    .SYNOPSIS
    Retrieves the current user's profile information.
    .DESCRIPTION
    Requests the user profile for the connected organization.
    .EXAMPLE
    PS> Get-CapaOneUserProfile
    #>
    [CmdletBinding()]
    param ()
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/user/profile")
    $response
}