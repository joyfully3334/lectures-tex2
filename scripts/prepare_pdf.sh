#!/usr/bin/bash

# Prepares pdf files for upload.

WD="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)/.."

for subject in matan algem; do
  if [[ -f $WD/$subject/$subject.pdf ]] then
    $WD/scripts/clean_pdf.sh $WD/$subject/$subject.pdf $WD/pdf/$subject.pdf
  fi
done
