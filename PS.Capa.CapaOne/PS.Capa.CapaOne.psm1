#Get public and private function definition files.
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1  -Recurse -ErrorAction SilentlyContinue )
$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -Recurse -ErrorAction SilentlyContinue )
$Beta = @( Get-ChildItem -Path $PSScriptRoot\Beta\*.ps1 -Recurse -ErrorAction SilentlyContinue )

#. $PSScriptRoot\CapaOne.Class.ps1


#Dot source the files
Foreach($import in @($Public + $Private))
{
    Try
    {
        Write-Verbose "Importing function $($import.fullname)"
        . $import.fullname
    }
    Catch
    {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

if($args -contains "Beta")
{
    Write-Verbose "Beta functions are included"
}
#Dot source the files
Foreach($import in $Beta)
{
    Try
    {
        . $import.fullname
    }
    Catch
    {
        Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}

# Here I might...
# Read in or create an initial config file and variable
# Export Public functions ($Public.BaseName) for WIP modules
# Set variables visible to the module and its functions only

Export-ModuleMember -Function $Public.Basename
#Export-ModuleMember -Function $Beta.Basename
#Export-ModuleMember -Function $Private.BaseName
