#!/bin/bash

clear

echo "1. Blue-Radar classic"
echo "2. Blue-Radar alert"
echo "3. Descripcion rapida de las dos herramientas."
read -p "Elije la opcion que quieres(1-3): " numero
case $numero in
    1)
        sudo ./blue-radar-scanner.sh
esac

case $numero in
    2)
        sudo ./blue-radar-alert.sh
esac

case $numero in
    3) 
        clear
        echo "Blue-Radar classic: Herramienta de radar bluetooth."
        echo "Blue-Radar alert: Herramienta que avisa cuando un dispositivo concreto se conecta"
        echo""
        echo "Vuelve a ejecutar el script para ejcutar las herramientas"
        
esac
