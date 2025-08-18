function Get-CapaOneCustomApp {
    [CmdletBinding()]
    param (
        [string]
        $Id
    )
    $BaseUri = "/organizations/{{OrgId}}"
    if([string]::IsNullOrEmpty($Id)){
        $response = (Invoke-CapaOneApi -Path "$BaseUri/appEnrollment")
    }else{
        $response = (Invoke-CapaOneApi -Path "$BaseUri/appEnrollment/$Id")
    }
    $response
}