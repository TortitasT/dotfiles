#!/bin/bash

FILE_NAME=$1

if [ -z "$FILE_NAME" ]; then
  echo "Usage: $0 <file_name>"
  exit 1
fi

php -r "echo date('Y_m_d_His') . '_' . preg_replace('/[^a-zA-Z0-9]/', '_', '$FILE_NAME');"
