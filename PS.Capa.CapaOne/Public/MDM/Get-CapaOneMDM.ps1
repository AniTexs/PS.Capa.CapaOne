function Get-CapaOneMDM {
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