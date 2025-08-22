function Remove-CapaOneGroup {
    <#
    .SYNOPSIS
    Removes a CapaOne group.
    .DESCRIPTION
    Deletes a group by its identifier with confirmation support.
    .PARAMETER GroupId
    Identifier of the group to remove.
    .EXAMPLE
    PS> Remove-CapaOneGroup -GroupId 1 -Confirm:$false
    #>
    [CmdletBinding(
        SupportsShouldProcess = $true,   # ⇒ adds –Confirm / –WhatIf
        ConfirmImpact = 'High' # default; use High for risky ops
    )]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrWhiteSpace()]
        [string]
        $GroupId
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $Group = (Invoke-CapaOneApi -Path "$BaseUri/management/group/$GroupId")
    if ($null -eq $Group.message) {
        if ($PSCmdlet.ShouldProcess("Group $($Group.Name) ('$GroupId')", 'Delete')) {
            
            $response = (Invoke-CapaOneApi -Path "$BaseUri/management/group/$GroupId" -Method Delete -Payload @{})
            $response
        }
    }
    else {
        throw "A group with GroupId ($GroupId) was not found: $($Group.message)"
    }
}