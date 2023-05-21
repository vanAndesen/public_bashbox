#!/bin/bash

find -type f -ctime +7 -name "*.log" > logs_to_zip

declare -a log_array
log_array=( $(cat logs_to_zip | tr "\n" " ") )

for filr in ${log_array[@]}
do
	zip $file.zip $file
	if [ -e $file.zip ]
	then
		rm $file
	elif [ -ne $file.zip ]
	then
		echo"Failed to zip $file, please check failed_to_zip."
		"$(date) - Failed to delete $file as no zip was made" >> failed_to_zip
	fi
done

rm logs_to_zip
