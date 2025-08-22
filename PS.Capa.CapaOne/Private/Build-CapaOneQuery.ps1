function Build-CapaOneQuery (
    [Parameter(Mandatory)]
    [hashtable]
    $Query
) {
    <#
    .SYNOPSIS
    Builds a URL query string from key/value pairs.
    .DESCRIPTION
    Converts the provided hashtable into a URL encoded query string for API requests.
    .PARAMETER Query
    Hashtable of query string parameters.
    .EXAMPLE
    PS> Build-CapaOneQuery @{ filter = 'active'; page = 1 }
    ?filter=active&page=1
    #>
    $UrlQuery = @()
    $Query.GetEnumerator() | ForEach-Object {
        if(-not [String]::IsNullOrWhiteSpace($_.Value)){
            $UrlQuery += "$($_.Name)=$($_.Value)"
        }
        #$Path = $Path.Replace($_.Keys,$_.Values)
    }
    ("?"+($UrlQuery -join "&"))
}