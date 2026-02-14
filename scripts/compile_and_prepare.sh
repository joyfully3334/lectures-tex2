#!/usr/bin/bash

# Compile tex and prepare pdf

cd "$(dirname -- "${BASH_SOURCE[0]}")/.."

echo -n "sample: "
cd docs/sample
latexmk -lualatex &>/dev/null
cd ../..
echo ok

for subject in matan algem; do
  echo -n "$subject: "
  cd $subject
  latexmk -lualatex &>/dev/null
  cd ..
  if [[ -f "$subject/$subject.pdf" ]] then
    scripts/clean_pdf.sh "$subject/$subject.pdf" "pdf/$subject.pdf"
  fi
  echo ok
done

echo done
