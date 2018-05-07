#!/bin/bash
cat /proc/cpuinfo | sed -rn -e 's/^model name	: (.+)$/Modelo de procesador: \1/pg' | sort -u
cat /proc/cpuinfo | sed -rn -e 's/cpu MHz		: (.+)$/Megahercios: \1/gp' | sort -u
echo "Número de hilos máximo de ejecución: $(cat /proc/cpuinfo | sed -rn -e 's/^model name	: (.+)$/Modelo de procesador: \1/pg' | wc -l)"
cat /proc/cpuinfo | sed -rn -e 's/^cache size	: (.+)$/Tamaño de caché: \1/pg' | sort -u
cat /proc/cpuinfo | sed -rn -e 's/^vendor_id	: (.+)$/ID vendedor: \1/pg' | sort -u
echo '=========='
echo "Puntos de montaje:"

cat /proc/mounts | sed -r -e 's/^(.+) (.+) (.+) r.*/-> Punto de montaje: \2, Dispositivo: \1, Tipo de dispositivo: \3/g' | sort -k 5,5 -r
echo '=========='
echo "Particiones y número de bloques:"
cat /proc/partitions | sed -rn -e 's/^ *[0-9]+ *[0-9]+ *([0-9]+) (.+)$/-> Partición: \2, Número de bloques: \1/gp' | sort -k 3,3 -r