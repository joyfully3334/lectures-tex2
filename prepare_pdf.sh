#!/usr/bin/bash

# Prepares pdf files for upload.

for subject in matan algem; do
  ./clean_pdf.sh $subject/$subject.pdf $subject.pdf
  rm $subject/$subject.pdf
done
