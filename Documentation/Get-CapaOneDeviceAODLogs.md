---
external help file: PS.Capa.CapaOne-help.xml
Module Name: PS.Capa.CapaOne
online version:
schema: 2.0.0
---

# Get-CapaOneDeviceAODLogs

## SYNOPSIS
Retrieves Admin On Demand logs for a device.

## SYNTAX

```
Get-CapaOneDeviceAODLogs [-DeviceId] <String> [-IncludeNotInstalled] [-IncludeInstalled]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Gets AOD log entries for the specified device, optionally including installation status.

## EXAMPLES

### EXAMPLE 1
```
Get-CapaOneDeviceAODLogs -DeviceId 123
```

## PARAMETERS

### -DeviceId
Identifier of the device.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeNotInstalled
Include logs for actions that were not installed.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -IncludeInstalled
Include logs for actions that were installed.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
