package data;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import dto.UserModificated;
import entities.Usuario;
public class DataUsuarios {
	
	private DataRoles rd = new DataRoles();
	
	
	public Usuario getOne(Usuario user) {
		
		Usuario u = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM usuarios WHERE email=? and password=?");
			stmt.setString(1, user.getEmail());
			stmt.setString(2, user.getPassword());
			rs = stmt.executeQuery();
			if(rs!=null && rs.next()) {
				rd = new DataRoles();
				u = new Usuario();
				u.setId(rs.getInt("idUsuario"));
				u.setUsername(rs.getString("username"));
				u.setNombre(rs.getString("nombre"));
				u.setApellido(rs.getString("apellido"));
				u.setDni(rs.getString("dni"));
				u.setEmail(rs.getString("email"));
				u.setFecha_nacimiento(rs.getObject("fecha_de_nacimiento", LocalDate.class));
				u.setTelefono(rs.getString("telefono"));
				u.setRol(rd.findRol(u));
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
		return u;
	}
	
	public boolean exist(Usuario user) {
		
		ResultSet rs = null;
		PreparedStatement stmt = null;
		
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT email FROM usuarios WHERE email = ?");
			stmt.setString(1, user.getEmail());
			rs = stmt.executeQuery();
			if(rs!=null&&rs.next()) {
				return true;
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
		return false;
	}
	
	public void add(Usuario newUser) {

		PreparedStatement stmt = null;
		
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO usuarios "
					+ "(username, password, nombre, apellido, dni, email, fecha_de_nacimiento, telefono, idRol)"
					+ " values (?,?,?,?,?,?,?,?,?)",
					PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, newUser.getUsername());
			stmt.setString(2, newUser.getPassword());
			stmt.setString(3, newUser.getNombre());
			stmt.setString(4, newUser.getApellido());
			stmt.setString(5, newUser.getDni());
			stmt.setString(6, newUser.getEmail());
			stmt.setObject(7, newUser.getFecha_nacimiento());
			stmt.setString(8, newUser.getTelefono());
			stmt.setInt(9, newUser.getRol().getIdRol());
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public Usuario getByUsername(String username) {
		
		Usuario user = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("select idUsuario, username, nombre, apellido, dni, email, telefono from usuarios where username = ?");
			stmt.setString(1, username);
			rs = stmt.executeQuery();
			if(rs!=null&&rs.next()) {
				user = new Usuario();
				user.setId(rs.getInt("idUsuario"));
				user.setUsername(rs.getString("username"));
				user.setNombre(rs.getString("nombre"));
				user.setApellido(rs.getString("apellido"));
				user.setDni(rs.getString("dni"));
				user.setEmail(rs.getString("email"));
				user.setTelefono(rs.getString("telefono"));
				user.setRol(rd.findRol(user));
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user;
		
	}
	
	public UserModificated modify(String username, String rol) {
		
		UserModificated user = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {
			cstmt = DbConnector.getInstancia().getConn().prepareCall("{CALL update_userRol(?,?)}");
			cstmt.setString(1, username);
			cstmt.setString(2, rol);
			cstmt.execute();
			rs = cstmt.getResultSet();
			if(rs!=null&&rs.next()) {
				user = new UserModificated();
				user.setName(rs.getString("nombre"));
				user.setLastname(rs.getString("apellido"));
				user.setUsername(rs.getString("username"));
				user.setRol(rs.getString("descripcion"));
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(cstmt!=null) {cstmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user;
	}
}
