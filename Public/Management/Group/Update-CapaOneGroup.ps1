function Update-CapaOneGroup {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrWhiteSpace()]
        [string]
        $GroupId,
        [ValidateNotNullOrWhiteSpace()]
        [string]
        $Name,
        [string]
        $Description = ""
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $Group = (Invoke-CapaOneApi -Path "$BaseUri/management/group/$GroupId")
    if($null -eq $Group.message){
        $Payload = @{
            name = $Name
            description = $Description
        }
        $response = (Invoke-CapaOneApi -Path "$BaseUri/management/group/$GroupId" -Method Put -Payload $Payload)
        $response
    }else{
        throw "A group with GroupId ($GroupId) was not found: $($Group.message)"
    }
}