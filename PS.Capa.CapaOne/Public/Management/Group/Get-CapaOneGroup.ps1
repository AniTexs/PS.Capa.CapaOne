function Get-CapaOneGroup {
    <#
    .SYNOPSIS
    Retrieves groups from CapaOne.
    .DESCRIPTION
    Queries group information, optionally filtering by name or ID and including device assignments.
    .PARAMETER Name
    Filter groups by name.
    .PARAMETER GroupId
    Filter by a specific group ID.
    .PARAMETER WithDevices
    Include device assignments in the result.
    .EXAMPLE
    PS> Get-CapaOneGroup -WithDevices
    #>
    [CmdletBinding()]
    param (
        [string]
        $Name,
        [string]
        $GroupId,
        [switch]
        $WithDevices
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/management/group")
    if(-not [String]::IsNullOrEmpty($Name)){$response=$response|where name -like "*$Name*"}
    if(-not [String]::IsNullOrEmpty($GroupId)){$response=$response|where id -eq "$GroupId"}
    if($WithDevices.IsPresent){
        $response | % {
            $GroupId = $_.Id
            $_.endpointRefs = (Invoke-CapaOneApi -Path "$BaseUri/management/group/$GroupId/windows/endpoint/assigned?pageNumber=1&pageSize=1000000").content
        }
    }

    #$response = (Invoke-CapaOneApi -Path "$BaseUri/management/group/$GroupId/windows/endpoint/assigned?pageNumber=1&pageSize=1000000").content
    $response
}