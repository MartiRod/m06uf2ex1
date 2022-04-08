#!/bin/bash
#
if [ $EUID -ne 0 ]
then
	echo "Cal ser root"
	exit 1
fi


while [[ true ]] 
do
clear
echo "Escriu un fitxer del directori /etc"
read Fitxer

cp /etc/$Fitxer $Fitxer.orig

gzip $Fitxer.orig

ls -lh $Fitxer.orig.gz

echo "Vols Continuar?"
read Continuar

if ((Continuar==0))
then
echo ""
else
break
fi

done

exit 15
