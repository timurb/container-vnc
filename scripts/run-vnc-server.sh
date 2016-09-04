#!/bin/sh

exec /sbin/setuser vnc /opt/TurboVNC/bin/Xvnc :1 -geometry 1280x800 -depth 24
