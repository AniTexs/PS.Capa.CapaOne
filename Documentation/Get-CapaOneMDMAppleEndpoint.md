---
external help file: PS.Capa.CapaOne-help.xml
Module Name: PS.Capa.CapaOne
online version:
schema: 2.0.0
---

# Get-CapaOneMDMAppleEndpoint

## SYNOPSIS
Retrieves Apple MDM endpoints.

## SYNTAX

```
Get-CapaOneMDMAppleEndpoint [[-Type] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Queries Apple endpoints filtered by device type.

## EXAMPLES

### EXAMPLE 1
```
Get-CapaOneMDMAppleEndpoint -Type Mobile
```

## PARAMETERS

### -Type
Device type to filter (Mobile or Mac).

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
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
