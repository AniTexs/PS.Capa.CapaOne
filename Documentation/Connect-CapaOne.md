---
external help file: PS.Capa.CapaOne-help.xml
Module Name: PS.Capa.CapaOne
online version:
schema: 2.0.0
---

# Connect-CapaOne

## SYNOPSIS
Establishes a session with the CapaOne service.

## SYNTAX

```
Connect-CapaOne [-Credential] <PSCredential> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Authenticates to CapaOne using the supplied credentials and stores the session for future requests.

## EXAMPLES

### EXAMPLE 1
```
Connect-CapaOne -Credential (Get-Credential)
```

## PARAMETERS

### -Credential
User credential used for authentication.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: True
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
