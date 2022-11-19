package data;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Types;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.LinkedList;

import entities.Precio;

public class DataPrecios {
	
	private String dateFormat="dd/MM/yyyy";
	private DateTimeFormatter format = DateTimeFormatter.ofPattern(dateFormat);

	public LinkedList<Precio> getAll() {
		
		LinkedList<Precio> precios = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT tpc.descripcion, p.fecha_precio, p.precio FROM precios p inner join tipo_computadora tpc on p.idTipoComputadora = tpc.idTipoComputadora;");
			rs = stmt.executeQuery();
			if(rs!=null) {
				precios = new LinkedList<Precio>();
				while(rs.next()) {
					Precio p = new Precio();
					p.setIdTipoComputadora(rs.getString("descripcion"));
					p.setFecha_precio(LocalDate.parse(rs.getString("fecha_precio"), format));
					p.setPrecio(rs.getInt("precio"));
					precios.add(p);
				}
				return precios;
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
		
		return precios;
	}
	
	
	public int getPrice(String type) {
		
		CallableStatement cstmt = null;
		int p = 0 ;
		try {
			cstmt = DbConnector.getInstancia().getConn().prepareCall("{CALL get_last_price_for_pc(?, ?)}");
			cstmt.setString(1, type);
			cstmt.registerOutParameter(2, Types.INTEGER);
			cstmt.execute();
			p = cstmt.getInt(2);
			return p;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(cstmt!=null) {cstmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return p;
	}
	
	public void update(Precio precio) throws SQLException {
		
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO precios (idTipoComputadora, fecha_precio, precio) SELECT distinct tpc.idTipoComputadora, ?, ? from tipo_computadora tpc inner join precios p where tpc.descripcion = ?");
			stmt.setObject(1, precio.getFecha_precio());
			stmt.setInt(2, precio.getPrecio());
			stmt.setString(3, precio.getIdTipoComputadora());
			stmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
			throw new SQLException();
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
