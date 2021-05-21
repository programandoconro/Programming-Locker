#!/bin/bash

read -p "Project name: " name
project=`echo "${name}" | awk '{print$1}'| awk '{print tolower($0)}'` 
echo
read -p "Typescript? y/n " -n 1 -r typescript 

if [[ $typescript == "y" ]];
    then template="--template typescript";
else
    template="";
fi

echo
read -p "Firebase? y/n " -n 1 -r firebase 

if [[ $firebase == "y" ]];
then database="yarn add firebase";
else
    database="echo 'Firebase not installed'";
fi

echo
read -p "Firebase-auth? y/n " -n 1 -r firebaseauth 

if [[ $firebaseauth == "y" ]];
then auth="yarn add @react-firebase/auth";
else
    auth="echo 'Firebase not installed'";
fi

echo
read -p "Firestore? y/n " -n 1 -r firestore

if [[ $firestore == "y" ]];
then storage="yarn add @react-firebase/firestore";
else
    storage="echo 'Firebase not installed'";
fi

echo
read -p "Material-UI? y/n " -n 1 -r material 

if [[ $material == "y" ]];
then styles="yarn add @material-ui/core";
else
    styles="echo 'Material-ui not installed'";
fi
echo "STARTING INSTALLATION"

# RUN PROGRAM:

npx create-react-app $project $template
echo "INSTALLED PROJECT"

(cd $project; $database; $auth; $storage; $styles)
echo "INSTALLED DEPENDENCIES"

echo "FINISHED"
