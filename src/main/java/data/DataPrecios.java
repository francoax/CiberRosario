package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import entities.Precio;
import entities.TypePc;

public class DataPrecios {

	public Precio getLastPriceFor(TypePc tpc) {
		
		Precio p = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM precios WHERE idTipoComputadora = ? order by fecha_precio DESC LIMIT 1");
			stmt.setString(1, tpc.getIdTipoComputadora());
			rs = stmt.executeQuery();
			if(rs!=null&&rs.next()) {
				p = new Precio();
				p.setPrecio(rs.getInt("precio"));
				p.setFecha_precio(LocalDate.parse(rs.getString("fecha_precio")));
				p.setIdTipoComputadora(rs.getString("idTipoComputadora"));
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
		
		return p;
	}
	
	
	
	
}
