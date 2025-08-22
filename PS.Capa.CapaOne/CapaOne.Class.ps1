#region  Capa One class definitions
# Requires PowerShell 5+
# Add this file to your module folder and dot‑source or include it in your .psm1.
#>
using namespace System.Globalization

class CapaOneSoftwareStatus {
    [bool]   $Compliant
    [int]    $PatchCount
    [int]    $FailedPatchCount
    [int]    $Severity
    [bool]   $PendingReboot

    CapaOneSoftwareStatus ([psobject] $raw) {
        if (-not $raw) { return }
        $this.Compliant      = [bool]  $raw.compliant
        $this.PatchCount     = [int]   $raw.patchCount
        $this.FailedPatchCount = [int] $raw.failedPatchCount
        $this.Severity       = [int]   $raw.severity
        $this.PendingReboot  = [bool]  $raw.pendingReboot
    }
}

class CapaOneDriverStatus {
    [bool] $Compliant
    [int]  $PatchCount
    [bool] $IsSupported

    CapaOneDriverStatus ([psobject] $raw) {
        if (-not $raw) { return }
        $this.Compliant  = [bool] $raw.compliant
        $this.PatchCount = [int]  $raw.patchCount
        $this.IsSupported= [bool] $raw.isSupported
    }
}

class CapaOneDevice {
    # Core
    [string]$Id
    [string]$Name
    [string]$DeviceType
    [string]$OsName
    [string]$OsVersion
    [string]$Platform
    [bool]  $Online
    [bool]  $Virtual
    [bool]  $Winget
    [string]$State
    [string]$WebUrl
    [string]$AgentVersion

    # Dates
    [datetime]$LastCheckIn
    [datetime]$LastUpdate
    [datetime]$ServiceStartUp
    [datetime]$OsStartUp
    [datetime]$LastSetOffline

    # IDs & serials
    [int64] $OrgId
    [int64] $ServiceId
    [string]$MotherboardUuid
    [string]$MotherboardSerial
    [string]$OsSerial

    # Flags & misc
    [bool]   $AodContext
    [string[]]$Tags

    # Nested status objects
    [CapaOneSoftwareStatus]$SoftwareStatus
    [CapaOneDriverStatus]  $DriverStatus

    hidden static [datetime] ParseDate([object]$src) {
        if ($src -is [datetime]) { return $src }
        if ([string]::IsNullOrWhiteSpace($src)) { return $null }
        return [datetime]::ParseExact($src,'dd-MM-yyyy HH:mm:ss',[CultureInfo]::InvariantCulture)
    }

    CapaOneDevice([psobject] $raw) {
        # Simple scalars
        $this.Id            = $raw.id
        $this.Name          = $raw.name
        $this.DeviceType    = $raw.deviceType
        $this.OsName        = $raw.osName
        $this.OsVersion     = $raw.osVersion
        $this.Platform      = $raw.platform
        $this.Online        = [bool]$raw.online
        $this.Virtual       = [bool]$raw.virtual
        $this.Winget        = [bool]$raw.winget
        $this.State         = $raw.state
        $this.WebUrl        = $raw.webUrl
        $this.AgentVersion  = $raw.agentVersion
        $this.OrgId         = [int64]$raw.orgId
        $this.ServiceId     = [int64]$raw.serviceId
        $this.MotherboardUuid   = $raw.motherboardUuid
        $this.MotherboardSerial = $raw.motherboardSerial
        $this.OsSerial      = $raw.osSerial
        $this.AodContext    = [bool]$raw.aodContext
        $this.Tags          = @($raw.tags)

        # Dates
        $this.LastCheckIn   = [CapaOneDevice]::ParseDate($raw.lastCheckIn)
        $this.LastUpdate    = [CapaOneDevice]::ParseDate($raw.lastUpdate)
        $this.ServiceStartUp= [CapaOneDevice]::ParseDate($raw.serviceStartUp)
        $this.OsStartUp     = [CapaOneDevice]::ParseDate($raw.osStartUp)
        $this.LastSetOffline= [CapaOneDevice]::ParseDate($raw.lastSetOffline)

        # Nested objects
        $this.SoftwareStatus = [CapaOneSoftwareStatus]::new($raw.software)
        $this.DriverStatus   = [CapaOneDriverStatus]::new($raw.driver)
    }

    [psobject[]] GetGroups() {
        return Get-CapaOneDeviceGroup -DeviceId $this.Id
    }
}

#endregion
