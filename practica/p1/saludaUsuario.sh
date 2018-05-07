#!/bin/bash

read -p "Introduzca su nombre de usuario: " name
if [[ $name == $USER ]]; then
	echo "Bienvenido "$USER
else
	echo 'Eso es mentira, so marrana!' 
fi