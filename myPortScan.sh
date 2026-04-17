#!/bin/bash

NUM_PORTS=65535


function ctrl_c(){
  echo -e "\n [+] Saliendo....\n\n"
  tput cnorm
  exit 1
}


trap ctrl_c INT

tput civis  # Oculatar el cursor
for port in $(seq 1 $NUM_PORTS); do
  bash -c "(echo "" > /dev/tcp/127.0.0.1/$port) 2>/dev/null" && echo -e "[+] PORT $port - OPEN" &
done
wait

tput cnorm  # Mostrar el cursor

