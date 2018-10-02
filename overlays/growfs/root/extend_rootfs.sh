#!/bin/sh

growpart /dev/mmcblk0 2
resize2fs /dev/mmcblk0p2
