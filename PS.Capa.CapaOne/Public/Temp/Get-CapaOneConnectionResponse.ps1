function Get-CapaOneConnectionResponse {
    <#
    .SYNOPSIS
    Gets the last connection response from CapaOne.
    .DESCRIPTION
    Returns the structure object received during authentication.
    .EXAMPLE
    PS> Get-CapaOneConnectionResponse
    #>
    return $Script:CapaOneStructure
}