package logic;

import data.DataUsuarios;
import entities.Usuario;

public class LogicUser {

	DataUsuarios udao;
	
	public LogicUser() {
		
		udao = new DataUsuarios();
	}
	
	public Usuario adduser(Usuario u) {
				
		udao.add(u);
			
		return u;
	}
	
	public Usuario validateuser(Usuario u) {
		
		return udao.getOne(u);
		
	}
	
	public Usuario validateExist (Usuario u) {
		
		return udao.exist(u);
	}
		
	
}
