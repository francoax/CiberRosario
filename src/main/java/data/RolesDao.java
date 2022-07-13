package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import com.mysql.cj.x.protobuf.MysqlxPrepare.Prepare;

import entities.Rol;
import entities.Usuario;

	public class RolesDao {

		
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
		// Busco el rol que posee el usuario que esta iniciando sesion. Busca en la tabla usuarios_roles, encuentra y devuelve ese objeto rol.
		public Rol findRol(Usuario user) {
			
			Rol r = null;
			ResultSet rs = null;
			PreparedStatement stmt = null;
			try {
				stmt = DbConnector.getInstancia().getConn().prepareStatement("select r.idRol, r.descripcion from rol r "
						+ "inner join usuarios_roles ur "
						+ "on r.idRol=ur.idRol where ur.idUsuario=?");
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
		
		// Al crearse un nuevo usuario, seteo el rol que fue definido en singup.jsp en la tabla usuarios_roles.
		public void addRol(Usuario user) {
			
			ResultSet rs = null;
			PreparedStatement stmt = null;
			try {
				stmt = DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO usuarios_roles (idRol, idUsuario) VALUES(?,?)");
				stmt.setInt(1, user.getRol().getIdRol());
				stmt.setInt(2, user.getId());
				stmt.executeUpdate();
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
		}
}
