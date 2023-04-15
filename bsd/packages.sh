#!/bin/sh

# Print help
printHelp () {
  echo "Usage: $0 <command> [<args>]"
  echo
  echo "Commands:"
  echo "  restore [<file>]  Restore packages from saved file"
  echo "  save    [<file>]  Save packages onto a file"
  exit 1
}

# Print help if no arguments
if [ -z "$1" ]; then
  printHelp
fi

# Restore packages
if [ "$1" = "restore" ]; then
  # Print help
  if [ -z "$2" ]; then
      echo "Usage: $0 restore <file>"
      exit 1
  fi

  echo "Restoring packages from $2..."
  echo
  cat "$2" | xargs doas pkg install -y
  exit 0
fi

# Save packages
if [ "$1" = "save" ]; then
  # Print help
  if [ -z "$2" ]; then
      echo "Usage: $0 save <file>"
      exit 1
  fi

  echo "Saving packages to $2..."

  pkg query -e '%a = 0' %o | sort > "$2"

  exit 0
fi

printHelp
