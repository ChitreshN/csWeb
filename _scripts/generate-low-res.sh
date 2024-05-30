#!/bin/bash

for i in `ls *.jpg | grep -v "lowres.jpg"` 
do 
	convert -quality 60 $i $i.lowres.jpg 
done
