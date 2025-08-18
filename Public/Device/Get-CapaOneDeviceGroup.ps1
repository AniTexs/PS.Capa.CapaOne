function Get-CapaOneDeviceGroup {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory,ValueFromPipeline)]
        [psobject]
        $Device
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/management/group")
    $response | % {
        if($_.endpointRefs.refId -contains $Device.id){
            $_
        }
    }

}