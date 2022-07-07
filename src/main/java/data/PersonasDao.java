package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entities.Persona;
public class PersonasDao {
	
	public Persona getUser(Persona p) {
		
		Persona per = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM personas WHERE username=? and password=?");
			stmt.setString(1, p.getUsername());
			stmt.setString(2, p.getPassword());
			rs = stmt.executeQuery();
			if(rs!=null && rs.next()) {
				per = new Persona();
				per.setDni(rs.getString("dni"));
				per.setNombre(rs.getString("nombre"));
				per.setApellido(rs.getString("apellido"));
				per.setEmail(rs.getString("email"));
				per.setTelefono(rs.getString("telefono"));
				per.setEdad(rs.getInt("edad"));
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
	
	
	public void addUser(Persona per) {
		
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO personas (dni, nombre, apellido, email, telefono, edad, username, password) VALUES (?,?,?,?,?,?,?,?)");
			stmt.setString(1, per.getDni());
			stmt.setString(2, per.getNombre());
			stmt.setString(3, per.getApellido());
			stmt.setString(3, per.getEmail());
			stmt.setString(4, per.getEmail());
			stmt.setString(5, per.getTelefono());
			stmt.setInt(6, per.getEdad());
			stmt.setString(7, per.getUsername());
			stmt.setString(8, per.getPassword());
			stmt.executeQuery();
			
			
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
