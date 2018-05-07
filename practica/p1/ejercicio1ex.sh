#!/bin/bash
if [[ $# -lt 1 ]]; then
	echo "Error: no se han introducido los argumentos necesarios"
	exit
fi

noFicheroH=$(find $1*.h | wc -l)
noFicheroC=$(find $1*.c | wc -l)
echo "El directorio contiene $noFicheroC .c y $noFicheroH .h"


for x in $(find $1*.{h,c}); do
	echo "el fichero $x tiene $(wc -l < $x) lineas y $(wc -m < $x) caracteres"
done | sort -n -r -k 8