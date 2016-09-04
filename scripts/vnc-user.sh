#!/bin/bash
### sh doesn't work here and bash is required:
### "echo -e" works correctly only on bash

# Change the defaults for VNC and its user as needed
USER='vagrant'
VNC_PASSWORD='/opt/TurboVNC/bin/vncpasswd'
PASSWORD="${1:-password}" # pass commandline arg to override default

# VNC server doesn't start up without config
cat >> /etc/sysconfig/tvncservers <<EOF
VNCSERVERS="1:${USER}"
EOF

# Create user and required dirs
useradd -m -s /bin/bash "${USER}"
mkdir -p "/home/${USER}/.vnc"
chown -R "${USER}" "/home/${USER}/.vnc"

# Set the VNC password for user
echo -e "${PASSWORD}\n${PASSWORD}\nn" | su "${USER}" -c "${VNC_PASSWORD}"

# Set the default DISPLAY to use VNC server
cat > /etc/profile.d/99-export-display.sh <<EOF
export DISPLAY=:1
EOF
