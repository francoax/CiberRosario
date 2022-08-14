package logic;

import data.DataRoles;
import data.DataUsuarios;
import entities.Rol;
import entities.Usuario;

public class ControladorSignup {

		DataUsuarios udao;
		DataRoles rdao;
	
	public ControladorSignup() {
		
		udao = new DataUsuarios();
		rdao = new DataRoles();
	}
	
	public Usuario adduser(Usuario u) {
		
		udao.add(u);
		return u;
	}
	
	public Usuario exist (Usuario u) {
		
		return udao.exist(u);
	}
	
	public Rol getRol(String desc) {
		
		return rdao.getByDesc(desc);
	}

	public Rol getRol(int id) {
		
		return rdao.getById(id);
	}
}
