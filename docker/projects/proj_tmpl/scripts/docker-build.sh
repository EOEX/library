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

docker build -t eoex/$projectName . --no-cache