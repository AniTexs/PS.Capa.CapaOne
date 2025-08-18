function Set-CapaOneApiPath {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $Path
    )
    $ReplacementTable = @{
        '{{OrgId}}' = $($Script:CapaOneStructure.OrgId)
        '{{AndroidEnterprise}}' = $($Script:CapaOneAndroidId)
    }
    $ReplacementTable.GetEnumerator() | ForEach-Object {
        $Path = $Path.Replace($_.Name,$_.Value)
    }
    $Path
}