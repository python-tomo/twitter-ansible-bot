#!/bin/bash

rm -rf before_sort.txt docs list.txt sorted.txt

ansible-doc --list_files > list.txt

while IFS= read -r line
do
  awk -v var="$line" 'BEGIN {print var}' \
  | awk '{print $2}' \
  | sed -e "s/\/usr\/lib\/python2.7\/site-packages\/ansible\/modules//g" \
  | sed -e "s/.py$//"
done < list.txt > before_sort.txt

cat before_sort.txt | sort > sorted.txt

while IFS= read -r line
do
  mkdir -p docs$line
done < sorted.txt

while IFS= read -r line
do
  ansible-doc `echo "${line}" | awk -F "/" '{print $NF}'` > docs${line}/full.txt
done < sorted.txt
