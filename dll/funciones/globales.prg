global
	int resol_x,resol_y;
	int fpgs[7]; /*Gráficos*/
	int fnts[2]; /*Fuentes*/
	int cancs[3]; /*Canciones*/
	int vidas,pid,canc,lim=14;
	bool gravedad,muerto;
	string niveles[99];
	string secuencias[99];
	bool nuevanot,caja,anim;
	bool direc, apertura;
	int botonp;
	int puntuacion=0, pfinal=0;
	int sonando,volumen=100;
	int cuentasecuencia=0;
	
	/*Controles*/
		bool grav_u,grav_d,countdown;
		bool ganimacion;
	
	/*Log y debug*/
		int V_MODE=MODE_WINDOW;
		int gpf;
		int g_log=false;
end 
local
	bool auxiliar=false;
end
