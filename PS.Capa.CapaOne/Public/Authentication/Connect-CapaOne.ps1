function Connect-CapaOne {
    <#
    .SYNOPSIS
    Establishes a session with the CapaOne service.
    .DESCRIPTION
    Authenticates to CapaOne using the supplied credentials and stores the session for future requests.
    .PARAMETER Credential
    User credential used for authentication.
    .EXAMPLE
    PS> Connect-CapaOne -Credential (Get-Credential)
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [pscredential]
        $Credential
    )
    $session = New-CapaOneSession
    $Payload = @{
        username = $Credential.UserName
        password = $Credential.GetNetworkCredential().Password
    }
    try {
        $Response = Invoke-CapaOneApi -Domain "https://portal.capaone.com/api" -Path "/login" -Payload $Payload -Method Post -Session $session
        $Script:CapaOneStructure = $Response
        $Script:CapaOneSession = $session
        $Script:CapaOneAndroidId = (Invoke-CapaOneApi -Path "/organizations/{{OrgId}}/android/enterprise").enterpriseId
    }
    catch {
        throw "Unable to connect to CapaOne"
    }
}