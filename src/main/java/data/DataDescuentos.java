package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.format.DateTimeFormatter;
import java.util.LinkedList;

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
	
	public LinkedList<Descuento> getAll(){
		
		LinkedList<Descuento> descounts = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM descuentos");
			rs = stmt.executeQuery();
			if(rs!=null) {
				descounts = new LinkedList<Descuento>();
				while(rs.next()) {
					Descuento d = new Descuento();
					d.setHoraMax(rs.getInt("horaMax"));
					d.setHoraMin(rs.getInt("horaMin"));
					d.setPorcentaje(rs.getDouble("porcentaje"));
					descounts.add(d);
				}
				return descounts;
			}
		}catch (Exception e) {
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
		return descounts;
	}
	
	public void update(int[] rango, double discount) {
		
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("UPDATE descuentos set porcentaje = ? where horaMin = ? and horaMax = ?");
			stmt.setDouble(1, discount/100);
			stmt.setInt(2, rango[0]);
			stmt.setInt(3, rango[1]);
			stmt.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
