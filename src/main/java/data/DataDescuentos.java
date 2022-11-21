package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import entities.Descuento;

public class DataDescuentos {

	public Descuento getOne(int cantHoras) {

		Descuento desc = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String query;
		try {
			if(cantHoras < 6) {
				query = "SELECT * FROM descuentos WHERE horas_minimas <= ?";
				stmt = DbConnector.getInstancia().getConn().prepareStatement(query);
				stmt.setInt(1, cantHoras);
			} else {
				query = "with hora as (select max(horas_minimas) horamax from descuentos where horas_minimas <= ?) "
						+ "select d.horas_minimas, d.porcentaje "
						+ "from descuentos d "
						+ "inner join hora h "
						+ "on h.horamax = d.horas_minimas ";
				stmt = DbConnector.getInstancia().getConn().prepareStatement(query);
				stmt.setInt(1, cantHoras);
			}
			rs = stmt.executeQuery();
			if(rs!=null&&rs.next()) {
				desc = new Descuento();
				desc.setHoras_minimas(rs.getInt("horas_minimas"));
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
					d.setHoras_minimas(rs.getInt("horas_minimas"));
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
	
	public void update(int rango, double discount) {
		
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("UPDATE descuentos set porcentaje = ? where horas_minimas = ?;");
			stmt.setDouble(1, discount/100);
			stmt.setInt(2, rango);
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
