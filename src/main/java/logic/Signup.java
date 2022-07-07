package logic;

import data.PersonasDao;
import entities.Persona;

public class Signup {
	
	PersonasDao pdao;
	
	public Signup() {
		
		pdao = new PersonasDao();
		
	}
	
	public Persona registerUser(Persona p) {
		
		pdao.addUser(p);
		
		return p;
	}
	

}
