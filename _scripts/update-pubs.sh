#!/bin/bash

st=2002
curr=`date '+%Y'`

# Get publication data from insti website.
./_pubs.sh | sed 's/<li/<li class="paginate"/g' | sed 'N;s/\n/ /' > ../_includes/tmp-pubs.html

# Sort according to year of publication.
echo "<!-- Auto generated using update-pubs.sh. CHANGES MADE TO THIS FILE WILL BE LOST -->" > ../_includes/pubs.html

for year in `seq $curr -1 $st`
do
	grep "($year)" ../_includes/tmp-pubs.html >> ../_includes/pubs.html
done

