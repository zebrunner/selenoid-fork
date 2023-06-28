#!/bin/bash

cd ../
mkdir -p dist

export GOOS=linux
export GOARCH=amd64
export CGO_ENABLED=0

if go build -o dist/selenoid_linux_amd64 -tags s3,metadata; then
    echo -e "Selenoid build was successful. Building docker image:"
    docker buildx build --pull --platform linux/amd64 .
else
    echo -e "Selenoid build was not successful"
fi

rm -rf dist
