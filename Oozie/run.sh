#!/bin/bash

source=$1
target=$2

aws s3 sync $source $target
