process objetos(int tipo, int eq, int iy, int size_x, int size_y, int aux, int aux2)
	private
		int i,grav_y=0,grav_x=0;
		bool estado;
	end
	begin
		file=fpgs[5];
		ctype=c_scroll;
		x=eq;
		y=iy;
		
		switch(tipo)
			/////////////////////////////////////////////////////////////////////
				case 1: //Plataforma que cae
					graph=1;
					loop
						if(collision(type prota))
							for(i=0;i<15;i++)
								frame;
							end
							graph=2;
							if(gravedad==true)
								for(;y<650;y+=15)
									frame;
								end
							else
								for(;y>0;y-=15)
									frame;
								end
							end
							break;
						end
						frame;
					end
				end
			/////////////////////////////////////////////////////////////////////
				case 2: //Caja
					estado=false;
					graph=3;
					size_X=25;
					size_y=25;
					
					loop						
						if(estado==true && muerto!=true)
								if(key(_s))
									i=0;
									grav_x=0;
									
									while(key(_s))
										x=pid.x;
										if(gravedad==true)
											y=pid.y-24;
											flags=0;
										else
											y=pid.y+24;
											flags=2;
										end
										
										if(i>=1)
											i=0;
											if(grav_x<25) grav_x++; end
										else
											i++;
										end
										
										frame;
									end
									
									estado=false;
									caja=false;
									if(direc==true)
										grav_x=-grav_x;
									end
									grav_y=-1;
								end
								x=pid.x;
								if(gravedad==true)
									y=pid.y-24;
									flags=0;
								else
									y=pid.y+24;
									flags=2;
								end
						else	
							if(collision(type prota) && key(_s))
								while(key(_s))
									frame;
								end		
								estado=true;
								caja=true;
							end
							
							x+=grav_x;
							if(grav_x>0)
								grav_x--;
							elsif(grav_x<0)
								grav_x++;
							end
							if(collision(type objetos))
								grav_x=0;
							end
							
							if(grav_y<15)
								grav_y++;
							end
				
							if(gravedad!=false)
								flags=0;	
								if(grav_y>0)
									for(i=0;i<grav_y;i++)
										if(map_get_pixel(fpgs[2],1,x,y+5)!=map_get_pixel(fpgs[0],6,0,0) && map_get_pixel(fpgs[2],1,x,y+5)!=map_get_pixel(fpgs[0],6,5,0))
											y++;
										end
									end
								else
									y+=grav_y;
								end
								if(y>480)
									signal(id,s_kill);
								end
							else
								flags=2;
								if(grav_y>0)
									for(i=0;i<grav_y;i++)
										if(map_get_pixel(fpgs[2],1,x,y-6)!=map_get_pixel(fpgs[0],6,1,0) && map_get_pixel(fpgs[2],1,x,y-6)!=map_get_pixel(fpgs[0],6,4,0))
											y--;
										end
									end
								else
									y-=grav_y;				
								end
								if(y<0)
									signal(id,s_kill);
								end
							end
						end

						frame;
					end
				end
			/////////////////////////////////////////////////////////////////////
				case 3: //Puertas
					loop
						if(apertura!=true)
							graph=4;
							if(collision(type prota))
								if(direc!=false)
									pid.x+=3;
								else
									pid.x-=3;
								end
							end
						else
							graph=5;
						end
						frame;
					end
				end
			/////////////////////////////////////////////////////////////////////
				case 4: //Botón_puertas
					loop
						if(collision(type prota) || collision(type objetos))
							graph=2;
							apertura=true;
							botonp=id;
						else
							graph=1;
							apertura=false;
						end
						frame;
					end
				end
			/////////////////////////////////////////////////////////////////////
				case 5: //Destructor de botón_puertas
					while(!collision(type prota))
						graph=2;
						frame;
					end

					apertura=false;
					signal(botonp,s_kill);					
				end
			/////////////////////////////////////////////////////////////////////
				case 6: //Puerta molonga
					objetos(8,aux,aux2,100,100,0,0);
					loop
						if(auxiliar!=true)
							graph=4;
							if(collision(type prota))
								if(direc!=false)
									pid.x+=3;
								else
									pid.x-=3;
								end
							end
						else
							graph=5;
						end
						frame;
					end
				end
			/////////////////////////////////////////////////////////////////////
				case 7: //Puerta molonga 2
					controles(6,0,aux,aux2);
					loop
						if(auxiliar!=true)
							graph=4;
							if(collision(type prota))
								if(direc!=false)
									pid.x+=3;
								else
									pid.x-=3;
								end
							end
						else
							graph=5;
						end
						frame;
					end
				end
			/////////////////////////////////////////////////////////////////////
				case 8: //Botón molongo
					loop
						if(collision(type prota) || collision(type objetos))
							graph=2;
							father.auxiliar=true;
						else
							graph=1;
							father.auxiliar=false;
						end
						frame;
					end				
				end
			/////////////////////////////////////////////////////////////////////
		end
	end 
	
process caja(int x,int y)
	private
		int i,grav_y=0,grav_x=0;
		bool estado;
	end
	begin
		file=fpgs[5];
		ctype=c_scroll;
		estado=false;
		loop
			graph=6;
			z=100;
			if(collision(type prota) && estado==false)
				estado=true;
				puntuacion+=100;
						
				graph=7;
				for(i=0;i<5;i++)
					frame;
				end
				graph=8;
				for(i=0;i<5;i++)
					frame;
				end
				graph=8;
				for(i=0;i<5;i++)
					frame;
				end
				graph=9;
				for(i=0;i<5;i++)
					frame;
				end
				for(i=0;i<5;i++)
					frame;
				end
				graph=8;
				for(i=0;i<5;i++)
					frame;
				end
				graph=8;
				for(i=0;i<5;i++)
					frame;
				end
				graph=9;
				for(i=0;i<5;i++)
					frame;
				end
				graph=7;
				for(i=0;i<5;i++)
					frame;
				end
			end
			frame;
		end
	end 