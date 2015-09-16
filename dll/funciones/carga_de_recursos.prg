// Funciones de carga de recursos
function cargar_recursos()
	begin
		cargar_fpgs();
		carga_levels();
		carga_secuencias();
		
		fnts[0]=load_fnt("dll/fonts/mikachan-puchi.fnt");
		fnts[1]=load_fnt("dll/fonts/negro-26.fnt");
	end

function carga_levels()
	private
		int pf,i=0;
		string cadena;
	end
	begin
		pf=fopen("dll/escenas/niveles/levels.yaw",O_READ);
		if(pf)
			while(!feof(pf))
				cadena=fgets(pf);
				if(i<99)
					niveles[i]=cadena;
					i++;
				else
					fclose(pf);
				end
			end
			fclose(pf);
		end		
	end
	
function carga_secuencias()
	private
		int pf,i=0;
		string cadena;
	end
	begin
		pf=fopen("dll/escenas/secuencias/levels.yaw",O_READ);
		if(pf)
			while(!feof(pf))
				cadena=fgets(pf);
				if(i<99)
					secuencias[i]=cadena;
					i++;
				else
					fclose(pf);
				end
			end
			fclose(pf);
		end		
	end
// Fin de Funciones de carga de recursos