#!/bin/bash

clear

echo "Enter the project name: "
read answer

if [[ $answer == "." ]] 
  then
    projectName="EOEX-default-proj"
else
    projectName=$answer
fi

docker system prune
docker container prune
docker image prune

docker image rm $projectName:latest
docker container ls -a
docker image ls -a