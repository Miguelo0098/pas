#!/bin/bash
echo "Comprimiendo archivos..."
nombre="copia-$USER-$(date +%s).tar.gz"
tar -cf $nombre $*

echo "Archivos comprimidos! Moviendo a carpeta Copia..."
mkdir ~/Copia
mv $nombre ~/Copia
for x in $(find ~/Copia/ -type f); do
	let antiq=$(date +%s)-$(stat -c "%Y" $x)
	if [[ $antiq -gt 200 ]]; then
		echo "Borrando $x"
		rm $x
	fi
done 
echo "Ficheros actualizados con éxito!"