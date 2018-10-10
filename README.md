INSTALL
-------

Install prerequisites:

```
sudo apt install golang git libglib2.0-dev libostree-dev qemu-system-x86 \
     qemu-user-static debootstrap systemd-container xz-utils bmap-tools
export GOPATH=`pwd`/gocode
go get -u github.com/go-debos/debos/cmd/debos
```

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
bmaptool copy debian-stretch-roadrunner.img.xz /dev/mmcblk0
```

The bmap file is automatically looked for in the current directory - if missing, bmaptool
will behave like dd. You could use plain dd as well, with:

```
xz -cd debian-stretch-roadrunner.img.xz | dd of=/dev/mmcblk0 bs=1M
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
