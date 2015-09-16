/*
  Este archivo contiene las splashscreens
*/

function presentacion2()
	public
		int i,j,iy,eq,aux;
	end
	begin
		ganimacion=true;
		set_mode(640,480,32,V_MODE);
				
		fade(0,0,0,100);
		while(fading)
			frame;
		end
		screen_put(fpgs[6],1);
		fade(100,100,100,1);
		while(fading)
			frame;
		end
		for(i=0;i<120;i++)
			frame;
		end
		fade(0,0,0,1);
		while(fading)
			frame;
		end
		clear_screen();
		
		i=new_map(640,480,32);
		map_clear(0,i,rgb(255,255,255));
		put_screen(0,i);

		fade(100,100,100,64);
		
		eq=100;
		iy=195;
		
		set_fps(60,1);
		ganimacion=true;
		for(i=55;i<560;i+=3)
			for(j=129;j<350;j+=3)
				switch(rand(1,4))
					case 1:
						aux=rand(0,480);
						punto(-1,aux,i,j);
					end
					case 2:
						aux=rand(0,640);
						punto(aux,-1,i,j);
					end
					case 3:
						aux=rand(0,480);
						punto(641,aux,i,j);
					end
					case 4:
						aux=rand(0,640);
						punto(aux,481,i,j);
					end
				end
			end
		end
		for(i=0;i<400;i++)
			frame;
		end
		ganimacion=false;
		set_fps(60,1);
		while(exists(type punto))
			frame;
		end
	end
	
process punto(int x, int y, int eq, int iy)
	private
		int aux,i,j;
		int vel=1;
		bool llegado=false;
	end
	begin
		graph=new_map(3,3,32);
		for(i=0;i<3;i++)
			for(j=0;j<3;j++)
				map_put_pixel(0,graph,i,j,map_get_pixel(fpgs[6],2,i+eq,j+iy));
			end
		end

		vel=rand(1,3);

		repeat
			if(x<eq)
				x++;
			end
			if(eq<x)
				x--;
			end
			if(y<iy)
				y++;
			end
			if(iy<y)
				y--;
			end
			
			frame;
			
			for(i=0;i<rand(1,3)+vel;i++)
				if(x<eq)
					x++;
				end
				if(eq<x)
					x--;
				end
			end
			for(i=0;i<rand(0,3);i++)
				if(y<iy)
					y++;
				end
				if(iy<y)
					y--;
				end
			end

			if(x==eq && y==iy)
				llegado=true;
			end
		until(ganimacion!=true || llegado!=false)
		repeat
			frame;
		until(ganimacion!=true)
	end 

function presentacion()
	private
		int i;
		bool mostrar;
	end
	begin
		cambiar_musica(0);
		screen_clear();
		fade(100,100,100,1);
		
		// Pantalla de "Pulsa start"
		screen_put(fpgs[0],8);
		
		//Ponemos como fondo de pantalla la imagen de presentación del juego;
		i=0;
		betabanner();
		loop
			if(i==60)
				if(mostrar!=true)
					mostrar=true;
					write(fnts[1],resol_x/2,resol_y-150,1,"Press enter");
					i=0;
				else
					mostrar=false;
					delete_text(0);
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
	OnExit
		delete_text(0);
	end 
	
process betabanner()
	private
		int i;
	end
	begin
		file=fpgs[0];
		graph=2;
		
		x=500;
		y=100;
		angle=320000;
		
		loop
			for(i=0;i<55;i++)			
				size--;
				frame;
			end
			for(i=0;i<55;i++)			
				size++;
				frame;
			end
		end
	end 