#!/bin/sh

USER=$1
if [ -z "$USER" ]; then
  USER=user
fi

PASS=$2
if [ -z "$PASS" ]; then
  PASS=$USER
fi

adduser \
  --gecos "$USER" \
  --disabled-password \
  --shell /bin/bash \
  "$USER"

adduser "$USER" sudo
echo "$USER:$PASS" | chpasswd

echo "$USER ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER
