#!/bin/bash

# This script is used to setup the wireless interface on a FreeBSD system.

# Check if root
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Print interfaces
echo "Available interfaces:"
sysctl net.wlan.devices

# Ask for interface
echo -n "Enter interface: "
read interface

# Ask for SSID
echo -n "Enter SSID: "
read ssid

# Ask for passphrase
echo -n "Enter passphrase: "
read passphrase

# Ask for confirmation
echo
echo "Interface: $interface"
echo "SSID: $ssid"
echo "Passphrase: $passphrase"
echo -n "Is this correct? [y/n]: "
read confirm

if [ "$confirm" != "y" ]; then
    echo "Aborting..."
    exit 1
fi

# Backup wpa_supplicant.conf
cp /etc/wpa_supplicant.conf /etc/wpa_supplicant.conf.bak

# Clear wpa_supplicant.conf network TODO
#cat /etc/wpa_supplicant.conf | tr '\n' '\r' | sed 's/network={.*}//' | tr '\r' '\n' > ./wpa_supplicant.conf

# Check if configuration exists in wpa_supplicant.conf
if grep -q "network=" /etc/wpa_supplicant.conf; then
    echo "Configuration exists in wpa_supplicant.conf, Skipping..."
else    
  # Append network to wpa_supplicant.conf
  echo "" >> /etc/wpa_supplicant.conf
  echo "# $interface configuration added by bsd_wlan_setup.sh" >> /etc/wpa_supplicant.conf
  cat >> /etc/wpa_supplicant.conf << EOF
network={
    ssid="$ssid"
    psk="$passphrase"
}
EOF
fi


# Backup /etc/rc.conf
cp /etc/rc.conf /etc/rc.conf.bak

# Clear interface from /etc/rc.conf TODO
#cat /etc/rc.conf | sed "s/wlans_$interface.*//" > /etc/rc.conf
#cat /etc/rc.conf | sed "s/wlans_$interface.*//" > ./rc.conf
#cat /etc/rc.conf | sed "s/ifconfig_wlan0.*//" > /etc/rc.conf
#cat ./rc.conf | sed "s/ifconfig_wlan0.*//" > ./rc.conf

# Check if configuration exists in rc.conf
if grep -q "wlans_$interface=" /etc/rc.conf; then
  echo "Configuration exists in rc.conf, Skipping..."
else   
  # Add interface to /etc/rc.conf
  echo "" >> /etc/rc.conf
  echo "# $interface configuration added by bsd_wlan_setup.sh" >> /etc/rc.conf
  echo "wlans_$interface=\"wlan0\"" >> /etc/rc.conf
  echo "ifconfig_wlan0=\"WPA SYNCDHCP\"" >> /etc/rc.conf
fi

# Restart network service
service netif restart
