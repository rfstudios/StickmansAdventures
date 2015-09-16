function creditos()
	private
		int yis=240, tx,i;
		string testo="";
		int pf,fuentes;
	end
	begin
		screen_clear();
		delete_text(0);
		fuentes=fnts[0];
		
		write(fuentes,320,yis,1,"The End");
		for(i=0;i<120;i++)
			frame;
		end
		
		
		for(yis=240; yis>-20;yis--)
		    delete_text(0);
			tx=write(fuentes,320,yis,1,"The End");
			frame;
		end
		delete_text(0);
		write_var(fuentes,320,240,1,testo);
		
		pf=fopen("dll/otros/creds.yawin",1);
		repeat
			testo=fgets(pf);
			for(yis=0;yis<160;yis++)
				frame;
			end
		until(feof(pf))
		testo="";
		write(fuentes,2,455,3,"Press ESC to exit");
		loop
			frame;
		end
	end 