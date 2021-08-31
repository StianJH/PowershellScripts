#Variabler som definerer plasseringene. Husk å ha med \ på slutten for å ta inne i selve mappen og ikke selve mappen.
$Source = "\\SERVER\MAPPE\MAPPE\"
$Destination = "\\SERVER\D$\MAPPE\"

#Variabler som definerer tidspunktet det blir kjørt og genererer log fil.
$Timestamp = Get-Date -uformat "%d/%m/%y %R"
$Logfile = "D:\Scripts\Logs\" + "LOGNAVN" + ".log"

#Variabel som henter filer som er under 10 timer gamle.
$Files = Get-ChildItem $Source | where-object {$_.LastWriteTime -gt (get-date).AddHours(-10)}

#Hvis variabelen Files er høyere enn 1 så utfør:
If($Files.count -gt 1)
{
$Files | Copy-Item -Destination $Destination
Add-Content $Logfile "$($Timestamp): Info: Files moved successfully"
}

#Hvis ikke over er TRUE så utfør:
Else{
$Timestamp = Get-Date -uformat "%d/%m/%y %R"
Add-Content $Logfile "$($timestamp): Error: No new files in folder"
}