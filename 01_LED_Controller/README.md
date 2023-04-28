# LED controller program in Python
A guide for setting up Pynq-Z2 and connecting to network through USB WiFi.
A Python program for controlling on board LEDs and RGB LEDs through push button and slide switches. 

## Tools:
- Vivado2022.2
- Pynq-Z2 board
- DWA-131: Wireless N 300 Nano USB Adapter
- Micro USB Cable
- Micro SD Card 

## System block diagram:
![Capture](https://user-images.githubusercontent.com/127403893/230381290-63fac2ec-1300-45e4-a51f-bfc7646fb310.JPG)

## Pynq-Z2 WiFi setup:
1. Download prebuilt bootable image[^1].
2. Flash the Micro SD Card using Rufus[^2].
3. Setup a USB WiFi adapter (DWA-131) and plug it into the USB-A port on the Pynq-Z2 board.
4. Configure WiFi network settings in the boot.py inside the pre-flashed image on SD card:
```
    from pynq.lib import Wifi
    port = Wifi()
    port.connect('<Network-name>', '<Network-password>', auto=True)
```
5. Insert the card into the Micro SD card slot underneath the board. 
6. Power on the Pynq-Z2 and verify the boot sequence of LEDs on the board. 

## Jupyter Notebbok:
For connecting to Jupyter Notebook, open a web browser and navigate to http://pynq:9090
<br>
Default password for login is **xilinx**.

## References:
1. https://pynq.readthedocs.io/en/v2.3/getting_started/pynq_z2_setup.html
2. https://github.com/Xilinx/PYNQ_Bootcamp/blob/master/doc/01_setup.md
3. https://in.dlink.com/en/products/dwa-131-wireless-n-300-nano-usb-adapter
[^1]: http://www.pynq.io/board.html
[^2]: https://rufus.ie/en/
