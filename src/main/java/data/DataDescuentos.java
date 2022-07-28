package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entities.Descuento;

public class DataDescuentos {

	public Descuento getOne(int cantHoras) {

		Descuento desc = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM descuentos WHERE horaMin<= ? AND horaMax> ?;");
			stmt.setInt(1, cantHoras);
			stmt.setInt(2, cantHoras);
			rs = stmt.executeQuery();
			if(rs!=null&&rs.next()) {
				desc = new Descuento();
				desc.setHoraMax(rs.getInt("horaMax"));
				desc.setHoraMin(rs.getInt("horaMin"));
				desc.setPorcentaje(rs.getDouble("porcentaje"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return desc;
	}

}
