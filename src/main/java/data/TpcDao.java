package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import entities.Computadora;
import entities.TypePc;

public class TpcDao {

	
//	public TypePc findType (Computadora pc) {
//		
//		Computadora c = null;
//		ResultSet rs = null;
//		PreparedStatement stmt = null;
//		
//		try {
//			
//			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT ");
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
//		return tpc;
//	}
	
	public TypePc getByDesc (String desc) {
		
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
		}
		return tpc;
	}
	
	
	
}
