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

LINKS
-----

- https://ekaia.org/blog/2018/07/03/introducing-debos/
- https://godoc.org/github.com/go-debos/debos/actions
