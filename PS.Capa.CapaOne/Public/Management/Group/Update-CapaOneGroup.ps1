function Update-CapaOneGroup {
    <#
    .SYNOPSIS
    Updates a CapaOne group.
    .DESCRIPTION
    Modifies the name or description of an existing group.
    .PARAMETER GroupId
    Identifier of the group to update.
    .PARAMETER Name
    New name for the group.
    .PARAMETER Description
    Optional description for the group.
    .EXAMPLE
    PS> Update-CapaOneGroup -GroupId 1 -Name 'NewName'
    #>
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