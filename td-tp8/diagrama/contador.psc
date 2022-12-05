Proceso contador
	
	Definir INICIO, REINICIO, PAUSA Como Logico;
	Definir TiempoTranscurrido Como Real;
	
	Escribir "INICIO: ";
	Mientras INICIO = falso Hacer
		Leer INICIO;	
	FinMientras
	
	InicioDeConteo(TiempoTranscurrido);
	ComenzarAContar(INICIO, REINICIO, PAUSA, TiempoTranscurrido);
	
	
FinProceso

SubProceso ComenzarAContar(INICIO, REINICIO, PAUSA, TiempoTranscurrido)
	Escribir "REINICIO: ";
	Leer REINICIO;	
	si REINICIO = Verdadero Entonces
		InicioDeConteo(TiempoTranscurrido);
		ComenzarAContar(INICIO, REINICIO, PAUSA, TiempoTranscurrido);
	FinSi

	Escribir "PAUSA: ";
	Leer PAUSA;	
	si PAUSA = Verdadero Entonces
		ComenzarAContar(INICIO, REINICIO, PAUSA, TiempoTranscurrido);
	FinSi
	
	si TiempoTranscurrido < 99 Entonces
		TiempoTranscurrido <- TiempoTranscurrido + 0.01;
		ComenzarAContar(INICIO, REINICIO, PAUSA, TiempoTranscurrido);
	FinSi
	
FinSubProceso	

SubProceso InicioDeConteo(TiempoTranscurrido)
	TiempoTranscurrido <- 0;
FinSubProceso
