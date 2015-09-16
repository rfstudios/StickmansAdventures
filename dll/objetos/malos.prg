process malos(int tipo, int eq, int iy)
	private
		int grav_y=0,grav_x=0;
		int i,j,k;
		bool izq=true;
	end
	begin
		file=fpgs[3];
		ctype=c_scroll;
		x=eq;
		y=iy;

		while(get_dist(pid)>640)
			frame;
		end
		switch(tipo)
			case 1: //Malo básico. Le afecta la gravedad
				size=23;
				flags=0;
				graph=10;
				grav_y=0;
				grav_x=0;
				
				loop
					if(izq!=true && map_get_pixel(fpgs[2],1,x+6,y)!=map_get_pixel(fpgs[0],6,3,0))
						// Animación de andar /////
							j++;
							if(j==2)
								j=0;
								graph++;
								if(graph>=19)
									graph=11;
								end
							end
						////////////////////////////////
						grav_x=1;
					elsif(map_get_pixel(fpgs[2],1,x+6,y)==map_get_pixel(fpgs[0],6,3,0))
						izq=true;
					end
					if(izq==true && map_get_pixel(fpgs[2],1,x-6,y)!=map_get_pixel(fpgs[0],6,2,0))
						// Animación de andar /////
							j++;
							if(j==2)
								j=0;
								if(graph>9)
									graph=8;
								end
								graph--;
								if(graph<=1)
									graph=9;
								end
							end
						////////////////////////////////				
						grav_x=-1;
					elsif(map_get_pixel(fpgs[2],1,x-6,y)==map_get_pixel(fpgs[0],6,2,0))
						izq=false;
					end
			
					if(grav_y<15)
						grav_y++;
					end
			
					if(gravedad!=false)
						flags=0;	
						if(grav_y>0)
							for(i=0;i<grav_y;i++)
								if(map_get_pixel(fpgs[2],1,x,y+13)!=map_get_pixel(fpgs[0],6,0,0) && map_get_pixel(fpgs[2],1,x,y+13)!=map_get_pixel(fpgs[0],6,5,0))
									y++;
								end
							end
						else
							y+=grav_y;
						end
					else
						flags=2;
						if(grav_y>0)
							for(i=0;i<grav_y;i++)
								if(map_get_pixel(fpgs[2],1,x,y-13)!=map_get_pixel(fpgs[0],6,1,0) && map_get_pixel(fpgs[2],1,x,y-13)!=map_get_pixel(fpgs[0],6,4,0))
									y--;
								end
							end
						else
							y-=grav_y;				
						end
					end
		
					x+=grav_x;
					if(grav_x<0)
						grav_x++;
					elsif(grav_x>0)
						grav_x--;
					end
			
					frame;
				
					if(y>640 && gravedad==true)
						break;
					elsif(y<0 && gravedad==false)
						break;
					end
				end
			end
						
			case 2: //se da la vuelta en los bordes pero le afecta la gravedad
				size=23;
				flags=0;
				graph=10;
				grav_y=0;
				grav_x=0;
				
				loop
					if(gravedad!=false)
						if(izq!=false)
							if(map_get_pixel(fpgs[2],1,x-6,y+13)!=map_get_pixel(fpgs[0],6,0,0) && map_get_pixel(fpgs[2],1,x,y+13)!=map_get_pixel(fpgs[0],6,5,0))
								izq=false;
							end
						else
							if(map_get_pixel(fpgs[2],1,x+6,y+13)!=map_get_pixel(fpgs[0],6,0,0) && map_get_pixel(fpgs[2],1,x,y+13)!=map_get_pixel(fpgs[0],6,5,0))	
								izq=true;
							end
						end
					else
						if(izq!=false)
							if(map_get_pixel(fpgs[2],1,x-6,y-13)!=map_get_pixel(fpgs[0],6,1,0) && map_get_pixel(fpgs[2],1,x,y-13)!=map_get_pixel(fpgs[0],6,4,0))	
								izq=false;
							end
						else
							if(map_get_pixel(fpgs[2],1,x+6,y-13)!=map_get_pixel(fpgs[0],6,1,0) && map_get_pixel(fpgs[2],1,x,y-13)!=map_get_pixel(fpgs[0],6,4,0))	
								izq=true;
							end
						end
					end
					
					if(izq!=true && map_get_pixel(fpgs[2],1,x+6,y)!=map_get_pixel(fpgs[0],6,3,0))
						// Animación de andar /////
							j++;
							if(j==2)
								j=0;
								graph++;
								if(graph>=19)
									graph=11;
								end
							end
						////////////////////////////////
						grav_x=1;
					elsif(map_get_pixel(fpgs[2],1,x+6,y)==map_get_pixel(fpgs[0],6,3,0))
						izq=true;
					end
					if(izq==true && map_get_pixel(fpgs[2],1,x-6,y)!=map_get_pixel(fpgs[0],6,2,0))
						// Animación de andar /////
							j++;
							if(j==2)
								j=0;
								if(graph>9)
									graph=8;
								end
								graph--;
								if(graph<=1)
									graph=9;
								end
							end
						////////////////////////////////				
						grav_x=-1;
					elsif(map_get_pixel(fpgs[2],1,x-6,y)==map_get_pixel(fpgs[0],6,2,0))
						izq=false;
					end
			
					if(grav_y<15)
						grav_y++;
					end
			
					if(gravedad!=false)
						flags=0;	
						if(grav_y>0)
							for(i=0;i<grav_y;i++)
								if(map_get_pixel(fpgs[2],1,x,y+13)!=map_get_pixel(fpgs[0],6,0,0) && map_get_pixel(fpgs[2],1,x,y+13)!=map_get_pixel(fpgs[0],6,5,0))
									y++;
								end
							end
						else
							y+=grav_y;
						end
					else
						flags=2;
						if(grav_y>0)
							for(i=0;i<grav_y;i++)
								if(map_get_pixel(fpgs[2],1,x,y-13)!=map_get_pixel(fpgs[0],6,1,0) && map_get_pixel(fpgs[2],1,x,y-13)!=map_get_pixel(fpgs[0],6,4,0))
									y--;
								end
							end
						else
							y-=grav_y;				
						end
					end
		
					x+=grav_x;
					if(grav_x<0)
						grav_x++;
					elsif(grav_x>0)
						grav_x--;
					end
			
					frame;
				
					if(y>640 && gravedad==true)
						break;
					elsif(y<0 && gravedad==false)
						break;
					end				
				end
			end
			
			case 3: //Se da la vuelta en los bordes y tiene su gravedad siempre hacia abajo
				size=23;
				flags=0;
				graph=10;
				grav_y=0;
				grav_x=0;
				
				loop
					if(izq!=false)
						if(map_get_pixel(fpgs[2],1,x-6,y+13)!=map_get_pixel(fpgs[0],6,0,0) && map_get_pixel(fpgs[2],1,x-6,y+13)!=map_get_pixel(fpgs[0],6,5,0))
							izq=false;
						end
					else
						if(map_get_pixel(fpgs[2],1,x+6,y+13)!=map_get_pixel(fpgs[0],6,0,0) && map_get_pixel(fpgs[2],1,x+6,y+13)!=map_get_pixel(fpgs[0],6,5,0))	
							izq=true;
						end
					end
					
					if(izq!=true && map_get_pixel(fpgs[2],1,x+6,y)!=map_get_pixel(fpgs[0],6,3,0))
						// Animación de andar /////
							j++;
							if(j==2)
								j=0;
								graph++;
								if(graph>=19)
									graph=11;
								end
							end
						////////////////////////////////
						grav_x=1;
					elsif(map_get_pixel(fpgs[2],1,x+6,y)==map_get_pixel(fpgs[0],6,3,0))
						izq=true;
					end
					if(izq==true && map_get_pixel(fpgs[2],1,x-6,y)!=map_get_pixel(fpgs[0],6,2,0))
						// Animación de andar /////
							j++;
							if(j==2)
								j=0;
								if(graph>9)
									graph=8;
								end
								graph--;
								if(graph<=1)
									graph=9;
								end
							end
						////////////////////////////////				
						grav_x=-1;
					elsif(map_get_pixel(fpgs[2],1,x-6,y)==map_get_pixel(fpgs[0],6,2,0))
						izq=false;
					end
			
					if(grav_y<15)
						grav_y++;
					end
			
					flags=0;	
					if(grav_y>0)
						for(i=0;i<grav_y;i++)
							if(map_get_pixel(fpgs[2],1,x,y+13)!=map_get_pixel(fpgs[0],6,0,0) && map_get_pixel(fpgs[2],1,x,y+13)!=map_get_pixel(fpgs[0],6,5,0))
								y++;
							end
						end
					else
						y+=grav_y;
					end
		
					x+=grav_x;
					if(grav_x<0)
						grav_x++;
					elsif(grav_x>0)
						grav_x--;
					end
			
					frame;
				
					if(y>640 && gravedad==true)
						break;
					elsif(y<0 && gravedad==false)
						break;
					end				
				end
			end
			
			case 4: //Se da la vuelta en los bordes y tiene su gravedad siempre hacia arriba
				size=23;
				flags=2;
				graph=10;
				grav_y=0;
				grav_x=0;
				
				loop
					if(izq!=false)
						if(map_get_pixel(fpgs[2],1,x-6,y-13)!=map_get_pixel(fpgs[0],6,1,0) && map_get_pixel(fpgs[2],1,x-6,y-13)!=map_get_pixel(fpgs[0],6,4,0))	
							izq=false;
						end
					else
						if(map_get_pixel(fpgs[2],1,x+6,y-13)!=map_get_pixel(fpgs[0],6,1,0) && map_get_pixel(fpgs[2],1,x+6,y-13)!=map_get_pixel(fpgs[0],6,4,0))	
							izq=true;
						end
					end
					
					if(izq!=true && map_get_pixel(fpgs[2],1,x+6,y)!=map_get_pixel(fpgs[0],6,3,0))
						// Animación de andar /////
							j++;
							if(j==2)
								j=0;
								graph++;
								if(graph>=19)
									graph=11;
								end
							end
						////////////////////////////////
						grav_x=1;
					elsif(map_get_pixel(fpgs[2],1,x+6,y)==map_get_pixel(fpgs[0],6,3,0))
						izq=true;
					end
					if(izq==true && map_get_pixel(fpgs[2],1,x-6,y)!=map_get_pixel(fpgs[0],6,2,0))
						// Animación de andar /////
							j++;
							if(j==2)
								j=0;
								if(graph>9)
									graph=8;
								end
								graph--;
								if(graph<=1)
									graph=9;
								end
							end
						////////////////////////////////				
						grav_x=-1;
					elsif(map_get_pixel(fpgs[2],1,x-6,y)==map_get_pixel(fpgs[0],6,2,0))
						izq=false;
					end
			
					if(grav_y<15)
						grav_y++;
					end
			
					if(grav_y>0)
						for(i=0;i<grav_y;i++)
							if(map_get_pixel(fpgs[2],1,x,y-13)!=map_get_pixel(fpgs[0],6,1,0) && map_get_pixel(fpgs[2],1,x,y-13)!=map_get_pixel(fpgs[0],6,4,0))
								y--;
							end
						end
					else
						y-=grav_y;
					end
		
					x+=grav_x;
					if(grav_x<0)
						grav_x++;
					elsif(grav_x>0)
						grav_x--;
					end
			
					frame;
				
					if(y>640 && gravedad==true)
						break;
					elsif(y<0 && gravedad==false)
						break;
					end				
				end
			end
			
			case 6: //Mancha de tinta
				flags=0;
				graph=20;
				
				y=240;
				if(eq<0)
					grav_x=iy;
				else
					grav_x=-iy;
				end
				
				i=0;
				loop
					if(i>2)
						x+=iy;
						i=0;
					else
						i++;
					end
					
					frame;
				end
			end
			
		end
	end 