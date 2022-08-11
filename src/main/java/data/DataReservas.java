package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import entities.Reserva;

public class DataReservas {
	
	public void save(Reserva r ) {
		
		PreparedStatement stmt = null;
		ResultSet keyRs = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO reservas "
					+ "(fecha_de_reserva, fecha_a_reservar, horaDesde, horaHasta, idUsuario, idComputadora, importe, plataforma_stream, name_stream, link_stream, rubro_work, empresa_work, descripcion_work "
					+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)",
					PreparedStatement.RETURN_GENERATED_KEYS);
			stmt.setObject(1, r.getFecha_de_reserva());
			if(r.getFecha_de_reserva()!=null) {
				stmt.setObject(2, r.getFecha_a_reservar());
			}
			stmt.setObject(3, r.getHoraDesde());
			stmt.setObject(4, r.getHoraHasta());
			stmt.setInt(5, r.getIdUsuario());
			stmt.setInt(6, r.getIdComputadora());
			stmt.setInt(7, r.getImporte());
			if((r.getPlataforma_stream()!=null)&&(r.getName_stream()!=null)&&(r.getLink_stream()!=null)) {
				stmt.setString(8, r.getPlataforma_stream());
				stmt.setString(9, r.getName_stream());
				stmt.setString(10, r.getLink_stream());
			} else {
				stmt.setString(8, null);
				stmt.setString(9, null);
				stmt.setString(10, null);
			}
			if((r.getRubro_work()!=null)&&(r.getEmpresa_work()!=null)&&(r.getDescripcion_work()!=null)) {
				stmt.setString(11, r.getRubro_work());
				stmt.setString(12, r.getEmpresa_work());
				stmt.setString(13, r.getDescripcion_work());
			} else {
				stmt.setString(11, null);
				stmt.setString(12, null);
				stmt.setString(13, null);
			}
			stmt.executeUpdate();
			keyRs = stmt.getGeneratedKeys();
			if(keyRs!=null && keyRs.next()) {
				r.setIdReserva(keyRs.getInt(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(keyRs!=null) {keyRs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
}
