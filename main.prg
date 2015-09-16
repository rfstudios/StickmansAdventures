include "imports.prg";
include "includes.prg";

process main()
	begin
		logon();
		/*Cargas*/
			scale_resolution=12800960; log("Seteada escala");
			cargar_recursos(); log("Recursos cargados"); //Función;
			if(V_MODE!=MODE_WINDOW) log("Splash screens"); presentacion2(); end
			control(); log("Control de ejecución activado"); //Proceso;
			resolucion(); log("Seteada resolución"); //Función;
			set_fps(60,1); log("Seteados fps a 60"); //Establece los frames por segundo;
		
		if(V_MODE!=MODE_WINDOW) musica(); log("Activada música"); end
		presentacion(); log("Presentación"); //Función;
		menu(); log("Mainmenu");
	end 
