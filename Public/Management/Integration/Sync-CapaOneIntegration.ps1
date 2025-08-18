function Sync-CapaOneIntegration {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $IntegrationId
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $response = (Invoke-CapaOneApi -Path "$BaseUri/management/integration/$IntegrationId/sync" -Method Post)
    if($response -eq "Sync ran successfully"){
        return $true
    }
    return $false
}