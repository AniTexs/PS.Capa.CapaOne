function Get-CapaOneUser {
    <#
    .SYNOPSIS
    Retrieves users from CapaOne.
    .DESCRIPTION
    Queries the user management endpoint optionally filtering by name.
    .PARAMETER Name
    Name or pattern used to filter results.
    .EXAMPLE
    PS> Get-CapaOneUser -Name 'John'
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Name
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/management/user?filter=$Name&pageNumber=0&pageSize=1000000").content
    $response
}