# Blue-Radar
He creado esta herramienta por la inspiracion que me dio una charla en la rootedcon de madrid.

Descripción del proyecto Blue-Radar:
Blue-Radar es una herramienta que utiliza la tecnología Bluetooth para detectar y mostrar en tiempo real todos los dispositivos cercanos que tienen esta tecnología activada. La herramienta está diseñada para ser fácil de usar y está pensada para ser utilizada en situaciones en las que es necesario detectar dispositivos cercanos, ya sea para fuerzas del orden o simplemente para saber si hay alguien en las cercanías.

El proyecto Blue-Radar es una herramienta open source y está disponible en GitHub. La herramienta está diseñada para ser utilizada en dispositivos con sistemas operativos Linux. Además, se proporciona un conjunto de instrucciones para ayudar a los usuarios a configurar y utilizar la herramienta de manera efectiva.

La herramienta utiliza una serie de algoritmos de búsqueda y análisis para detectar dispositivos cercanos y muestra la información recopilada en una interfaz fácil de usar. Los usuarios pueden ver información sobre el dispositivo, incluyendo su nombre, informacion del dispositivo y dirección MAC.

Blue-Radar es una herramienta muy útil en una variedad de situaciones, como en operaciones policiales para detectar dispositivos sospechosos, en situaciones de búsqueda y rescate para localizar a personas desaparecidas y en entornos corporativos para detectar dispositivos no autorizados. El proyecto se mantiene y actualiza regularmente, lo que garantiza que la herramienta siga siendo eficaz y útil para una amplia gama de usuarios.

## Installation:
```bash
sudo apt install hcitool git
git clone https://github.com/GUCHIHACKER/Blue-Radar.git
cd Blue-Radar
chmod +x blue-radar.sh
```
## Usage:
```bash
sudo ./blue-radar.sh
```
Examles:

![tool](https://github.com/GUCHIHACKER/Blue-Radar/blob/main/Blue-Radar-alert.gif)

![tool](https://github.com/GUCHIHACKER/Blue-Radar/blob/main/Blue-Radar-scanner.gif)

```bash
info <MAC> # Ver informacion del dispositivo bluetooth.
exit # Salir
```
## LEGAL NOTICE
I am not responsible for the use that is given to this tool.

## Termux
Se esta intentando implementar en Termux para que se pueda utilizar desde dispositivos moviles y sea mas portatil y practico que llevar un portatil.

## Anuncio Importante
Solo funciona con los dispositivos que tengan activado ser visibles para el resto, en algunos dispositivos viene activado por defecto.

Si quiere que la herramienta tenga mas potencia comprese un adaptador bluetooth mas potente(Si lo hace tendra que cambiar el codigo de la herramienta para que se ejecute en dicho adaptador), tambien pude intentar ampliar la potencia con el siguiente comando:
```bash
sudo hcitool -i hci0 cmd 0x03 0x0c 0x00 0x03 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
```
