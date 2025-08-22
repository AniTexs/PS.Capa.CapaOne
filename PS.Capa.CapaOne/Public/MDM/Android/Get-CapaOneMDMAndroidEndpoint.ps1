function Get-CapaOneMDMAndroidEndpoint {
    [CmdletBinding()]
    param (
        [Parameter()]
        [TypeName]
        $ParameterName
    )
    $BaseUri = "/organizations/{{OrgId}}/android/enterprise/{{AndroidEnterprise}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/endpoint").content
    $response
}