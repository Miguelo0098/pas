#!/bin/bash
if [[ $# < 1 ]]; then
	echo "Error: no se ha introducido la shell del sistema como parámetro!"
	echo "El programa va a cerrarse..."
	echo ""
	exit
fi

while IFS=: read -r f1 f2 f3 f4 f5 f6 f7
do 
	if [[ $f7 == $1 ]]; then
		echo "=========================="
		echo "Logname: $f1"
		echo "->UID: $f3"
		for line in $(cat /etc/group); do
			group=$(echo $line | sed -r -e 's/^(.+):.:(.+)$/\1/g')
			gid=$(echo $line | sed -r -e 's/^(.+):.:(.+)$/\2/g')
			if [[ $gid == $f4 ]]; then
				echo "->Grupo: $group"
			fi
		done
		echo "->GID: $f4"
		echo "->gecos: $f5"
		echo "->Home: $f6"
		echo "->Shell: $f7"
		for user_ in $(users); do
			if [[ $user_ == $f1 ]]; then
				status=1
			else
				status=0
			fi
		done
		echo "->Logeado: $status"
	fi
done < /etc/passwd