#!/bin/bash
if [[ $# < 1 ]]; then
	echo "Error: no se ha introducido el fichero como parámetro!"
	echo "El programa va a cerrarse..."
	echo ""
	exit
fi

if [[ $# < 2 ]]; then
	echo "Error: no se ha introducido el número de segundos de espera como parámetro!"
	echo "El programa va a cerrarse..."
	echo ""
	exit
fi

for ip in $(cat $1); do
	echo vivo
	temp=$(ping $ip -c 1 -W $2)
	if [[ $? == 0 ]]; then
		sed -r -n -e 's/time=([0-9,]+) ms/La IP $ip respondió en \1 milisegundos./p' $temp
	else
		echo "La IP $ip no respondió tras $2 segundos."
	fi
done