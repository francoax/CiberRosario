package logic;

import data.PersonasDao;
import entities.Persona;

public class Login {
	
	PersonasDao pdao;
	
	public Login() {
		
		pdao = new PersonasDao();
	}
	
	public Persona validarPersona(Persona p) {
		
		return pdao.getUser(p);
		
	}
	

}
