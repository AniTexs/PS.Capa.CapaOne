function Get-CapaOneEnrollment {
    [CmdletBinding()]
    param (
        [Parameter()]
        [TypeName]
        $ParameterName
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/enrollment")
    $response
}