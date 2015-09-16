process prota(int eq, int iy)
	private
		int grav_y=0,grav_x=0;
		int i,j,k,idm;
		bool salto=false;
	end
	begin
		file=fpgs[1];
		graph=10;
		ctype=c_scroll;
		scroll[0].camera=id;
		size=23;
		z=0;
		
		/*delete_text(0);
		write_var(fnts[1],20,20,3,x);
		write_var(fnts[1],80,40,3,y);*/
		
		x=eq;
		y=iy;
		flags=0;
		graph=10;
		grav_y=0;
		grav_x=0;
		
		loop
			while(anim==true)
				frame;
			end
			
			if(key(_d) && map_get_pixel(fpgs[2],1,x+6,y)!=map_get_pixel(fpgs[0],6,3,0))
				// Animación de andar /////
					if(caja!=true)
						j++;
						if(j==2)
							j=0;
							if(graph<11)
								graph=11;
							end
							graph++;
							if(graph>=19)
								graph=11;
							end
						end
					else
						j++;
						if(j==2)
							j=0;
							if(graph<111)
								graph=111;
							end
							graph++;
							if(graph>=119)
								graph=111;
							end
						end
					end
				////////////////////////////////
				grav_x=3;
				direc=false;
			end
			
			if(key(_a) && map_get_pixel(fpgs[2],1,x-6,y)!=map_get_pixel(fpgs[0],6,2,0))
				// Animación de andar /////
					if(caja!=true)
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
					else
						j++;
						if(j==2)
							j=0;
							if(graph>109)
								graph=108;
							end
							graph--;
							if(graph<=101)
								graph=109;
							end
						end
					end
				////////////////////////////////				
				grav_x=-3;
				direc=true;
			end
			
			if(grav_y<15)
				grav_y++;
			end
		
			if(gravedad!=false)
				flags=0;	
				if(grav_y>0)
					for(i=0;i<grav_y;i++)
						if(!collision(type objetos) &&  !collision(type objetos) &&  map_get_pixel(fpgs[2],1,x,y+13)!=map_get_pixel(fpgs[0],6,0,0) && map_get_pixel(fpgs[2],1,x,y+13)!=map_get_pixel(fpgs[0],6,5,0))
							y++;
						else
							if(grav_y>13 && salto!=false)
								salto=false;
								graph=10;
							end
						end
					end
				else
					for(i=grav_y;i<0;i++)
						if(map_get_pixel(fpgs[2],1,x,y-13)!=map_get_pixel(fpgs[0],6,4,0))
							y--;
						else
							grav_y++;
							salto=true;
						end
					end
				end
			else
				flags=2;
				if(grav_y>0)
					for(i=0;i<grav_y;i++)
						if(!collision(type objetos) &&  !collision(type objetos) && map_get_pixel(fpgs[2],1,x,y-13)!=map_get_pixel(fpgs[0],6,1,0) && map_get_pixel(fpgs[2],1,x,y-13)!=map_get_pixel(fpgs[0],6,4,0))
							y--;
						else
							if(grav_y>13 && salto!=false)
								salto=false;
								graph=10;
							end
						end
					end
				else
					for(i=grav_y;i<0;i++)
						if(map_get_pixel(fpgs[2],1,x,y+13)!=map_get_pixel(fpgs[0],6,5,0))
							y++;
						else
							grav_y++;
							salto=true;
						end
					end				
				end
			end
						
			if(key(_space))
				if(grav_x>=0)
					graph=19;
				else
					graph=1;
				end
				if(grav_y>-lim && salto!=true)
					if(grav_y>14)
						grav_y-=8;
					end
					grav_y-=4;
				elsif(salto!=true)
					salto=true;
				end
			end

			x+=grav_x;
			if(grav_x<0)
				grav_x++;
			elsif(grav_x>0)
				grav_x--;
			else
				if(salto!=true)
					if(caja!=true)
						graph=10;
					else
						graph=110;
					end
				end
			end
			
			frame;
			
			if(y>640 && gravedad==true)
				break;
			elsif(y<0 && gravedad==false)
				break;
			elsif(idm=collision(type malos))
				break;
			end
			
			if(muerto)
				break;
			end
		end
		//Si pasamos por aqui es que hemos muerto
		muerto=true;		
	end 