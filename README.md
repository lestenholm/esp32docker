# ESP32 AT + PPPD flasher

These instructions are based on setting up the pppd fork of esp32-at: https://github.com/ep00ch/esp32-at-ppp

## Build docker image and load firmware

    docker build -t esp32ppp:latest .
    docker run --device=/dev/ttyUSB0 esp32ppp:latest

## Setup ESP32

    minicom -s ## Configure to use /dev/ttyUSB0 @ 115200 + no hw flow control 

### Check installed firmware 

    AT+GMR
    AT version:1.3.0.0-dev(2759564 - Nov 12 2018 03:26:27)
    SDK version:v3.2-dev-1250-g221eced06
    compile time:Dec 22 2019 22:13:29

### List WiFi networks and APs

    AT+CWLAP
	+CWLAP:(3,"My WiFe",-83,"cc:b0:ce:87:9a:ed",1)
    +CWLAP:(4,"dlink",-85,"14:a6:4d:e5:30:16",11)
    +CWLAP:(3,"Toshiba-U2187-OfficeLink-Net46UHZ",-86,"aa:bb:cc:13:77:11",1)

### Connect to an AP

    AT+CWJAP="dlink","kensentme"
	WIFI CONNECTED
	WIFI GOT IP

### Start PPPD

When you have ensured that your build installed and that WIFI is setup, test pppd by running pppd.

    sudo pppd file pppd-options 192.168.68.100:192.168.68.123 ### Last arg is local-IP:remote-IP



