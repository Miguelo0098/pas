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
	temp=$(ping $ip -c 1 -W $2)
	if [[ $? == 0 ]]; then
		echo $temp | grep -E 'PING [0-9\.]+ .* time=[0-9\.]+ ms' -o | sed -r -e 's/PING ([0-9\.]+) .* time=([0-9\.]+) ms/La IP \1 respondió en \2 milisegundos./g'
	else
		echo "La IP $ip no respondió tras $2 segundos."
	fi
done | sort -k 6,6 -d