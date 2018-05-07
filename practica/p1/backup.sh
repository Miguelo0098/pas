#!/bin/bash
if [[ $# -ne 1 ]]; then
	echo "El uso del programa es ./backup.sh nombreFichero"
	exit 1	
fi
if [[ -f $1 ]]; then
	
fi