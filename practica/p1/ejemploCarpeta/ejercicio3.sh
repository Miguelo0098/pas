#!/bin/bash
if [[ $# < 1 ]]; then
	echo "Error: no se ha introducido una carpeta"
	exit
fi
umbral1=10000; umbral2=100000
if [[ $# -ge 2 ]]; then
	umbral1=$2
fi
if [[ $# -eq 3 ]]; then
	umbral2=$3
fi

rm  -r -f pequenos medianos grandes
echo "Creando las carpetas pequenos, medianos y grandes..."
mkdir pequenos medianos grandes
echo "Copiando archivos..."
for x in $(find $1 -depth -type f); do
	if [[ $(wc -c < $x) -lt $umbral1 ]]; then
		cp $x pequenos
	elif [[ $(wc -c < $x) -gt $umbral2 ]]; then
		cp $x grandes
	else
		cp $x medianos
	fi
done

