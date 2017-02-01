clear
# Powershell code to creates synology's daily root telnet password
# Created By Tal Ziv
# Date 01/02/17
# Version 1.0
#
# inspired by:
# C code by: GuiAmbros - https://wrgms.com/synologys-secret-telnet-password/

Function Get-GCD( $x, $y ) {
    while ($y -ne 0) {
        $x, $y = $y, ($x % $y)
    }
    [Math]::abs($x)
}

[string]$StrMonth = get-date -Format "MM"
[int]$IntMonth = get-date -Format "MM"

$HEXMonth = "{0:x}" -f $IntMonth
[int]$INTDay = get-date -Format "dd"
$HEXDay = "{0:x}" -f $INTDay

if ($HEXDay.Length -eq 1){
	$HEXDay = "0"+$HEXDay
}

$Devider = "0" + $(Get-GCD $StrMonth $INTDay)

Write-Host "Today's password is: "$HEXMonth$StrMonth"-"$HEXDay$Devider



