```
sudo apt install golang git libglib2.0-dev libostree-dev qemu-system-x86 \
     qemu-user-static debootstrap systemd-container
export GOPATH=`pwd`/gocode
go get -u github.com/go-debos/debos/cmd/debos

$GOPATH/bin/debos -t debian.yaml
```
