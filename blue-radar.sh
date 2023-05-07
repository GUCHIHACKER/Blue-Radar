#!/bin/bash
clear
touch devices.txt

output_file="devices.txt"
counter=0
scanned_devices=()

function banner() {
echo -e "\e[1;31m██████  ██      ██    ██ ███████       ██████   █████  ██████   █████  ██████  \e[0m"
echo -e "\e[1;31m██   ██ ██      ██    ██ ██            ██   ██ ██   ██ ██   ██ ██   ██ ██   ██ \e[0m"
echo -e "\e[1;31m██████  ██      ██    ██ █████   █████ ██████  ███████ ██   ██ ███████ ██████  \e[0m"
echo -e "\e[1;31m██   ██ ██      ██    ██ ██            ██   ██ ██   ██ ██   ██ ██   ██ ██   ██ \e[0m"
echo -e "\e[1;31m██████  ███████  ██████  ███████       ██   ██ ██   ██ ██████  ██   ██ ██   ██ \e[0m"
echo "-----------------------------By-GUCHIHACKER------------------------------------"
echo "Escaneando cuantos dispositivos Bluetooth hay en la zona..."
echo "Numero de dispositivos Bluetooth encontrados en la zona $counter"
}

banner

function scan_devices() {
    while true
    do
        devices=$(hcitool scan --flush | grep -v "^Scanning" | cut -f2)
        for device in $devices
        do
            if [[ "${scanned_devices[@]}" =~ "$device" ]]
            then
                echo "Dispositivo ya encontrado: $device"
            else
                echo "Dispositivo nuevo encontrado: $device"
                echo "$device" >> $output_file
                scanned_devices+=("$device")
                counter=$((counter+1))
            fi
        done
        echo ""
        echo "---------------------------------------"
        echo "Ingrese 'info <MAC>' para obtener información de un dispositivo."
        echo "Ingrese 'exit' para salir."
        echo "---------------------------------------"
        sleep 15
        clear
        banner
    done
}

function get_device_info() {
    clear
    banner
    if [ -z "$1" ]
    then
        echo "Error: Se requiere la dirección MAC del dispositivo."
        return 1
    fi

    mac_address=$1
    info=$(hcitool info $mac_address | grep -E "BD Address:|Device Name:|Manufacturer:|OUI Company:")
    echo "---------------------------------------"
    echo "Informacion de disposiivo $mac_address:"
    echo "$info"
    echo "---------------------------------------"
}

scan_devices &

while true
do

    read input
    if [ "$input" == "exit" ]
    then
        echo "Gracias por utilizar mi herramienta;)"
        echo "Saliendo..."
        sleep 2
        exit 0
    fi

    input_array=($input)
    command=${input_array[0]}

    if [ "$command" == "info" ]
    then
        mac_address=${input_array[1]}
        get_device_info $mac_address
    else
        echo "Comando no reconocido. Intente de nuevo."
    fi
done