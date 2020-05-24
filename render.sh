#!/bin/bash

mkdir -p audio

for file in $(ls $INPUT_CHUCK_FILE_GLOB)
do
  fileId=$(echo $file | grep -o '[^\/]*$')
  echo $fileId
  chuck -s $file "rec.ck:audio/$fileId.wav"
done

