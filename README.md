DESCRIPTION
-----------

This repository contains recipes to prepare Debian images adapted for Acmesystems's embedded boards. We leverage Debos, a tool that integrates debootstrap and offers a very readable configuration via .yaml files.

REQUIREMENTS
------------
The following recipes have been tested on Debian Stretch: on other Debian versions your mileage might vary. Debos is a very promising but still young project; its support for Ubuntu is in the works but not yet ready.

Since Debos uses a virtualization technology (via fakemachine) to isolate itself from the underlying OS, running these recipes inside a VM requires special care.

Basically you have two choices:
- enabling nested VM support in your virtualizer;
- launching the debos commands as root with sudo.

Nested virtualization support will be slower, but maintains the build process well isolated from your system. The sudo way, on the other hand, while being faster might expose you to potentially dangerous bugs. If you follow that route, you'd better make sure that your VM serve *only* for the task at hand.

INSTALL
-------

Install prerequisites and enable local caching resolver (make sure you have backports repo enabled):

```
sudo apt install git libglib2.0-dev libostree-dev qemu-system-x86 \
     build-essential qemu-user-static debootstrap systemd-container \
     binfmt-support policykit-1 parted dosfstools xz-utils bmap-tools
sudo apt install -t bullseye-backports golang
sudo adduser $USER kvm
sudo systemctl start systemd-resolved
GOPATH=`pwd`/gocode go install -v github.com/go-debos/debos/cmd/debos@latest
```

If your user was not already in group `kvm`, you will need to logout and login again. For the current shell only you can inform the system of your new group membership with the command `newgrp kvm`.

USAGE
-----

Example run:

```
$GOPATH/bin/debos debian.yaml
```

will create two outputs:

- debian-stretch-roadrunner.img.xz, an xz-compressed image file for a Roadrunner board,
- debian-stretch-roadrunner.img.bmap, a bitmap summary for faster flashing via bmaptools

To flash it, assuming your SD card is /dev/mmcblk0, use:

```
sudo bmaptool copy debian-stretch-roadrunner.img.xz /dev/mmcblk0
```

The bmap file is automatically looked for in the current directory - if missing, bmaptool
will behave like dd. You could use plain dd as well, with:

```
xz -cd debian-stretch-roadrunner.img.xz | sudo dd of=/dev/mmcblk0 bs=1M
```

CONFIGURATION
-------------

There are a few configurable parameters in debian.yaml; for instance, let's
create an image for arietta:

```
$GOPATH/bin/debos -t board:arietta -t arch:armel debian.yaml
```

Look at debian.yaml to see what's available.

EXTRAS
------

There is a script that can be used to produce the images for roadrunner, acqua, aria and arietta
all at once:

```
./acmesystems_build_all_images.sh
```


LINKS
-----

- https://ekaia.org/blog/2018/07/03/introducing-debos/
- https://godoc.org/github.com/go-debos/debos/actions
