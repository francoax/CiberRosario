package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.UUID;

import dto.ReserveSpecification;
import entities.Reserva;

public class DataReservas {
	
	public Reserva save(Reserva r ) {
		
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO reservas (cod_reserva, fecha_de_reserva, fecha_a_reservar, horaDesde, horaHasta, idUsuario, idComputadora, importe, plataforma_stream, name_stream, link_stream, rubro_work, empresa_work, descripcion_work) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			UUID uuid = UUID.randomUUID();
	        String cod = uuid.toString().substring(0, 5);
	        r.setCod_reserva(cod);
			stmt.setString(1, cod);
			stmt.setObject(2, r.getFecha_de_reserva());
			stmt.setObject(3, r.getFecha_a_reservar());
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
		return r;
		
	}
	
	public ReserveSpecification get(String code) {
		
		ReserveSpecification r = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("select r.cod_reserva, r.fecha_de_reserva, r.fecha_a_reservar , r.horaDesde, r.horaHasta, r.idComputadora, r.importe, u.dni, u.nombre, u.apellido "
					+ "from reservas r "
					+ "inner join usuarios u "
					+ "on r.idUsuario = u.idUsuario "
					+ "where r.cod_reserva = ? ");
			stmt.setString(1, code);
			rs = stmt.executeQuery();
			if(rs!=null&&rs.next()) {
				r = new ReserveSpecification();
				r.setCode(rs.getString("cod_reserva"));
				r.setFecha_de_reserva(rs.getObject("fecha_de_reserva", LocalDate.class));
				r.setFecha_a_reservar(rs.getObject("fecha_a_reservar", LocalDate.class));
				r.setHoraDesde(rs.getObject("horaDesde", LocalTime.class));
				r.setHoraHasta(rs.getObject("horaHasta", LocalTime.class));
				r.setIdPc(rs.getInt("idComputadora"));
				r.setImporte(rs.getInt("importe"));
				r.setUser_dni(rs.getString("dni"));
				r.setUser_nombre(rs.getString("nombre"));
				r.setUser_apellido(rs.getString("apellido"));
				
				return r;
			}
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
		return r;
	}
	
	public void confirm(String code) {
		
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("update computadoras pc inner join reservas r on pc.idComputadora = r.idComputadora set pc.estado = ? where r.cod_reserva = ?");
			stmt.setString(1, "ocupada");
			stmt.setString(2, code);
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
	
	public ReserveSpecification cancel(String code) {
		
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("DELETE FROM reservas WHERE cod_reserva = ?");
			stmt.setString(1, code);
			stmt.executeUpdate();
		}  catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return get(code);
		
	}
}
