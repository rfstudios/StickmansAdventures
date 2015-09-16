// Funciones de gráficos
function resolucion()
	private
		bool verif;
		string mensaje="¿Seguro que quieres esta resolución?";
		int pf;
	end
	begin		
		
		file=fpgs[0];
		graph=2;
		
		resol_x=640;
		resol_y=480;
		set_mode(resol_x,resol_y,16,V_MODE);
		
		x=resol_x/2;
		y=resol_y/2;
		
		if(fexists("config.yaw"))
			resol_x=buscar("resol_x");
			resol_y=buscar("resol_y");
		else
			loop
				if(key(_1))//320x240;
					verif=verificar(mensaje);
					if(verif!=0)
						resol_x=320;
						resol_y=240;
						break;
					end
				end
				if(key(_2))//640x480;
					verif=verificar(mensaje);
					if(verif!=0)
						resol_x=640;
						resol_y=480;
						break;
					end
				end
				if(key(_3))//1280x960;
					verif=verificar(mensaje);
					if(verif!=0)
						resol_x=1280;
						resol_y=960;
						break;
					end
				end
				frame;
			end
		
			pf=fopen("config.yaw",O_WRITE);
			if(pf)
				fputs(pf,"[resol_x]");
				fputs(pf,resol_x);
				fputs(pf,"[resol_y]");
				fputs(pf,resol_y);
				
				fclose(pf);
			end		
		end
		set_mode(resol_x,resol_y,16,V_MODE);
	end
	function cargar_fpgs()
		private
			int i;
		end
		begin
			fpgs[0]=load_fpg("dll/fpgs/common.fpg");
			fpgs[1]=load_fpg("dll/fpgs/prota.fpg");
			fpgs[3]=load_fpg("dll/fpgs/malos.fpg");
			fpgs[4]=load_fpg("dll/fpgs/controles.fpg");
			fpgs[5]=load_fpg("dll/fpgs/objetos.fpg");
			fpgs[6]=load_fpg("dll/fpgs/spsc.fpg");
						
			cancs[0]=load_song("dll/songs/mainmenu.mp3");
			cancs[1]=load_song("dll/songs/1.ogg");
		end
// Fin de Funciones de gráficos
