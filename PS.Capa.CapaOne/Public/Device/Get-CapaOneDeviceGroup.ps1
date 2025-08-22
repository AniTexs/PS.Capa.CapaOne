function Get-CapaOneDeviceGroup {
    <#
    .SYNOPSIS
    Retrieves groups assigned to a device.
    .DESCRIPTION
    Returns groups that contain the provided device object.
    .PARAMETER Device
    Device object received from the pipeline.
    .EXAMPLE
    PS> Get-CapaOneDevice | Get-CapaOneDeviceGroup
    #>
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