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

      # echo "DISK: $DISK"
      # echo "SIZE_KB: $SIZE_KB"
      # echo "OCUP_KB: $OCUP_KB"
      # echo "FREE: $FREE"
      # echo "THRESHOLD: $THRESHOLD"

      SIZE_HUMAN=$(echo "$SIZE_KB / 1024 / 1024" | bc)
      OCUP_HUMAN=$(echo "$OCUP_KB / 1024 / 1024" | bc)

      if [ 1 -eq "$(echo "${OCUP_KB} > ${THRESHOLD}" | bc)" ]; then
          echo "WARNING: $DISK with size $SIZE_HUMAN GB has $OCUP_HUMAN GB ocupied"
      else
          echo "OK: $DISK with size $SIZE_HUMAN GB has $OCUP_HUMAN GB ocupied"
      fi
  done
}

check_disk_space
