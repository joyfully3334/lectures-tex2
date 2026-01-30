#!/usr/bin/bash

# Simple bash script that clean pdf file and reduce it's size.
#
# Don't use on big files (>30MB), because it can stuck.
# Or remove lines with pdfsizeopt.

tmp=".tmp_clean_pdf_file"

if [[ $# < 2 || $# > 3 ]] then
  echo Usage: clean_pdf in.pdf out.pdf [quality]
  echo In [quality] 1 is for best optimise size and 5 for best quality.
  exit 1
else
  echo -n Processing...
fi

if [[ $# == 3 ]] then
  case $3 in
  "1")
    ps2pdf -dPDFSETTINGS=/screen $1 $2;;
  "screen")
    ps2pdf -dPDFSETTINGS=/screen $1 $2;;
  "2")
    ps2pdf -dPDFSETTINGS=/ebook $1 $2;;
  "ebook")
    ps2pdf -dPDFSETTINGS=/ebook $1 $2;;
  "3")
    ps2pdf -dPDFSETTINGS=/default $1 $2;;
  "default")
    ps2pdf -dPDFSETTINGS=/default $1 $2;;
  "4")
    ps2pdf -dPDFSETTINGS=/printer $1 $2;;
  "printer")
    ps2pdf -dPDFSETTINGS=/printer $1 $2;;
  "5")
    ps2pdf -dPDFSETTINGS=/prepress $1 $2;;
  "prepress")
    ps2pdf -dPDFSETTINGS=/prepress $1 $2;;
  esac
else
  ps2pdf -dPDFSETTINGS=/default $1 $2
fi

exiftool -all= $2 -overwrite_original > /dev/null 2>&1
qpdf --linearize $2 --replace-input

pdfsizeopt --version > /dev/null 2>&1

if [[ $? == 0 ]] then
  pdfsizeopt --use-pngout=no $2 $tmp > /dev/null 2>&1
  rm $2
  mv $tmp $2
fi

echo " | Done!"
