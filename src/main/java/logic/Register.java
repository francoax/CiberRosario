package logic;

import data.PersonasDao;
import entities.Usuario;

public class Register {
	
	PersonasDao pdao;
	
	public Register() {
		
		pdao = new PersonasDao();
		
	}
	
	public Usuario registerUser(Usuario newUser) {
		
		
		pdao.addUser(newUser);
		
		return newUser;
	}
	

}
