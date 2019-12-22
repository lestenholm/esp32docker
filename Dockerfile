FROM ubuntu:18.04 as image

RUN  apt-get -y update
RUN  apt-get -y install git wget flex bison gperf python python-pip python-setuptools python-serial python-click python-cryptography python-future python-pyparsing python-pyelftools cmake ninja-build ccache libffi-dev libssl-dev
RUN  apt-get -y install gcc git wget make libncurses-dev flex bison gperf python python-pip python-setuptools python-serial python-cryptography python-future python-pyparsing
RUN  git clone https://github.com/ep00ch/esp32-at-ppp.git
RUN  cd esp32-at-ppp/ && git submodule init &&  git submodule update
COPY xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz .
RUN  tar xzvf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz 
ENV  PATH=$PATH:/xtensa-esp32-elf/bin/
ENV  IDF_PATH=/esp32-at-ppp/esp-idf/
RUN  /usr/bin/python -m pip install --user -r $IDF_PATH/requirements.txt
RUN  /usr/bin/python -m pip install pyyaml xlrd
COPY sdkconfig /esp32-at-ppp/
RUN  cd /esp32-at-ppp/ && make app

CMD  cd /esp32-at-ppp/ && make flash
