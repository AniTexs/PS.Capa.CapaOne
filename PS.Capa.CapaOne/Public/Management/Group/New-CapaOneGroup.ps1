function New-CapaOneGroup {
    [CmdletBinding()]
    param (
        [ValidateNotNullOrWhiteSpace()]
        [string]
        $Name,
        [string]
        $Description = ""
    )
    $BaseUri = "/organizations/{{OrgId}}"
    $Group = Get-CapaOneGroup -Name $Name
    if($null -eq $Group){
        $Payload = @{
            name = $Name
            description = $Description
        }
        $response = (Invoke-CapaOneApi -Path "$BaseUri/management/group" -Method Post -Payload $Payload)
        $response
    }else{
        throw "A group with this name was found."
    }
}