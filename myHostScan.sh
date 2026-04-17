#!/bin/bash

NUM_HOST=254

function ctrl_c() {
  echo -e "\n\n [!] Saliendo.... \n"
  exit 1
}


trap ctrl_c INT

for i in $(seq 1 $NUM_HOST); do
  timeout 1 bash -c "ping -c 1 192.168.100.$i &>/dev/null" && echo "[+] Host 192.168.100.$i - ACTIVE" & 
done; wait

