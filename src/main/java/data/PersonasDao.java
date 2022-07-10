package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entities.Usuario;
public class PersonasDao {
	
	public Usuario getUser(Usuario user) {
		
		Usuario per = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM personas WHERE username=? and password=?");
			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getPassword());
			rs = stmt.executeQuery();
			
			if(rs!=null && rs.next()) {
				per = new Usuario();
				per.setDni(rs.getString("dni"));
				per.setNombre(rs.getString("nombre"));
				per.setApellido(rs.getString("apellido"));
				per.setEmail(rs.getString("email"));
				per.setTelefono(rs.getString("telefono"));
				
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
		
		
		return per;
	}
	
	
	public void addUser(Usuario newUser) {
		
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO personas (username, password, dni, nombre, apellido, email, telefono, fecha_de_nacimiento) values (?,?,?,?,?,?,?,?)");
			
			stmt.setString(1, newUser.getUsername());
			stmt.setString(2, newUser.getPassword());
			stmt.setString(3, newUser.getNombre());
			stmt.setString(4, newUser.getApellido());
			stmt.setString(5, newUser.getDni());
			stmt.setString(6, newUser.getEmail());
			stmt.setString(7, newUser.getTelefono());
			stmt.setObject(8, newUser.getFecha_nacimiento());
			
			stmt.executeUpdate();
			
			
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
