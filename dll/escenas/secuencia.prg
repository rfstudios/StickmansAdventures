function secuencia()
	private
		int i,framecont=0,pf;
		bool mostrar;
		string cad;
	end
	begin
		screen_clear();
		delete_text(0);
		
		if(secuencias[cuentasecuencia]!="eof")
			//Abrimos el fichero con la info de la secuencia
				pf=fopen("dll/escenas/secuencias/"+secuencias[cuentasecuencia]+".yaw",O_READ);
				file=load_fpg("dll/fpgs/secuencias/"+secuencias[cuentasecuencia]+".fpg");
				
				cad=fgets(pf);
				while(cad!="eof")
					framecont++;
					put_screen(file,framecont);
					
					/* Fundido desde negro */
						fade(100,100,100,60);
						while(fading) frame; end
						
					for(i=atoi(cad);i>0;i--)
						frame;
					end
					
					/* Hacemos un fundido a negro */
						fade(0,0,0,60);
						while(fading) frame; end
			
					screen_clear();
					cad=fgets(pf);
				end
			
			cuentasecuencia++;
			fclose(pf);
			
			/* Fundido desde negro */
				fade(100,100,100,30);
				while(fading) frame; end
		end
	end 