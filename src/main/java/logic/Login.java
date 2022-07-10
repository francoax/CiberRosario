package logic;

import data.PersonasDao;
import entities.Usuario;

public class Login {
	
	PersonasDao pdao;
	
	public Login() {
		
		pdao = new PersonasDao();
	}
	
	public Usuario validarPersona(Usuario p) {
		
		return pdao.getUser(p);
		
	}
	

}
