#!/bin/bash

target="/dir/sub_dir/$1"
let number_of_files = 0
let total_pages = 0
for f in "$target"/*
do
    #echo $(basename $f)
	 echo $f
	 foo=$(pdfinfo $f | grep Pages | awk '{print $2}')
	 echo $foo
    let number_of_files=number_of_files+1
	 let total_pages=total_pages+foo
done
echo ""
echo "#Files: $number_of_files"
echo "#Pages : $total_pages"
