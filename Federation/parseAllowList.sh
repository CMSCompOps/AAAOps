#!/bin/bash

EU=out/list_eu.allow
US=out/list_us.allow

#important domains
#in2p3.fr
#infn.it
#cern.ch
#ac.uk


#awk -F'.' '{\
#if ($2 ~ /-/) print "*."$3"."$4}'

#"${1#*[0-9].[0-9]}"
cat $EU | head -n -2 | awk -F'.' '{ 
if ($2 ~ /-/ || $2 ~ /[0-9]/ ) 
print "*."$3"."$4; 
else
print "*."$2"."$3"."$4;
}' | sort -u > tmp 



echo "    "  >> tmp
echo "* redirect cms-xrd-transit.cern.ch+:1213" >> tmp

cp tmp out/list_eu_final.allow
rm tmp


exit 0;
