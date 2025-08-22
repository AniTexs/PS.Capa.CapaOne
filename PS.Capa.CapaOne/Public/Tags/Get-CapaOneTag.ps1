function Get-CapaOneTag {
    <#
    .SYNOPSIS
    Retrieves tags defined in CapaOne.
    .DESCRIPTION
    Calls the tag endpoint for the current organization.
    .EXAMPLE
    PS> Get-CapaOneTag
    #>
    [CmdletBinding()]
    param ()
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/tag")
    $response.Content
}