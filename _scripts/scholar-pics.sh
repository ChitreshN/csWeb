#!/bin/bash
# Auto populate assets/img/scholars with images of scholars in scholars.yml from their iitpkd profile page
# dependency: curl, wget

grep "rollno" ../_data/scholars.yml | awk -F":" '{print $2}' | sed "s/\"//g" > xkcdlist

for i in `cat xkcdlist`
do
	pic=`curl https://iitpkd.ac.in/people/$i | grep profile_page_image | awk -F"\"" '{print $4}'`
	if [ -z $pic ]
	then
		cp empty.jpg ../assets/img/scholars/$i.jpg
	else
		wget https://iitpkd.ac.in$pic -O ../assets/img/scholars/$i.jpg
	fi
done

rm -f xkcdlist
