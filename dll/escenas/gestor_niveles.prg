process gest_levels(int lev)
	private
		int level,pf,pf2,i,tes,capi;
		bool mostrar;
		string cadena,cadena2,cadena3,mensaje,cadena4,cadena5,cadena6,cadena7,punt;
	end
	begin
		vidas=3;
		capi=lev;
		for(level=lev;niveles[level]!="eof";level++)
			if(niveles[level]=="secuencia")
				log("Secuencia");
				secuencia();
			else
				log("Nivel "+level);
				//Pantalla de presentación del nivel
					mensaje="Chapter "+itoa(capi);
					write_var(fnts[0],320,150,1,mensaje);
			
					vidas=3;
			
					loop
						if(i==60)
							if(mostrar!=true)
								mostrar=true;
								tes=write(fnts[0],resol_x/2,resol_y-150,1,"Action!");
								i=0;
							else
								mostrar=false;
								delete_text(tes);
								i=0;
							end
						end
						i++;
				
						if(key(_enter))
							while(key(_enter))
								frame;
							end
							break;
						end
						frame;
					end
					delete_text(0);
				/////////////////////////////////////
			
				//Abrimos el fichero con la info del level
					pf=fopen("dll/escenas/niveles/"+niveles[level]+".yaw",O_READ);
			
				//Cargamos los gráficos
					cadena=fgets(pf);
					fpgs[2]=load_fpg("dll/fpgs/niveles/"+cadena+".fpg");
			
				//Cargamos musica
					cadena=fgets(pf);
					cambiar_musica(atoi(cadena));
				
				//Cargamos el scroll
					start_scroll (0,fpgs[2],2,3,0,0);
					scroll[0].x0=0;
					scroll[0].y0=0;
				
				//Cargamos la gravedad
					cadena=fgets(pf);
					if(cadena=="true")
						gravedad=true;
					else
						gravedad=false;
					end
				
				//Cargamos al prota
					cadena=fgets(pf);
					cadena2=fgets(pf);
					pid=prota(atoi(cadena),atoi(cadena2));
				
				//Cargamos los malos				
					pf2=fopen("dll/escenas/niveles/"+niveles[level]+"_malos.yaw",O_READ);
					if(pf2)
						while(!feof(pf2))
							cadena=fgets(pf2);
							cadena2=fgets(pf2);
							cadena3=fgets(pf2);
						
							malos(atoi(cadena),atoi(cadena2),atoi(cadena3));
						end
						fclose(pf2);
					end
			
				//Cargamos los controles			
					pf2=fopen("dll/escenas/niveles/"+niveles[level]+"_controles.yaw",O_READ);
					if(pf2)
						while(!feof(pf2))
							cadena=fgets(pf2);
							cadena2=fgets(pf2);
							cadena3=fgets(pf2);
							cadena4=fgets(pf2);

							controles(atoi(cadena),atoi(cadena2),atoi(cadena3),atoi(cadena4));
						end
						fclose(pf2);
					end
			
				//Cargamos los objetos			
					pf2=fopen("dll/escenas/niveles/"+niveles[level]+"_objetos.yaw",O_READ);
					if(pf2)
						while(!feof(pf2))
							cadena=fgets(pf2);
							cadena2=fgets(pf2);
							cadena3=fgets(pf2);
							cadena4=fgets(pf2);
							cadena5=fgets(pf2);
							cadena6=fgets(pf2);
							cadena7=fgets(pf2);
						
							objetos(atoi(cadena),atoi(cadena2),atoi(cadena3),atoi(cadena4),atoi(cadena5),atoi(cadena6),atoi(cadena7));
						end
						fclose(pf2);
					end
				//Cargamos las cajas			
					pf2=fopen("dll/escenas/niveles/"+niveles[level]+"_cajas.yaw",O_READ);
					if(pf2)
						while(!feof(pf2))
							cadena=fgets(pf2);
							cadena2=fgets(pf2);						
							caja(atoi(cadena),atoi(cadena2));
						end
						fclose(pf2);
					end
				
				//Situamos al proceso como meta del level
					ctype=c_scroll;
					file=fpgs[0];
					x=atoi(fgets(pf));
					y=atoi(fgets(pf));
					flags=atoi(fgets(pf));
					graph=7;
					
				//Cargamos el límite de salto
					cadena=fgets(pf);
					lim=atoi(cadena);
				
				//Desbloqueamos al personaje
					anim=false;
				//Cerramos el archivo de información del level
					fclose(pf);
					
				//Ponemos a funcionar el nivel	
					loop			
						//Si el protagonista llega a la meta
							if(collision(type prota))
								break;
							end
						
						//Si detectamos que el protagonista ha muerto
							if(muerto==true)
								break;
							end
							
						frame;
					end 
				
					//Si pasamos por aqui es que hemos muerto o hemos finalizado con éxito el nivel
						//Oscurecemos la pantalla
							anim=true;
							fade(0,0,0,1); 
							while(fading)
								frame;
							end
					
					//Paramos el scroll
						stop_scroll(0);
							
					//Ponemos bien el flags
						flags=0;
					
					//Matamos a todos los hijos
						signal(type malos,s_kill);
						signal(type controles,s_kill);
						signal(type objetos,s_kill);
						signal(type caja,s_kill);
						caja=false;
						//apertura=false;
					
					if(muerto!=true) //Si el personaje NO ha muerto
						//Matamos el proceso del protagonista
							signal(type prota,s_kill);
						
						//Sumamos la puntuación
							pfinal+=puntuacion;
							puntuacion=0;
							
						//Sumamos 1 al contador del capítulo
							capi++;
						
						//Llamamos a la pantalla de cleared
					else //Si el personaje ha muerto
						//Reseteamos la puntuación
							puntuacion=0;
						//Reseteamos el nivel
							level--;
						//Y quitamos una vida
							vidas--;
							if(vidas<0) //Si se nos han acabado las vidas
								//break; //Acabamos el juego
							else //Si no se nos han acabado
								muerto=false; //Devolvemos a la vida al personaje
							end
					end
				//Devolvemos la luz a la pantalla
					fade(100,100,100,1);
					while(fading)
						frame;
					end
			end
		end
		creditos();
	end 