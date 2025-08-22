function Invoke-CapaOneApi {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidatePattern('^\/[\w\d\/\-_]+')]
        [string]
        $Path,
        [Microsoft.PowerShell.Commands.WebRequestSession]
        $Session,
        [ValidatePattern('^https:\/\/[\w+\.]+\/api')]
        [string]
        $Domain = "https://dash.capaone.com/api",
        [Microsoft.PowerShell.Commands.WebRequestMethod]
        $Method = "Get",
        [hashtable]
        $Payload = $null,
        [hashtable]
        $Query
    )
    if($null -ne $Script:CapaOneSession){
        $Session = $Script:CapaOneSession
    }
    $capaSessionCookie = $session.Cookies.GetCookies('https://capaone.com') | Where-Object { $_.Name -eq 'CAPASESSION' }
    $cookieValue = $capaSessionCookie.Value
    $Headers = @{
        'Content-Type' = 'application/json'
        'Accept' = 'application/json'
    }
    if($null -ne $cookieValue){
        $Headers.'Cookie' = "CAPASESSION=$cookieValue"
    }
    $APIUrlQuery = ""
    if($null -ne $Query){
        $APIUrlQuery = Build-CapaOneQuery -Query $Query
    }
    $Params = @{
        Uri = (Set-CapaOneApiPath -Path "$($Domain+$Path+$APIUrlQuery)")
        Method = $Method
        WebSession = $Session
        Headers = $Headers
    }
    if($null -ne $Payload){
        $Params.Body = $Payload | ConvertTo-Json -Depth 10
    }
    Invoke-RestMethod @Params -SkipHttpErrorCheck

}