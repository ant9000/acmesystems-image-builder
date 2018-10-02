#!/bin/sh

locale=$1
if [ -z "$locale" ]; then
  locale=en_US
fi

echo "${locale}.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
update-locale LANG=${locale}.UTF-8
