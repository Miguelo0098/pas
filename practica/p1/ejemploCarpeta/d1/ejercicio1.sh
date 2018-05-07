#!/bin/bash
NofichH=$(find $1*.h | wc -l)
NofichC=$(find $1*.c | wc -l)
echo "Tenemos $NofichC ficheros con extensión .c y $NofichH ficheros con extensión .h"
for x in $(find $1*.{c,h}); do
	echo "El fichero $x tiene $(wc -l < $x) líneas y $(wc -m < $x) caracteres.">>"Ej1.txt"
done
sort -n -r -k 8 Ej1.txt -o Ej1b.txt
cat Ej1b.txt
rm Ej1.txt
rm Ej1b.txt