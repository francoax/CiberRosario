package logic;

import data.DataUsuarios;
import entities.Usuario;

public class ControladorLogin {

	DataUsuarios udao;
	
	public ControladorLogin() {
		
		udao = new DataUsuarios();
	}
	
	public Usuario validate(Usuario u) {
		
		return udao.getOne(u);
		
	}
}
