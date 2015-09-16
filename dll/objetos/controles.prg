process controles(int tipo, int est, int x, int y)
	private
		int estado,int usado=0,cont;
	end
	begin
		file=fpgs[4];
		ctype=c_scroll;
		estado=est;
		z=10;
		
		switch(tipo)
			////////////////////////////////////////////////////////////////////////////////////////
			case 1: //Gravedad up;
				loop
					if(estado!=true)
						graph=1;
					else
						graph=2;
					end
					
					if(grav_u==true)
						if(key(_q) || key(_up))
							gravedad=false;
						end
					end
					
					if(usado==0 && collision(type prota))
						usado=1;
						if(estado==false)
							estado=true;
							grav_u=true;
							notificacion(4);
						else
							estado=false;
							grav_u=false;
							notificacion(3);
						end
					end
					frame;
				end
			end
			////////////////////////////////////////////////////////////////////////////////////////
			case 2: //Gravedad down;
				flags=2;
				loop
					if(estado!=true)
						graph=1;
					else
						graph=2;
					end
					
					if(grav_d==true)
						if(key(_e) || key(_down))
							gravedad=true;
						end
					end
					
					if(usado==0 && collision(type prota))
						usado=1;
						if(estado==false)
							estado=true;
							grav_d=true;
							notificacion(6);
						else
							estado=false;
							grav_d=false;
							notificacion(5);
						end
					end
					frame;
				end
			end
			////////////////////////////////////////////////////////////////////////////////////////
			case 3: //Countdown
				flags=0;
				cont=360;
				loop
					if(estado!=true)
						graph=7;
					else
						graph=8;
					end
					
					if(countdown==true && estado==true)
						cont--;
						if(cont==180)
							numero(11);
						elsif(cont==120)
							numero(12);
						elsif(cont==60)
							numero(13);
						elsif(cont==0)
							if(gravedad!=false)
								gravedad=false;
							else
								gravedad=true;
							end
							cont=360;
						end
					end
					
					if(usado==0 && collision(type prota))
						usado=1;
						estado=true;
						countdown=true;
						notificacion(10);
					end
					if(usado==1&& countdown==false)
						loop
							frame;
						end
					end
					frame;
				end
			end
			////////////////////////////////////////////////////////////////////////////////////////
			case 4: //Desactiva Countdown
				flags=0;
				loop
					if(estado!=true)
						graph=8;
					else
						graph=7;
					end
					
					if(usado==0 && collision(type prota))
						usado=1;
						estado=true;
						countdown=false;
						notificacion(9);
					end
					frame;
				end
			end
			////////////////////////////////////////////////////////////////////////////////////////
			case 5: //Punto;
				loop
					if(estado!=true)
						graph=14;
					else
						graph=15;
					end
										
					if(!estado && collision(type prota))
						estado=true;
						puntuacion++;
						notificacion(16);
					end
					frame;
				end
			end
			////////////////////////////////////////////////////////////////////////////////////////
			case 6: //Cerradura;
				loop				
					if(!estado && collision(type prota))
						father.auxiliar=true;
						estado=true;
					end
					if(estado!=true)
						graph=17;
					else
						graph=18;
					end
						
					frame;
				end
			end
			////////////////////////////////////////////////////////////////////////////////////////
		end
	end 
	
process notificacion(int graph)
	private
		int i,nuevo;
	end
	begin
		file=fpgs[4];
		x=102;
		y=30;
		
		nuevanot=true;
		frame;
		frame;
		nuevanot=false;
		
		for(i=0;i<120;i++)
			if(nuevanot==true)
				y+=35;
			end
			frame;
		end
	end 
process numero(int graph)
	private
		int i,nuevo;
	end
	begin
		file=fpgs[4];
		x=resol_x/2;
		y=resol_y/2;
		
		for(i=0;i<55;i++)			
			//size--;
			frame;
		end
	end 
