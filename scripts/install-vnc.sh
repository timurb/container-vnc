#!/bin/sh

apt-get update && apt-get install -y libsm6 libx11-6 libxext6 xauth xkb-data x11-xkb-utils
apt-get update && apt-get install -y wget # just for downloading of deb package

wget --quiet http://downloads.sourceforge.net/project/turbovnc/2.0.2/turbovnc_2.0.2_amd64.deb
dpkg -i turbovnc_2.0.2_amd64.deb
rm -f turbovnc_2.0.2_amd64.deb
