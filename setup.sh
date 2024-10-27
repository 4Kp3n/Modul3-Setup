#!/usr/bin/env zsh

# Prompt for which machines to install
read "install_windows?Do you want to install the Windows Server VM? (y/n): "
read "install_kali?Do you want to install the Kali Linux VM? (y/n): "

# Export variables for Vagrantfile
export INSTALL_WINDOWS=$([[ "$install_windows" == [yY] ]] && echo "true" || echo "false")
export INSTALL_KALI=$([[ "$install_kali" == [yY] ]] && echo "true" || echo "false")

# If installing Windows Server VM
if [[ "$INSTALL_WINDOWS" == "true" ]]; then
  read "windows_vm_name?Enter the name for the Windows VM (default: Windows_Server): "
  read "windows_vm_display_name?Enter the display name for the Windows VM in VirtualBox (default: Windows Server): "
  read "windows_vm_ip?Enter the IP address for the Windows VM (default: 192.168.56.200): "

  export WINDOWS_VM_NAME=${windows_vm_name:-Windows_Server}
  export WINDOWS_VM_DISPLAY_NAME=${windows_vm_display_name:-"Windows Server"}
  export WINDOWS_VM_IP=${windows_vm_ip:-192.168.56.200}
fi

# If installing Kali Linux VM
if [[ "$INSTALL_KALI" == "true" ]]; then
  read "kali_vm_name?Enter the name for the Kali VM (default: Kali): "
  read "kali_vm_display_name?Enter the display name for the Kali VM in VirtualBox (default: Kali): "
  read "kali_vm_ip?Enter the IP address for the Kali VM (default: 192.168.56.100): "

  export KALI_VM_NAME=${kali_vm_name:-Kali}
  export KALI_VM_DISPLAY_NAME=${kali_vm_display_name:-Kali}
  export KALI_VM_IP=${kali_vm_ip:-192.168.56.100}
fi

# Run Vagrant with the environment variables
vagrant up
