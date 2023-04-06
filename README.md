# Pynq-Z2-LED-program-in-Python

## Pynq-Z2 WiFi setup:
1. Download prebuilt bootable image <a href="http://www.pynq.io/board.html"> here </a>.
<br>
2. Flash the Micro SD Card using <a href="https://rufus.ie/en/"> Rufus </a> utility. 
<br>
3. Setup a USB WiFi adapter (DWA-131) and plug it into the USB-A port on the Pynq-Z2 board.
<br>
4. Configure WiFi network settings in the boot.py inside the pre-flashed image on SD card.
<pre><code class="python">
    from pynq.lib import Wifi
    port = Wifi()
    port.connect('<Network-name>', '<Network-password>', auto=True)
</code></pre>
<br>
5. Insert the card into the Micro SD card slot underneath the board. 
<br>
6. Power on the Pynq-Z2 and verify the boot sequence of LEDs on the board. 

## References:
<li> https://pynq.readthedocs.io/en/v2.3/getting_started/pynq_z2_setup.html </li>
<li> https://github.com/Xilinx/PYNQ_Bootcamp/blob/master/doc/01_setup.md </li>
<li> http://www.pynq.io/board.html </li>
<li> https://rufus.ie/en/ </li>
<li> https://in.dlink.com/en/products/dwa-131-wireless-n-300-nano-usb-adapter </li>
