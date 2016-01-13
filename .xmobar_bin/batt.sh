#!/bin/bash

ac=`acpi | awk '{print $3}' | cut -d "," -f 1`

left=`acpi | awk '{print $4}' | cut -d "," -f 1`

if [ $ac == 'Full' ]
then 
	echo $ac
elif [ $ac == 'Charged' ]
then
	echo $ac
else
	echo $left
fi

exit 0
