function Build-CapaOneQuery (
    [Parameter(Mandatory)]
    [hashtable]
    $Query
) {
    $UrlQuery = @()
    $Query.GetEnumerator() | ForEach-Object {
        if(-not [String]::IsNullOrWhiteSpace($_.Value)){
            $UrlQuery += "$($_.Name)=$($_.Value)"
        }
        #$Path = $Path.Replace($_.Keys,$_.Values)
    }
    ("?"+($UrlQuery -join "&"))
}