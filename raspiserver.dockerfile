FROM debian:stretch
RUN apt-get -yq update
RUN apt-get -yq install python3-dev \
                        wget \
                        python3-setuptools \
                        python3-venv \
                        libblas-dev \
                        libatlas-base-dev \
                        git
RUN python3 -m venv ~/env && \
    ~/env/bin/easy_install "pyramid==1.5.1"
RUN ~/env/bin/pip3 install --upgrade pip
RUN ~/env/bin/pip3 install wheel psutil netifaces
RUN mkdir ~/code && \
    cd ~/code && \
    git clone https://github.com/pablodroca/raspiserver.git && \
    mkdir ~/server && \
    ln -s ~/code/raspiserver/src/RasPiServer/ ~/server/RasPiServer && \
    ~/env/bin/python ~/server/RasPiServer/setup.py develop && \
    cd ~/server/RasPiServer && \
    ~/env/bin/python setup.py develop
RUN mkdir /var/log/raspiserver && \
    ln -s ~/code/raspiserver/src/RPi.GPIO.Fake/RPi ~/server/RasPiServer/RPi 

ENTRYPOINT ["/root/env/bin/pserve"]
CMD ["/root/server/RasPiServer/development.ini"]



