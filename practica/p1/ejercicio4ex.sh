#!/bin/bash
echo "El numero de archivos en la carpeta actual es $(find -maxdepth 1 -type f | wc -l)"
echo "------------------------"
echo "Esta sería la lista de usuarios conectados en este momento:"
users | sort | uniq
echo "------------------------"
letra="a"
read -p "Qué caracter quieres contar? " -n1 -t5 letra
echo ""
if [[ letra == "" ]]; then
	letra="a"
fi
let sol=$(find -type f | wc -m)-$(find -type f | tr -d [=$letra=] | wc -m)
echo "La letra $letra aparece $sol veces"