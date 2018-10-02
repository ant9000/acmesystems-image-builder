INSTALL
-------

Install prerequisites:

```
sudo apt install golang git libglib2.0-dev libostree-dev qemu-system-x86 \
     qemu-user-static debootstrap systemd-container
export GOPATH=`pwd`/gocode
go get -u github.com/go-debos/debos/cmd/debos
```

Example run, assuming your SD card is /dev/mmcblk0:

```
$GOPATH/bin/debos debian.yaml
dd if=debian-stretch-armhf.img of=/dev/mmcblk0 bs=1M
```

There are a few configurable parameters in debian.yaml; for instance, let's
create an image for arietta:

```
$GOPATH/bin/debos -t board:arietta -t arch:armel debian.yaml
```

Look at debian.yaml to see what's available.


LINKS
-----

- https://ekaia.org/blog/2018/07/03/introducing-debos/
- https://godoc.org/github.com/go-debos/debos/actions
