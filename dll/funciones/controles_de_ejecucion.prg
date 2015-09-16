// Controles de ejecución
function int verificar(string mensaje)
	begin
		file=fpgs[0];
		graph=1;
		
		x=resol_x/2;
		y=resol_y/2;
		z=-20; //Para asegurarnos de que aparece siempre arriba del todo;
		
		//Devolvemos la luz a la pantalla
			fade(100,100,100,1);
			while(fading)
				frame;
			end
			
		loop
			if(key(_s))
				while(key(_s))
					frame;
				end
				return 1;
			end
			if(key(_n))
				while(key(_n))
					frame;
				end
				return 0;
			end
			frame;
		end
	end
	
process control()
	private
		bool verif;
	end
	begin
		loop
			if(key(_esc))
				signal(ALL_PROCESS, s_freeze_tree);
				verif=verificar("¿Seguro que deseas salir del programa?"); //Función;
				
				if(verif!=0)
					let_me_alone();
					exit(0);
				else
					signal(ALL_PROCESS, S_WAKEUP);
				end
			end
			if(key(_r))
				while(key(_r))
					frame;
				end
				muerto=true;;
			end
			frame;
		end
	end
// Fin de Control de ejecución