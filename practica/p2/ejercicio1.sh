#!/bin/bash
if [[ $# < 1 ]]; then
	echo "Error: no se ha introducido el fichero como parámetro!"
	echo "El programa va a cerrarse..."
	echo ""
	exit
fi

echo '****************************'
echo '1) Líneas con la duración de las películas:'
cat $1 | grep -E '^.hr ..min$'
echo '****************************'
echo '2) Líneas con el país de las películas:'
cat $1 | grep -E '\-.+\-$'
echo '****************************'
echo '3) Sólo el país de las películas:'
cat $1 | grep -E '\-.+\-$' -o | grep -E '[[:alpha:] ,]+' -o
echo '****************************'
echo "4) Hay $(cat $1 | grep -E '^\(../../2016\)' | wc -l) películas de 2016 y $(cat $1 | grep -E '^\(../../2017\)' | wc -l) películas de 2017"
echo '****************************'
echo "5) Eliminar líneas vacías:"
cat $1 | grep -E '^$' -v
echo '****************************'
echo "6) Líneas que empiezan por la letra E (con o sin espacios antes):"
cat $1 | grep -E '^\s*E'
echo '****************************'
echo "7) Líneas que contienen d, l o t, una vocal y la misma letra:"
cat $1 | grep -E 'd[aeiou]d|l[aeiou]l|t[aeiou]t'
echo '****************************'
echo "8) Líneas que contienen ocho aes o más:"
cat $1 | grep -E '[Aa].*[Aa].*[Aa].*[Aa].*[Aa].*[Aa].*[Aa].*[Aa]'
echo '****************************'
echo "9) Líneas que terminan con tres puntos y no empiezan por espacio:"
cat $1 | grep -E '^\s+' -v | grep -E '\.{3,3}$'
echo '****************************'
echo "10) Mostrar entre comilla las vocales con tilde:"
cat $1 | sed -r -e 's/([ÁÉÍÓÚáéíóú])/"\1"/g'
echo '****************************'