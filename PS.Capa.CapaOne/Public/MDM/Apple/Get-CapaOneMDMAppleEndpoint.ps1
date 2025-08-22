function Get-CapaOneMDMAppleEndpoint {
    <#
    .SYNOPSIS
    Retrieves Apple MDM endpoints.
    .DESCRIPTION
    Queries Apple endpoints filtered by device type.
    .PARAMETER Type
    Device type to filter (Mobile or Mac).
    .EXAMPLE
    PS> Get-CapaOneMDMAppleEndpoint -Type Mobile
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [ValidateSet("Mobile","Mac")]
        [string]
        $Type
    )
    $BaseUri = "/organizations/{{OrgId}}/apple"
    $RequestUrl = "$BaseUri/endpoint"
    $response = (Invoke-CapaOneApi -Path $RequestUrl -Query @{
        mobileType = $Type
        pageSize = 1000
    }).content
    $response
}