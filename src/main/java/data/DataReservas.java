package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.LinkedList;
import java.util.UUID;

import dto.ReserveList;
import dto.ReserveSpecification;
import dto.Streamers;
import entities.Reserva;

public class DataReservas {
	
	private DataPc pcdata;
	
	public Reserva save(Reserva r ) {
		
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO reservas (cod_reserva, fecha_de_reserva, fecha_a_reservar, horaDesde, horaHasta, idUsuario, idComputadora, importe, plataforma_stream, name_stream, link_stream, rubro_work, empresa_work, descripcion_work, estado) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
			stmt.setString(15, r.getEstado());
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
		
		PreparedStatement reserveupdate = null;
		try {
			reserveupdate = DbConnector.getInstancia().getConn().prepareStatement("update reservas r set r.estado = ? where r.cod_reserva = ?");
			reserveupdate.setString(1, "confirmada");
			reserveupdate.setString(2, code);
			pcdata = new DataPc();
			pcdata.setEstado(code, "ocupada");
			reserveupdate.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(reserveupdate!=null) {reserveupdate.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public void finish(String code) {
		
		PreparedStatement reserveupdate = null;
		
		try {
			reserveupdate = DbConnector.getInstancia().getConn().prepareStatement("UPDATE reservas r set r.estado = ? where r.cod_reserva = ?;");
			reserveupdate.setString(1, "finalizada");
			reserveupdate.setString(2, code);
			pcdata = new DataPc();
			pcdata.setEstado(code, "disponible");
			reserveupdate.executeUpdate();
		}  catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(reserveupdate!=null) {reserveupdate.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public ReserveSpecification cancel(String code) {
		
		PreparedStatement reserveupdate = null;
		ReserveSpecification r = get(code);
		try {
			reserveupdate = DbConnector.getInstancia().getConn().prepareStatement("UPDATE reservas r set r.estado = ? where r.cod_reserva = ?;");
			reserveupdate.setString(1, "cancelada");
			reserveupdate.setString(2, code);
			pcdata = new DataPc();
			pcdata.setEstado(code, "disponible");
			reserveupdate.executeUpdate();
		}  catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(reserveupdate!=null) {reserveupdate.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return r;
		
	}
	
	public LinkedList<ReserveList> getAll() {
		
		LinkedList<ReserveList> list = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("select r.cod_reserva, r.fecha_de_reserva, r.fecha_a_reservar, r.horaDesde, r.horaHasta, r.idComputadora, u.nombre, u.apellido, u.dni "
					+ "from reservas r "
					+ "inner join usuarios u "
					+ "on r.idUsuario = u.idUsuario "
					+ "order by r.fecha_de_reserva desc;");
			rs = stmt.executeQuery();
			if(rs!=null) {
				list = new LinkedList<ReserveList>();
				while(rs.next()) {
					ReserveList item = new ReserveList();
					item.setCod_reserva(rs.getString("cod_reserva"));
					item.setFecha_a_reservar(LocalDate.parse(rs.getString("fecha_a_reservar")));
					item.setFecha_de_reserva(LocalDate.parse(rs.getString("fecha_de_reserva")));
					item.setHoraDesde(rs.getString("horaDesde"));
					item.setHoraHasta(rs.getString("horaHasta"));
					item.setIdComputadora(rs.getInt("idComputadora"));
					item.setUser_dni(rs.getString("dni"));
					item.setUser_name(rs.getString("nombre"));
					item.setUser_lastname(rs.getString("apellido"));
					list.add(item);
				}
			return list;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public LinkedList<Streamers> getStreamersList() {
		
		LinkedList<Streamers> list = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("select r.name_stream, r.plataforma_stream, r.link_stream from reservas r inner join computadoras pc on r.idComputadora = pc.idComputadora where r.plataforma_stream is not null and r.name_stream is not null and r.link_stream is not null and r.estado = 'confirmada'");
			rs = stmt.executeQuery();
			if(rs!=null) {
				list = new LinkedList<Streamers>();
				while(rs.next()) {
					Streamers s = new Streamers();
					s.setName(rs.getString("name_stream"));
					s.setPlataform(rs.getString("plataforma_stream"));
					s.setLink(rs.getString("link_stream"));
					list.add(s);
				}
			return list;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
		
	}
}
