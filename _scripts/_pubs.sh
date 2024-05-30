#!/bin/bash

for id in `cat ../_data/faculty.yml | grep iitpkdpubid | awk -F":" '{print $2}'`
do
	count=`curl "https://iitpkd.ac.in/publications/$id" | grep "current-pager" | tail -1 | awk -F"\"" '{print $2}' | awk -F "=" '{print $2}'`
	if [ -n "$count" ]
	then
		for i in `seq 0 $count`
		do
			curl "https://iitpkd.ac.in/publications/$id?page=$i" | grep "views-field-field"   
		done
	else
		curl "https://iitpkd.ac.in/publications/$id" | grep "views-field-field"  
	fi
	sleep 1
done
