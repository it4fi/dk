#!/usr/bin/env bash
# Copyright (c) it4fi. All rights reserved. {{{1
# Licensed under the MIT License: https://opensource.org/licenses/MIT

go version # {{{1
go mod download
echo "- installing $1"
go install $1
