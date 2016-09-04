# VNC server inside container

## Vagrant-based

* Start up the vagrant container.
* Connect with VNC client to `192.168.33.10:5901`
* Password is 'password'. See `Vagrantfile` for details on how to change it
* `vagrant ssh` and start an X application

Starting an X application inside Vagrant automatically spawns it inside VNC session.
This is configured for `vagrant` user, for other users you have to `export DISPLAY=:1`.

## Docker based

```
docker build . -t container-vnc
docker run -dP container-vnc -- firefox
docker ps
```

Connect via VNC client to localhost to port displayed by last command.
Firefox is already running there.

### License and authors
* Author: Timur Batyrshin erthad@gmail.com
* License: MIT
