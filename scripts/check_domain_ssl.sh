#!/bin/bash

if [ -z "$(which openssl)" ]; then
    echo "openssl not found"
    exit 1
fi

if [ $# -ne 1 ]; then
    echo "Usage: $0 <domain>:<port>"
    exit 1
fi

ADDRESS=$1

if [[ "$1" != *":"* ]]; then
    ADDRESS=$1:443
fi

openssl s_client -connect $ADDRESS </dev/null 2>/dev/null | openssl x509 -inform pem -text
