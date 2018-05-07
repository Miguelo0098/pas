#!/bin/bash

read -p "Introduzca un número (1 <= x < 10): " x
if [ $x -lt 1 ]
then
	echo "Fuera de rango!"
elif [ $x -ge 10 ]
then
	echo "Fuera de rango!"
else
	echo "El número $x es correcto"
fi