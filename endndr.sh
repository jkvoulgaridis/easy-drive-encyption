#!/bin/bash

if (($# == 0))
then
	echo "Please add Driver's name as parameter" 
	exit 
fi 

DRIVE=$1
OPT=$2

MNTPNT=$(cat /proc/mounts | grep -w  $DRIVE)

if [[ -z $MNTPNT ]]
then 
	echo 'driver does not exist'
	exit
fi

IFS=' ' read -ra FF <<< "$MNTPNT" 
echo "Driver mounting point found : ${FF[1]}"
MNTPNT=${FF[1]}
cd $MNTPNT

FILES=$(ls  ${FF[1]})
CNT=0

for x in ${FILES[@]}
do 	
	chmod +rw $x
	if [ $OPT  ==  "c"  ]
	then
		infile=$MNTPNT'/'$x
		outfile=$MNTPNT'/'$x.cip
		openssl enc -base64 -e -in $infile -out $outfile && mv $outfile $infile && rm $outfile &> /dev/null 
	else
		
		infile=$MNTPNT'/'$x
		outfile=$MNTPNT'/'$x.dec
		openssl enc -base64 -d -in $infile -out $outfile && mv $outfile $infile && rm $outfile &> /dev/null
	fi
	
done
