function log(string cadena)
	begin
		if(V_MODE==MODE_WINDOW)
			say(" "+cadena);
			if(!gpf)
				gpf=fopen("logs/log_"+ftime("%d%m%Y%H%M%S",time())+".yawlog",2);
			end
			fputs(gpf,cadena);
		end
	end

function plog(string cadena)
	begin
		if(V_MODE==MODE_WINDOW)
			say(cadena);
			if(!gpf)
				gpf=fopen("logs/log_"+ftime("%d%m%Y%H%M%S",time())+".yawlog",2);
			end
			fputs(gpf,cadena);

			while(!key(_enter)) frame; end
			while(key(_enter)) frame; end
		end
	end

function logon()
	begin
		if(fexists("ywn.ai"))
			//V_MODE=MODE_WINDOW;
			//g_log=true;
			log("");
			log("MODO DEBUG"); 
			log("----------------------------------------");		
		end
	end 
