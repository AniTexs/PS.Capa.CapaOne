function Get-CapaOneMDM {
    <#
    .SYNOPSIS
    Retrieves MDM configuration for the organization.
    .DESCRIPTION
    Returns Apple and Android MDM configuration details.
    .PARAMETER ParameterName
    Placeholder parameter reserved for future use.
    .EXAMPLE
    PS> Get-CapaOneMDM
    #>
    [CmdletBinding()]
    param (
        [Parameter()]
        [TypeName]
        $ParameterName
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $MDMConfiguration = @{
        Apple = (Invoke-CapaOneApi -Path "$BaseUri/apple/cluster")
        Android = (Invoke-CapaOneApi -Path "$BaseUri/android/enterprise")
    }
    $MDMConfiguration
}