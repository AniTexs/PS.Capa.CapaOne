function Get-CapaOneReport {
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