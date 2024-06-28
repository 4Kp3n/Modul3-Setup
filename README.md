# Modul 3 Setup
Automatisiertes Setup um eine virtuelle Testumgebung für Modul 3 einzurichten.

Folgende Software wird verwendet:
* `VirtualBox` für die Virtualisierung
* `Vagrant` zum automatischen Erstellen der virtuellen Maschinen
* `Ansible` zum Konfigurieren der Maschinen

![Übersicht der Komponenten](src/Modul3Setup.png?raw=true "Übersicht der Komponenten")

## Installation
**Wichtig**: `Vagrant` muss auf dem Host installiert sein

Dieses Repository auf Euren Windows Laptop clonen:
```bash
git clone https://github.com/4Kp3n/Modul3Setup.git
```
In das Verzeichnis wechseln:
```bash
cd Modul3Setup
```

Die virtuellen Maschinen mit `Vagrant` erstellen

```bash
vagrant up
```

(Beim ersten Ausführen werden die Imagedateien heruntergeladen, was eine Weile dauern kann)

## Playbooks
Das Ausführen von Playbooks geschieht durch folgenden Befehl:
```bash
(sudo) ansible-playbook -i inventory <Playbook>
```

* Mit `-i inventory` wird die Inventory Datei verwendet in der Verbindungsinformationen zum Windows Server hinterlegt sind (nur notwendig, wenn Playbooks für den Windows Server ausgeführt werden sollen)
* Es ist notwendig `sudo` voranzustellen wenn Playbooks lokal auf Kali ausgeführt werden sollen

## Problemlösungen
**Das Kommando `vagrant up` wird nicht erfolgreich ausgeführt**

Prüft ob bereits virtuelle Maschinen mit dem selben Namen existieren (ein Löschen über die `VirtualBox` GUI ist bei Wählen der falschen Option nicht ausreichend!).
Der Ordner in dem die virtuellen Maschinen standardmäßig gespeichert werden ist: `C:\Users\User\VirtualBox VMs`
Dort müssen ggfs. die Ordner gelöscht werden
