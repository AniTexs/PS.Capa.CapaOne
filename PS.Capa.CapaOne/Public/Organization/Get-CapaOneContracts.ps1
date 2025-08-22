function Get-CapaOneContracts {
    if($null -ne $Script:CapaOneStructure){
        return $Script:CapaOneStructure.contracts
    }else{
        throw 'Error. Is it connected to graph?'
    }
}