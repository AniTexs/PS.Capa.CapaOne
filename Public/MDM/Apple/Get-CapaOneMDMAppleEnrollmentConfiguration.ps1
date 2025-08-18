function Get-CapaOneMDMAppleEnrollmentConfiguration {
    [CmdletBinding()]
    param (
        [Parameter()]
        [TypeName]
        $ParameterName
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/apple/enrollmentConfiguration")
    $response
}