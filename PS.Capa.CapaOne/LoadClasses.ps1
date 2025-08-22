$Classes = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1  -Recurse -ErrorAction SilentlyContinue )

Foreach($class in $Classes)
{
    Try
    {
        . $class.fullname
    }
    Catch
    {
        Write-Error -Message "Failed to import class $($class.fullname): $_"
    }
}