#!/usr/bin/bash

# Prepares pdf files for upload.

for subject in matan algem; do
  if [[ -e $subject/$subject.pdf ]] then
    ./clean_pdf.sh $subject/$subject.pdf $subject.pdf
    rm $subject/$subject.pdf
  fi
done
