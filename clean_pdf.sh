#!/usr/bin/bash

# Simple bash script that clean pdf file and reduce it's size.

tmp=".tmp_clean_pdf_file"

if [[ $# != 2 ]] then
  echo Usage: clean_pdf in.pdf out.pdf
  exit 1
fi

ps2pdf -dPDFSETTINGS=/ebook $1 $2

exiftool -all= $2 -overwrite_original > /dev/null 2>&1
qpdf --linearize $2 --replace-input

pdfsizeopt --version > /dev/null 2>&1

if [[ $? == 0 ]] then
  pdfsizeopt --use-pngout=no $2 $tmp > /dev/null 2>&1
  rm $2
  mv $tmp $2
fi
