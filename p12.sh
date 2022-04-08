#!/bin/bash
#
if [ $EUID -ne 0 ]
then
	echo "Cal ser root"
	exit 1
fi

clear


function comprova {

	if [[ -d /mnt/cpseg ]] 
	then
		echo "El directori exsisteix"
	else
		echo "No existeix el directori aixi que ho creo nomes per a tú"
		mkdir /mnt/cpseg
	fi


	
	return 0
}


function copia {

	cp /etc/crontab /mnt/cpseg
	cp /etc/hosts /mnt/cpseg
	
	tar -cvzf backup202204081754.tar.gz  /mnt/cpseg/crontab /mnt/cpseg/hosts
	
	echo "Fitxers copiats i comprimits"
	return 0
}

function esborra {

	rm -R /mnt/cpseg/crontab
	rm -R /mnt/cpseg/hosts
	
	echo "Fitxers crontab i hosts borrats"
	
	return 0
}


while [[ true ]] 
do

comprova
copia
esborra

echo "Vols continuar? (Escriu s per confirmar)"
read Continuar


if  [[  $Continuar  ==  "s" ]]	
then
echo ""
else
break
fi

done

exit 0
