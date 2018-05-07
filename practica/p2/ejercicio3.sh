#!/bin/bash
if [[ $# < 1 ]]; then
	echo "Error: no se ha introducido el fichero como parámetro!"
	echo "El programa va a cerrarse..."
	echo ""
	exit
fi

echo "========="
echo "Listado de archivo ocultos del directorio" ~
ls ~ -a -1 | grep -E '^\.'
echo "========="
echo "El fichero a procesar es $1."
cat $1 | grep -E '^$' -v >$1.sinLineasVacias
echo "El fichero sin líneas vacías se ha guardado en $1.sinLineasVacias"
echo "========="
echo "Listado de los procesos ejecutados por el usuario $USER:"
ps ao pid,start,command | grep -E '^\s*[[:alpha:]]' -v | sed -r -n -e 's/\s([0-9]+)\s(..:..:..)\s(.+)$/PID: "\1" Hora: "\2" Ejecutable: "\3"/p'
echo "========="