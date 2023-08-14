#!/bin/bash

check_disk_space() {
  DF=$(df)
  DISKS=$(echo "$DF" | sed 1d | awk '{ print $1 }')
  SIZES_KB=$(echo "$DF" | sed 1d | awk '{ print $2 }')
  OCUPIED_KB=$(echo "$DF" | sed 1d | awk '{ print $3 }')

  for i in $(seq 1 $(echo "$DISKS" | wc -l)); do
      DISK=$(echo "$DISKS" | sed -n "$i"p)
      SIZE_KB=$(echo "$SIZES_KB" | sed -n "$i"p) # KB
      OCUP_KB=$(echo "$OCUPIED_KB" | sed -n "$i"p)

      FREE=$(echo "$SIZE_KB - $OCUP_KB" | bc)
      THRESHOLD=$(echo "$SIZE_KB * 0.80" | bc)

      if [ "$1" == "-v" ]; then
        echo "DISK: $DISK"
        echo "SIZE_KB: $SIZE_KB"
        echo "OCUP_KB: $OCUP_KB"
        echo "FREE: $FREE"
        echo "THRESHOLD: $THRESHOLD"
      fi

      SIZE_GB=$(echo "$SIZE_KB / 1024 / 1024" | bc)
      OCUP_GB=$(echo "$OCUP_KB / 1024 / 1024" | bc)
      FREE_GB=$(echo "$FREE / 1024 / 1024" | bc)

      if [ "$OCUP_GB" == "0" ]; then
        continue
      fi

      if [ 1 -eq "$(echo "${OCUP_KB} > ${THRESHOLD}" | bc)" ]; then
          echo "WARNING: $DISK with size $SIZE_GB GB has $OCUP_GB GB ocupied and $FREE_GB GB free"
      else
          echo "OK: $DISK with size $SIZE_GB GB has $OCUP_GB GB ocupied and $FREE_GB GB free"
      fi
  done
}

check_disk_space $1
