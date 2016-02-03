#!/bin/bash

set -euo pipefail

mkdir upload
echo "OK" > upload/README.txt

eval ${DEPLOY}
exit 0

hg clone http://hg.openjdk.java.net/jdk8/jdk8 build
cd build
bash ./get_source.sh

bash ./configure
make all
