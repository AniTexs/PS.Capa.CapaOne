function Set-CapaOneApiPath {
    <#
    .SYNOPSIS
    Expands template tokens in an API path.
    .DESCRIPTION
    Replaces placeholders such as {{OrgId}} with values from the current session context.
    .PARAMETER Path
    API path containing template placeholders.
    .EXAMPLE
    PS> Set-CapaOneApiPath -Path '/organizations/{{OrgId}}/device'
    #>
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