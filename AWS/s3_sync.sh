#!/bin/bash

export AWS_ACCESS_KEY_ID=__ACCESS_KEY__
export AWS_SECRET_ACCESS_KEY=__SECRET_KEY__

aws s3 sync $1 $2
