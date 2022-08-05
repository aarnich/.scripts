#!/bin/sh
# sets a short alias in zsha_aliases so I can move between projects instantly

projectdir="$HOME/Projects/"
editor="lvim"
if [ "$1" = "-v" ]; then
  editor="lvim-gui"
fi

if [ "$2" = "-v" ]; then
  editor="lvim-gui"
fi

# check if projconf doesn't exist
if [ ! -f "$projectdir.projconf" ]; then
  echo "projconf doesn't exist"
  echo "init projconf"
  touch $projectdir.projconf
  echo "projconf initialized"
fi

currentProj=$projectdir.projconf

if [ "$1" = "set" ]; then
    newproj=$(ls $projectdir | fzf)
    echo $newproj > $currentProj
    echo "Project set to $newproj"
fi

if [ "$1" = "new" ]; then
  echo "Enter new project name:"
  read newproj
  mkdir $projectdir$newproj
  echo $newproj > $currentProj
  echo "Project set to $newproj"
fi

if [ "$1" = "list" ]; then
  # list all projects in the directory
  cd $projectdir
  echo ""
  ls -d */ | sed 's/\///g'
fi

# check if currentProj is not empty
if [ -s $currentProj ]; then
  # check if the project exists
  if [ -d $projectdir$(cat $currentProj) ]; then
    cd $projectdir$(cat $currentProj)
    $editor $projectdir$(cat $currentProj)
  fi
  if [ -f $projectdir$(cat $currentProj) ]; then
    $editor $projectdir$(cat $currentProj)
  fi
  else
    echo "Project doesn't exist"
fi

