#!/bin/bash
clear


if [[ -f devices.txt ]]; then
   rm devices.txt
fi
if [[ -f mac.txt ]]; then
   rm mac.txt
fi

touch devices.txt
touch mac.txt


mac_address=""
output_file="mac.txt"
scanned_devices=()


function print_banner() {
   echo -e "\e[1;31m██████  ██      ██    ██ ███████       ██████   █████  ██████   █████  ██████  \e[0m"
   echo -e "\e[1;31m██   ██ ██      ██    ██ ██            ██   ██ ██   ██ ██   ██ ██   ██ ██   ██ \e[0m"
   echo -e "\e[1;31m██████  ██      ██    ██ █████   █████ ██████  ███████ ██   ██ ███████ ██████  \e[0m"
   echo -e "\e[1;31m██   ██ ██      ██    ██ ██            ██   ██ ██   ██ ██   ██ ██   ██ ██   ██ \e[0m"
   echo -e "\e[1;31m██████  ███████  ██████  ███████       ██   ██ ██   ██ ██████  ██   ██ ██   ██ \e[0m"
   echo "-----------------------------By-GUCHIHACKER------------------------------------"
}


print_banner
echo "Escaneando los dispositivos Bluetooth que hay en la zona..."


hcitool scan --flush | grep -v "^Scanning"


read -p "Introduce la dirección MAC del dispositivo que quieres buscar: " mac_address
echo $mac_address >> mac.txt


echo "---------------------------------------"
echo "Información del dispositivo seleccionado"
hcitool info $mac_address | grep -E "BD Address:|Device Name:|Manufacturer:|OUI Company:"
echo "---------------------------------------"
echo "Dentro de 10 segundos empezara el escaneo para comprobar si esta el dispositivo"
sleep 10


function search_device() {
   clear
   print_banner
   devices=$(hcitool scan --flush | grep -v "^Scanning" | cut -f2)
   while [[ true ]]; do
      clear
      print_banner
      echo "Buscando si el dispositivo se encuentra en la zona...    Pulse Ctrl + C Para Salir"
      echo $devices >> devices.txt
      if grep -q $mac_address devices.txt; then
         echo "---------------------------------------"
         echo -e "\e[1;31mAlerta\e[0m"
         echo "El dispositivo que seleccionaste está en la zona."
      else
         echo "---------------------------------------"
         echo "El dispositivo no está en la zona."
      fi
      echo"" > devices.txt
      devices=$(hcitool scan --flush | grep -v "^Scanning" | cut -f2)
   done
}

search_device
