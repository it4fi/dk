#!/usr/bin/env bash

go version
echo "- installing $1"
go install $1
