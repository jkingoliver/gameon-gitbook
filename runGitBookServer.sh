#!/bin/sh

cd /gitbook
echo $PWD

gitbook install
gitbook serve --log=debug --debug
