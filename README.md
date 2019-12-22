# ESP32 AT + PPPD flasher

$ docker build -t esp32ppp:latest .


$ docker run --device=/dev/ttyUSB0 esp32ppp:latest


$ minicom -s ## Configure to use /dev/ttyUSB01 @ 115200 + no hw flow control 

    AT+GMR
    AT version:1.3.0.0-dev(2759564 - Nov 12 2018 03:26:27)
    SDK version:v3.2-dev-1250-g221eced06
    compile time:Dec 22 2019 22:13:29
