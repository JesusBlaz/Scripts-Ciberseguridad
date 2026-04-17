#!/bin/bash

while true; do 
  rm -f pipe
  mkfifo pipe

  cat pipe | nc -l -p 1234 | while read line; do
    if [ "$line" = "my_password" ]; then
      echo "La contrase es correcta" > pipe
    else
      echo "La contrase es incorrecta" > pipe
    fi
  done
done

