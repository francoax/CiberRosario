package logic;

import data.DataTpc;
import entities.TypePc;

public class LogicTpc {
	
		DataTpc tpcdao;
	
		public LogicTpc() {
			
			tpcdao = new DataTpc();
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
