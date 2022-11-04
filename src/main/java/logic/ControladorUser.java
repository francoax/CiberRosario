package logic;

import data.DataRoles;
import data.DataUsuarios;
import entities.Rol;
import entities.Usuario;

public class ControladorUser {
	
	private DataUsuarios udao;
	private DataRoles rdao;
	
	public ControladorUser( final DataUsuarios udao, final DataRoles rdao) {
		
		this.udao = udao;
		this.rdao = rdao;
	}
	
	public Usuario add(Usuario u) {
		
		this.udao.add(u);
		return u;
	}
	
	public Usuario exist(Usuario u) {
		
		return this.udao.exist(u);
	}
	
	public Rol getRol(String desc) {
		
		return this.rdao.getByDesc(desc);
	}

	public Rol getRol(int id) {
		
		return this.rdao.getById(id);
	}
	
	public Usuario validate(Usuario u) {
		
		return this.udao.getOne(u);
	}
}

