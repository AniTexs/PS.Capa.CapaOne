function Get-CapaOneReport {
    <#
    .SYNOPSIS
    Retrieves a report from CapaOne.
    .DESCRIPTION
    Downloads report items based on the specified template.
    .PARAMETER Template
    Report template identifier.
    .EXAMPLE
    PS> Get-CapaOneReport -Template 'deviceStatus'
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $Template
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $Query = @{
        template = $Template
    }
    $response = (Invoke-CapaOneApi -Path "$BaseUri/report" -Query $Query).reportItems
    $response
}