function Connect-CapaOne {
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