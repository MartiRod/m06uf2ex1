#!/bin/bash
#
if [ $EUID -ne 0 ]
then
	echo "Cal ser root"
	exit 1
fi

clear

echo "Nom del grup que vols borrar:"
read GrupBorrat

echo "Estas segur que vols borrar al grup $GrupBorrat? (Escriu s per confirmar)"
read RespostaFinal


if  [[  $RespostaFinal  ==  "s" ]]	
then
delgroup $GrupBorrat
else
echo "no es borrara el grup $GrupBorrat"
fi


exit 2
