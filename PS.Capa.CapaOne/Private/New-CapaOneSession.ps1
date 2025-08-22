function New-CapaOneSession {
    $session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
    $session.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36"
    Invoke-CapaOneApi -Domain 'https://portal.capaone.com/api' -Path '/login' -Session $session | Out-Null
    return $session
}