function Sync-CapaOneIntegration {
    <#
    .SYNOPSIS
    Triggers synchronization for a CapaOne integration.
    .DESCRIPTION
    Initiates a sync for the specified integration ID and returns success status.
    .PARAMETER IntegrationId
    Identifier of the integration to sync.
    .EXAMPLE
    PS> Sync-CapaOneIntegration -IntegrationId 5
    #>
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