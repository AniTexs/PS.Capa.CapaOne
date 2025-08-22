function FunctionName {
    <#
    .SYNOPSIS
    Template example for creating new CapaOne functions.
    .DESCRIPTION
    Demonstrates the structure of a function that calls the CapaOne API.
    .EXAMPLE
    PS> FunctionName
    #>
    [CmdletBinding()]
    param ()
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/device/list")
}