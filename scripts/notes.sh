#!/bin/bash

BASE_PATH=~/notes

if [ ! -d $BASE_PATH ]; then
    mkdir $BASE_PATH
fi

if [ $# -eq 0 ]; then
    vim $BASE_PATH/notes.md
    exit 1
fi

if [ $1 = "ls" ]; then
    ls $BASE_PATH
    exit 1
fi

if [ $1 = "rm" ]; then
    rm $BASE_PATH/$2
    exit 1
fi

vim $BASE_PATH/$1
