#! /bin/bash

if [ -z "$ANACONDA_API_TOKEN" ]; then
    echo "The variable 'ANACONDA_API_TOKEN' cannot be empty"
    exit 1
fi

# Create all the osx conda packages
conda build .

# Start docker for the linux packages
open --hide --background -a Docker
while ! (docker ps > /dev/null 2>&1); do
    echo "Waiting for docker to start..."
    sleep 1
done

# Create all the linux binary conda packages on centos 6
docker run -i -t \
    -e ANACONDA_API_TOKEN \
    -v ${HOME}/.condarc:/root/.condarc:ro \
    -v `pwd`:/code \
    moble/miniconda-centos bash -c 'conda build /code'
