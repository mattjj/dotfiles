#!/bin/bash

# NOTE this isn't robust at all

loc=$(cd `dirname $0` && pwd)
cd
for f in `find "$loc" -type f -name '.*'`
do
    ln -s $f .
done
