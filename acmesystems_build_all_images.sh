#!/bin/bash

gocode/bin/debos acmesystems_common.yaml
gocode/bin/debos -t board:roadrunner acmesystems_board.yaml
gocode/bin/debos -t board:acqua acmesystems_board.yaml

gocode/bin/debos -t arch:armel acmesystems_common.yaml
gocode/bin/debos -t arch:armel -t board:aria acmesystems_board.yaml
gocode/bin/debos -t arch:armel -t board:arietta acmesystems_board.yaml
