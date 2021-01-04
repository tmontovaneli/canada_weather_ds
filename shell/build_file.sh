#!/bin/bash

DIR=$1
cd $DIR
FILES=`ls ./*.csv`
	
for FILE in $FILES
do		
	MONTH=`echo $FILE | cut -c27-28`
	YEAR=`echo $FILE | cut -c30-33`	
	NEW_FILE="${FILE}_new"
	echo $NEW_FILE
	sed 1d $FILE > $FILE.$$.tmp
	sed -e "s/^/${MONTH};/" $FILE.$$.tmp > ../merged/$NEW_FILE 
	rm $FILE.$$.tmp
done
