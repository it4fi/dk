#!/usr/bin/env bash

go version
go mod download
echo "- installing $1"
go install $1
