function New-CapaOneGroup {
    <#
    .SYNOPSIS
    Creates a new CapaOne group.
    .DESCRIPTION
    Adds a group with the specified name and optional description.
    .PARAMETER Name
    Name of the new group.
    .PARAMETER Description
    Optional description for the group.
    .EXAMPLE
    PS> New-CapaOneGroup -Name "HR"
    #>
    [CmdletBinding()]
    param (
        [ValidateNotNullOrWhiteSpace()]
        [string]
        $Name,
        [string]
        $Description = ""
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $Group = Get-CapaOneGroup -Name $Name
    if($null -eq $Group){
        $Payload = @{
            name = $Name
            description = $Description
        }
        $response = (Invoke-CapaOneApi -Path "$BaseUri/management/group" -Method Post -Payload $Payload)
        $response
    }else{
        throw "A group with this name was found."
    }
}