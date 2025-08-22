function Get-CapaOneContracts {
    <#
    .SYNOPSIS
    Returns contract information for the current organization.
    .DESCRIPTION
    Retrieves contract data stored during a successful CapaOne connection.
    .EXAMPLE
    PS> Get-CapaOneContracts
    #>
    if($null -ne $Script:CapaOneStructure){
        return $Script:CapaOneStructure.contracts
    }else{
        throw 'Error. Is it connected to graph?'
    }
}