package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import entities.Rol;
import entities.Usuario;

	public class DataRoles {

		
		// Obtengo el rol por su ID
		public Rol getById(int id) {

			Rol r= null;
			ResultSet rs = null;
			PreparedStatement stmt = null;
			try {
				stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM rol WHERE idRol=?");
				stmt.setInt(1, id);
				rs = stmt.executeQuery();
				if(rs!=null&&rs.next()) {
					r = new Rol();
					r.setIdRol(rs.getInt("idRol"));
					r.setDescripcion(rs.getString("descripcion"));
				}
			} catch (Exception e) {
				// TODO: handle exception
			}finally {
				try {
					if(rs!=null) {rs.close();}
					if(stmt!=null) {stmt.close();}
					DbConnector.getInstancia().releaseConn();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return r;
		}
		
		public Rol getByDesc(String desc) {

			Rol r= null;
			ResultSet rs = null;
			PreparedStatement stmt = null;
			try {
				stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM rol WHERE descripcion=?");
				stmt.setString(1, desc);
				rs = stmt.executeQuery();
				if(rs!=null&&rs.next()) {
					r = new Rol();
					r.setIdRol(rs.getInt("idRol"));
					r.setDescripcion(rs.getString("descripcion"));
				}
			} catch (Exception e) {
				// TODO: handle exception
			}finally {
				try {
					if(rs!=null) {rs.close();}
					if(stmt!=null) {stmt.close();}
					DbConnector.getInstancia().releaseConn();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return r;
		}
		// Busco el rol del usuario.
		public Rol findRol(Usuario user) {
			
			Rol r = null;
			ResultSet rs = null;
			PreparedStatement stmt = null;
			try {
				stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT r.idRol, r.descripcion FROM rol r INNER JOIN usuarios u ON r.idRol = u.idRol WHERE idUsuario = ?");
				stmt.setInt(1, user.getId());
				rs = stmt.executeQuery();
				if(rs!=null&&rs.next()) {
					r = new Rol();
					r.setIdRol(rs.getInt("idRol"));
					r.setDescripcion(rs.getString("descripcion"));
				}
			} catch (Exception e) {
				// TODO: handle exception
			}finally {
				try {
					if(rs!=null) {rs.close();}
					if(stmt!=null) {stmt.close();}
					DbConnector.getInstancia().releaseConn();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return r;
		}
	
}
