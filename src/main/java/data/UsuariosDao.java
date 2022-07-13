package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import entities.Usuario;
public class UsuariosDao {
	
	// Busca usuario.
	public Usuario getOne(Usuario user) {
		
		RolesDao rd = null;
		Usuario u = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM usuarios WHERE email=? and password=?");
			stmt.setString(1, user.getEmail());
			stmt.setString(2, user.getPassword());
			rs = stmt.executeQuery();
			if(rs!=null && rs.next()) {
				rd = new RolesDao();
				u = new Usuario();
				u.setId(rs.getInt("idUsuario"));
				u.setUsername(rs.getString("username"));
				u.setPassword(rs.getString("password"));
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
	
	public Usuario getByEmail(Usuario user) {
		
		Usuario u = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT email FROM usuarios WHERE email = ?");
			stmt.setString(1, user.getEmail());
			rs = stmt.executeQuery();
			if(rs!=null&&rs.next()) {
				u = new Usuario();
				u.setEmail(rs.getString("email"));
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
	
	// Agrega a la db nuevo usuario.
	public void add(Usuario newUser) {

		RolesDao rd = new RolesDao();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO usuarios "
					+ "(username, password, nombre, apellido, dni, email, fecha_de_nacimiento, telefono)"
					+ " values (?,?,?,?,?,?,?,?)",
					PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setString(1, newUser.getUsername());
			stmt.setString(2, newUser.getPassword());
			stmt.setString(3, newUser.getNombre());
			stmt.setString(4, newUser.getApellido());
			stmt.setString(5, newUser.getDni());
			stmt.setString(6, newUser.getEmail());
			stmt.setObject(7, newUser.getFecha_nacimiento());
			stmt.setString(8, newUser.getTelefono());
			stmt.executeUpdate();
			rs = stmt.getGeneratedKeys();
			if(rs!=null&&rs.next()) {
				newUser.setId(rs.getInt(1));
				rd.addRol(newUser);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
}
