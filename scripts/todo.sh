#!/usr/bin/env bash

TODO_FILE="$HOME/.todo"

if [[ ! -f "$TODO_FILE" ]]; then
    touch "$TODO_FILE"
fi

if [[ $# -eq 0 ]]; then
    cat -n "$TODO_FILE"
    exit 0
fi

if [[ "$1" == "-a" ]]; then
    if [[ $# -eq 1 ]]; then
        echo "No todo item specified."
        exit 1
    fi

    shift
    echo "$*" >> "$TODO_FILE"
    exit 0
fi

if [[ "$1" == "-d" ]]; then
    shift
    sed -i.bak "$1d" $TODO_FILE
    exit 0
fi

if [[ "$1" == "-c" ]]; then
    if [[ $# -eq 0 ]]; then
        echo "No todo item specified."
        exit 1
    fi

    shift

    if [[ "$1" =~ ^[0-9]+$ ]]; then
        sed -i.bak "$1s/^/[x] /" $TODO_FILE
        exit 0
    fi

    sed -i.bak "/$1/s/^/[x] /" $TODO_FILE
    exit 0
fi

if [[ "$1" == "-u" ]]; then
    if [[ $# -eq 0 ]]; then
        echo "No todo item specified."
        exit 1
    fi

    shift

    if [[ "$1" =~ ^[0-9]+$ ]]; then
        sed -i.bak "$1s/^\[x\] //" $TODO_FILE
        exit 0
    fi

    sed -i.bak "/$1/s/^\[x\] //" $TODO_FILE
    exit 0
fi

if [[ "$1" == "-h" ]]; then
    echo "Usage: todo.sh [option] [argument]"
    echo "Options:"
    echo "  -a    Add a new todo item"
    echo "  -d    Delete a todo item"
    echo "  -c    Check a todo item"
    echo "  -u    Uncheck a todo item"
    echo "  -h    Show this help message"
    exit 0
fi

echo "Invalid option. Use -h for help."
