function Get-CapaOneSessionVariable {
    <#
    .SYNOPSIS
    Retrieves the current CapaOne session object.
    .DESCRIPTION
    Returns the web request session used for subsequent API calls.
    .EXAMPLE
    PS> Get-CapaOneSessionVariable
    #>
    return $Script:CapaOneSession
}