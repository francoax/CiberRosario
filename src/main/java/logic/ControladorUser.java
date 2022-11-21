package logic;

import java.util.LinkedList;

import data.DataRoles;
import data.DataUsuarios;
import dto.UserModificated;
import dto.UserReserves;
import entities.Rol;
import entities.Usuario;

public class ControladorUser {
	
	private DataUsuarios udao;
	private DataRoles rdao;
	
	public ControladorUser( final DataUsuarios udao, final DataRoles rdao) {
		
		this.udao = udao;
		this.rdao = rdao;
	}
	
	public LinkedList<UserReserves> getReserves(Usuario user) {
		
		return udao.getReservesByUser(user);
	}
	
	
	public Usuario add(Usuario u) {
		
		this.udao.add(u);
		return u;
	}
	
	public UserModificated modify(String username, String rol) {
		
		Usuario tochange = udao.getByUsername(username);
		
		if(tochange==null) {
			return null;
		}
		
		if(tochange.getRol().getDescripcion().equals(rol)) {
			return null;
		} else {
			return this.udao.modify(username, rol);
		}	
	}
	
	public boolean exist(Usuario u) {
		
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

