# deutsches keyboard layout 
$LocaleName = "de-DE"

# deutsches keyboard layout hinzufuegen
Set-WinUILanguageOverride -Language $LocaleName
Set-WinUserLanguageList -LanguageList $LocaleName -Force
Set-WinSystemLocale -SystemLocale $LocaleName

# Restart VM
shutdown.exe /r /t 0

