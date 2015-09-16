process menu()
	private
		int opc=1,sonid;
	end
	begin
		screen_put(fpgs[0],8);
		
		write(fnts[1],resol_x/2,resol_y-200,1,"Play");
		write(fnts[1],resol_x/2,resol_y-100,1,"Exit");
		sonid=sombra();
		
		x=(resol_x/2)-65;
		
		loop
			if(opc==1)
				y=resol_y-185;
			else
				y=resol_y-85;			
			end
			
			if(key(_up))
				while(key(_up))
					frame;
				end
				opc++;
				if(opc>2)
					opc=1;
				end
			end
			if(key(_down))
				while(key(_down))
					frame;
				end
				opc--;
				if(opc<1)
					opc=2;
				end
			end
			
			if(key(_enter))
				while(key(_enter))
					frame;
				end
				break;
			end
			frame;
		end
		signal(type betabanner,s_kill);
		signal(sonid,s_kill);
		if(opc==1)
			gest_levels(0);
		else
			let_me_alone();
			exit(0);
		end
		
		screen_clear();
	end 
	
process sombra()
	private
		int j;
	end
	begin
		file=fpgs[1];
		graph=10;
		size=35;
		loop
			x=father.x;
			y=father.y;
			
			j++;
			if(j==4)
				j=0;
				graph++;
				if(graph>=19)
					graph=11;
				end
			end
			frame;
		end
	end 