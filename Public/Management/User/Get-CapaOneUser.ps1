function Get-CapaOneUser {
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