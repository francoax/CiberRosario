package logic;

import data.TpcDao;
import entities.TypePc;

public class Tpclogic {
	
		TpcDao tpcdao;
	
		public Tpclogic() {
			
			tpcdao = new TpcDao();
		}
		
		// Busca y devuelve el objeto del tipo de computadora por descripcion
		public TypePc getOne(String desc) {
			
			return tpcdao.getByDesc(desc);
		}
		
		// Busca y devuelve el objeto del tipo de computadora por id.
		public TypePc getOne(int id) {
			
			return tpcdao.getById(id);
		}
	
}
