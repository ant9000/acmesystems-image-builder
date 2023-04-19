#!/bin/bash

gocode/bin/debos -t stage:common debian.yaml
gocode/bin/debos -t stage:board -t board:roadrunner debian.yaml
gocode/bin/debos -t stage:board -t board:acqua debian.yaml

gocode/bin/debos -t stage:common -t arch:armel debian.yaml
gocode/bin/debos -t stage:board -t arch:armel -t board:aria debian.yaml
gocode/bin/debos -t stage:board -t arch:armel -t board:arietta debian.yaml
