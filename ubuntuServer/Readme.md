# Raspberry Pi Ubuntu Server configuration
These scripts help configure a Raspberry Pi image once it's created, I'm using Windows + WSL2.
Ubuntu Server supports [Cloud-init](https://cloudinit.readthedocs.io/en/latest/) which makes headless configuration much easier

##This is not complete yet
1. Download and install Raspberry Pi Imager from [Raspberrypi.org](https://www.raspberrypi.org/software)
2. Connect your SD car to your computer and note which drive letter it gets
3. Edit the env file to update with your drive letter and country code
4. Run Raspberry Pi imager and select one of the Ubuntu Server images (Other general purpose OS/Ubuntu) I'm using Ubuntu Server 20.04.3 LTS (RPI 3/4/400) - 64-bit version
5. After image is done remove the SD card and insert it back in
6. run ./config/configPi.sh to setup WiFi and host name
7. optionally run ./iotEdge/addIotEdge.sh to configure Azure IoT Edge
9. run ./config/copyToSD.sh to copy the files in staging to your SDCard
9. run *sudo ./config/unMountSD.sh* to unmount and remove the SD card
10. Boot up your pie and wait a while if all goes well you should be able to *ping raspberrypi.local* from WSL to find your IP address.  If you added IoTEdge, it's going to take a while for it to complete setting up.  Look in the hub to see when the device shows up.