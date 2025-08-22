function Get-CapaOneMDM {
    <#
    .SYNOPSIS
    Retrieves MDM configuration for the organization.
    .DESCRIPTION
    Returns Apple and Android MDM configuration details.
    .EXAMPLE
    PS> Get-CapaOneMDM
    #>
    [CmdletBinding()]
    param (
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $MDMConfiguration = @{
        Apple = (Invoke-CapaOneApi -Path "$BaseUri/apple/cluster")
        Android = (Invoke-CapaOneApi -Path "$BaseUri/android/enterprise")
    }
    $MDMConfiguration
}