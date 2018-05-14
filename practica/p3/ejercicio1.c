#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>

int main (int argc, char **argv)
{
	int c;
	
	/* Estructura a utilizar por getoptlong */
	static struct option long_options[] =
	{
		/* Opciones que no van a actuar sobre un flag */
		/* "opcion", recibe o no un argumento, 0,
		   identificador de la opción */
		{"username", required_argument, 0, 'u'},
		{"useruid",  required_argument,	   0, 'i'},
		{"groupname",  required_argument, 0, 'g'},
		{"groupid",  required_argument, 0, 'd'},
		{"allgroups",	no_argument, 0, 's'},
		{"allinfo",	required_argument, 0, 'a'},
		{"bactive",	no_argument, 0, 'b'},
		{"help",	no_argument, 0, 'h'},
		/* Necesario para indicar el final de las opciones */
		{0, 0, 0, 0}
	};

	/* Estas variables servirán para almacenar el resultado de procesar la línea de comandos */
	char *uvalue = NULL;
	char *ivalue = NULL;
	char *gvalue = NULL;
	char *dvalue = NULL;
	int sflag = 0;
	char *avalue = NULL;
	int bflag = 0;
	int hflag = 0;

	/* getopt_long guardará el índice de la opción en esta variable. */
	int option_index = 0;
	
	/* Deshabilitar la impresión de errores por defecto */
	/* opterr=0; */
	while ((c = getopt_long (argc, argv, "abc:d:f:", long_options, &option_index))!=-1)
	{
		/* El usuario ha terminado de introducir opciones */
		if (c == -1)
			break;
		switch (c)
		{
			case 'u':
				//printf("Opción -a\n");
				uvalue = optarg;
				break;

			case 'i':
				//printf("Opción -b\n");
				ivalue = optarg;
				break;

			case 'g':
				//printf("Opción -c con valor '%s'\n", optarg);
				gvalue = optarg;
				break;

			case 'd':
				//printf("Opción -d con valor '%s'\n", optarg);
				dvalue = optarg;
				break;

			case 's':
				//printf("Opción -f con valor '%s'\n", optarg);
				sflag = 1;
				break;

			case 'a':
				//printf("Opción -f con valor '%s'\n", optarg);
				avalue = optarg;
				break;

			case 'b':
				//printf("Opción -f con valor '%s'\n", optarg);
				bflag = 1;
				break;

			case 'h':
				//printf("Opción -f con valor '%s'\n", optarg);
				hflag = 1;
				break;

			case '?':
				/* getopt_long ya imprime su mensaje de error, no es necesario hacer nada */
				/* Si queremos imprimir nuestros propios errores, debemos poner opterr=0,
				 y hacer algo como lo que se expone a continuacion. Pruebe a hacer sus propios errores.
				if (optopt == 'c')
					fprintf (stderr, "La opción %c requiere un argumento.\n", optopt);*/
				break;

			default:
				abort ();
		}
		printf("optind: %d, optarg: %s, optopt: %c\n", optind, optarg, optopt);
	}

	/* Imprimir el resto de argumentos de la línea de comandos que no son opciones con "-" */
	if (optind < argc)
	{
		printf("Argumentos ARGV que no son opciones: ");
		while (optind < argc)
			printf("%s ", argv[optind++]);
		putchar ('\n');
	}
	printf ("aflag = %d, bflag = %d, cvalue = %s, dvalue = %s, fvalue = %s\n",aflag, bflag, cvalue, dvalue, fvalue);

	exit (0);
}

