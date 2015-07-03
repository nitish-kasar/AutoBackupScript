#!/bin/bash
# Auto Backup Script By Nitish Kasar
# Usage : In "arr_folder_parent" Specify Full Path of Parent folder in which folder belongs 
#			 "arr_folder_name"  Specify name of folder
#		Note: Fullpath of folder and folder_name should in same sequence	 


#Folder Array without trailing / ex . /opt/lampp/ ==> /opt/lampp
arr_folder_parent=( "/opt/lampp/htdocs" "/opt/lampp/htdocs" )

#Folder Name Array
arr_folder_name=("builder" "yii-tech")

#Current date
current_date=$(date +"%d-%m-%Y")


parent_index=0 
for folder_parent_path in ${arr_folder_parent[*]}; 
	do
		#New File Name ex. bms(dd-mm-yyyy)	
		base_folder_name=${arr_folder_name[$parent_index]}
		new_folder_name="$base_folder_name($current_date).tar.gz"

		#Change Directory 
		cd $folder_parent_path	

		#Zip to Tar Gz
		echo "Taking Backup of $base_folder_name "
		tar -czf "$new_folder_name" "${arr_folder_name[$parent_index]}"
		
		let "parent_index++"
	done	

echo "Finished Taking Backup, Have a nice day  "	
