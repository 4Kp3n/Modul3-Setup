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