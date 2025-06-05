#!/usr/bin/bash


clear

echo "Enter the project name: "
read answer

if [[ $answer == "." ]] 
  then
    projectName="EOEX-default-proj"
else
    projectName=$answer
fi

xhost +
docker run -d --net=host -e DISPLAY=$DISPLAY $projectName:latest

