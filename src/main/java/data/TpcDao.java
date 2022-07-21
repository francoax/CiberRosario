package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entities.Computadora;
import entities.TypePc;

public class TpcDao {

	
	public TypePc findType(Computadora pc) {
		
		TypePc tpc = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT tpc.idTipoComputadora, tpc.descripcion FROM tipo_computadora "
					+ "INNER JOIN computadoras c "
					+ "ON tpc.idTipoComputadora = c.idTipoComputadora "
					+ "WHERE idComputadora = ?");
			rs = stmt.executeQuery();
			if(rs!=null&&rs.next()) {
				tpc = new TypePc();
				tpc.setDescripcion(rs.getString("descripcion"));
				tpc.setIdTipoComputadora(rs.getString("idTipoComputadora"));
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
		return tpc;
	}
	
	public TypePc getByDesc(String desc) {
		
		TypePc tpc = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM tipo_computadora WHERE descripcion LIKE ?");
			stmt.setString(1, desc);
			rs = stmt.executeQuery();
			if(rs!=null&&rs.next()) {
				tpc = new TypePc();
				tpc.setDescripcion(rs.getString("descripcion"));
				tpc.setIdTipoComputadora(rs.getString("idTipoComputadora"));
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
		return tpc;
	}
	
	public TypePc getById(int id) {
		
		TypePc tpc = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM tipo_computadora WHERE idTipoComputadora = ?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if(rs!=null&&rs.next()) {
				tpc = new TypePc();
				tpc.setDescripcion(rs.getString("descripcion"));
				tpc.setIdTipoComputadora(rs.getString("idTipoComputadora"));
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
		return tpc;
	}
	
	
	
}
