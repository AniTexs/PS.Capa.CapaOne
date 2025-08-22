function Get-CapaOneMDMAppleEndpoint {
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