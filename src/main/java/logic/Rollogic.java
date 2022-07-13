package logic;

import data.RolesDao;
import entities.Rol;

public class Rollogic {
	
	RolesDao rdao = null;
	
	public Rollogic() {
		rdao = new RolesDao();
	}
	
	public Rol getRol(String desc) {
		
		return rdao.getByDesc(desc);
	}

	public Rol getRol(int id) {
		
		return rdao.getById(id);
	}
}
