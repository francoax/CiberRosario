package logic;

import data.UsuariosDao;
import entities.Usuario;

public class LogicUser {

	UsuariosDao udao;
	
	public LogicUser() {
		
		udao = new UsuariosDao();
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
