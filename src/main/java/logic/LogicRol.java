package logic;

import data.DataRoles;
import entities.Rol;

public class LogicRol {
	
	DataRoles rdao = null;
	
	public LogicRol() {
		rdao = new DataRoles();
	}
	
	public Rol getRol(String desc) {
		
		return rdao.getByDesc(desc);
	}

	public Rol getRol(int id) {
		
		return rdao.getById(id);
	}
}
