#!/usr/bin/bash

# Simple bash script that clean PDF from meta-data file and reduce it's size.

if [[ $# != 2 ]] then
  echo Usage: clean_pdf in.pdf out.pdf
  exit 1
fi

# NOTE: If there are PNG/JPEG images in PDF, then use ebook instead of screen
ps2pdf -dPDFSETTINGS=/screen $1 $2

if command -v exiftool &> /dev/null && command -v qpdf &> /dev/null
then
  exiftool -all= $2 -overwrite_original > /dev/null 2>&1
  qpdf --linearize $2 --replace-input
else
  if ! command -v pdfsizeopt &> /dev/null
  then
    cp -f $1 $2
    exit 0
  fi
fi

tmp=".tmp_clean_pdf_file"

if command -v pdfsizeopt &> /dev/null
then
  pdfsizeopt --use-pngout=no $2 $tmp > /dev/null 2>&1
  rm $2
  mv $tmp $2
fi
