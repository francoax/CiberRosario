package data;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

import entities.Reserva;

public class DataReservas {
	
	public void save(Reserva r ) {
		
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO reservas "
					+ "(cod_reserva, fecha_de_reserva, fecha_a_reservar, horaDesde, horaHasta, idUsuario, idComputadora, importe, plataforma_stream, name_stream, link_stream, rubro_work, empresa_work, descripcion_work "
					+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			UUID uuid = UUID.randomUUID();
	        String cod = uuid.toString().substring(0, 5);
			stmt.setString(1, cod);
			stmt.setObject(2, r.getFecha_de_reserva());
			if(r.getFecha_de_reserva()!=null) {
				stmt.setObject(3, r.getFecha_a_reservar());
			}
			stmt.setObject(4, r.getHoraDesde());
			stmt.setObject(5, r.getHoraHasta());
			stmt.setInt(6, r.getIdUsuario());
			stmt.setInt(7, r.getIdComputadora());
			stmt.setInt(8, r.getImporte());
			if((r.getPlataforma_stream()!=null)&&(r.getName_stream()!=null)&&(r.getLink_stream()!=null)) {
				stmt.setString(9, r.getPlataforma_stream());
				stmt.setString(10, r.getName_stream());
				stmt.setString(11, r.getLink_stream());
			} else {
				stmt.setString(9, null);
				stmt.setString(10, null);
				stmt.setString(11, null);
			}
			if((r.getRubro_work()!=null)&&(r.getEmpresa_work()!=null)&&(r.getDescripcion_work()!=null)) {
				stmt.setString(12, r.getRubro_work());
				stmt.setString(13, r.getEmpresa_work());
				stmt.setString(14, r.getDescripcion_work());
			} else {
				stmt.setString(12, null);
				stmt.setString(13, null);
				stmt.setString(14, null);
			}
			stmt.executeUpdate();
		} catch (Exception e) {
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
