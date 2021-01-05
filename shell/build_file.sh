#!/bin/bash

DIR=$1
cd $DIR
FILES=`ls ./*.csv`
	
for FILE in $FILES
do		
	MONTH=`echo $FILE | cut -c27-28`
	YEAR=`echo $FILE | cut -c30-33`	
	NEW_FILE="${FILE}"
	#echo $NEW_FILE
	sed 1d $FILE > $FILE.$$.tmp
	sed -e "s/^/${YEAR},${MONTH},/" $FILE.$$.tmp > ../merged/$NEW_FILE 
	rm $FILE.$$.tmp
done

cd ../merged

cat *.csv >> temp.csv

cat ../original/header.txt | cat - temp.csv > temp.csv_new

mv temp.csv_new canada_weather.csv_

rm *.csv

mv canada_weather.csv_ canada_weather.csv