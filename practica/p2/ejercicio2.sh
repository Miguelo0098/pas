#!/bin/bash
if [[ $# < 1 ]]; then
	echo "Error: no se ha introducido el fichero como parámetro!"
	echo "El programa va a cerrarse..."
	echo ""
	exit
fi

cat $1| sed -r -e '/^=*$/d' -e '/^ .+$/d' -e 's/^Dirigida por (.+)$/|-> Director: \1/g' -e 's/^\((..\/..\/....)\) (-.+-)$/|-> Fecha de estreno: \1/g' -e 's/^(Reparto: .+)$/|-> \1/g' -e 's/^([0-9].+)$/|-> Duración: \1/g'