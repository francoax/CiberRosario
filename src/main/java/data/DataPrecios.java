package data;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.time.LocalDate;
import java.util.LinkedList;

import dto.PriceSpecification;
import entities.Precio;
import entities.TypePc;

public class DataPrecios {
	

	public LinkedList<PriceSpecification> getAll() {
		
		LinkedList<PriceSpecification> precios = null;
		CallableStatement cstmt = null;
		ResultSet rs = null;
		try {
			cstmt = DbConnector.getInstancia().getConn().prepareCall("{CALL actual_last_price_for_pc()}");
			rs = cstmt.executeQuery();
			if(rs!=null) {
				precios = new LinkedList<PriceSpecification>();
				while(rs.next()) {
					PriceSpecification p = new PriceSpecification();
					p.setPc_descripcion(rs.getString("descripcion"));
					p.setFechaPrecioActual(rs.getObject("fechaActual", LocalDate.class));
					p.setFechaPrecioProxima(rs.getObject("fechaProxima", LocalDate.class));
					p.setPrecioActual(rs.getInt("precioActual"));
					p.setPrecioProximo(rs.getInt("precioProximo"));
					precios.add(p);
				}
				return precios;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(cstmt!=null) {cstmt.close();}
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
			stmt = DbConnector.getInstancia().getConn().prepareStatement("INSERT INTO precios (idTipoComputadora, fecha_precio, precio) VALUES(?,?,?);");
			DataTpc datatpc = new DataTpc();
			TypePc type = datatpc.getByDesc(precio.getIdTipoComputadora());
			stmt.setString(1, type.getIdTipoComputadora());
			stmt.setObject(2, precio.getFecha_precio());
			stmt.setInt(3, precio.getPrecio());
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
