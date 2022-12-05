Proceso contador_td
	
	Definir START, RESET, PAUSE Como Logico;
	Definir contador Como Real;
	
	Escribir "START: ";
	Mientras START = falso Hacer
		Leer START;	
	FinMientras
	
	InicioDeConteo(contador);
	ComenzarAContar(START, RESET, PAUSE, contador);
	
	
FinProceso

SubProceso ComenzarAContar(START, RESET, PAUSE, contador)
	Escribir "RESET: ";
	Leer RESET;	
	si RESET = Verdadero Entonces
		InicioDeConteo(contador);
		ComenzarAContar(START, RESET, PAUSE, contador);
	FinSi

	Escribir "PAUSA: ";
	Leer PAUSE;	
	si PAUSE = Verdadero Entonces
		ComenzarAContar(START, RESET, PAUSE, contador);
	FinSi
	
	si contador < 99 Entonces
		contador <- contador + 0.01;
		ComenzarAContar(START, RESET, PAUSE, contador);
	FinSi
	
FinSubProceso	

SubProceso InicioDeConteo(contador)
	contador <- 0;
FinSubProceso
	