package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import entities.Computadora;
import entities.PCDto;
import entities.TypePc;

public class DataPc {
	
	public Computadora getById(int id) {
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Computadora pc = null;
		DataTpc tdao = new DataTpc();
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM computadoras WHERE idComputadora = ?");
			stmt.setInt(1, id);
			rs = stmt.executeQuery();
			if(rs!=null&&rs.next()) {
				pc = new Computadora();
				pc.setIdComputadora(rs.getInt("idComputadora"));
				pc.setPlaca_madre(rs.getString("placa_madre"));
				pc.setPlaca_de_video(rs.getString("placa_de_video"));
				pc.setRam(rs.getString("ram"));
				pc.setStorage(rs.getString("storage"));
				pc.setProcesador(rs.getString("procesador"));
				pc.setEstado(rs.getString("estado"));
				pc.setTipo(tdao.findType(pc));
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
		return pc;
	}
	
	public Computadora getOne(TypePc tpc) {
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Computadora pc = null;
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM computadoras WHERE idTipoComputadora LIKE ?");
			stmt.setString(1, tpc.getIdTipoComputadora());
			rs = stmt.executeQuery();
			if(rs!=null&&rs.next()) {
				pc = new Computadora();
				pc.setIdComputadora(rs.getInt("idComputadora"));
				pc.setPlaca_madre(rs.getString("placa_madre"));
				pc.setPlaca_de_video(rs.getString("placa_de_video"));
				pc.setRam(rs.getString("ram"));
				pc.setStorage(rs.getString("storage"));
				pc.setProcesador(rs.getString("procesador"));
				pc.setEstado(rs.getString("estado"));
				pc.setTipo(tpc);
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
		return pc;
	}

	public LinkedList<PCDto> GetPcsAvailable() {
		
		ResultSet rs = null;
		Statement stmt = null;
		LinkedList<PCDto> pcs = new LinkedList<PCDto>();
		try {
			stmt = DbConnector.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("with pc_cant as (select tpc.idTipoComputadora, tpc.descripcion, count(*) cant from computadoras pc "
					+ "inner join tipo_computadora tpc "
					+ "on pc.idTipoComputadora = tpc.idTipoComputadora "
					+ "where pc.estado = 'disponible' "
					+ "group by 1, 2) "
					+ "select distinct pc.placa_madre, pc.placa_de_video, pc.ram, pc.procesador, pc.storage, pc.idTipoComputadora, pc_cant.descripcion, pc_cant.cant from computadoras pc "
					+ "inner join pc_cant on pc.idTipoComputadora = pc_cant.idTipoComputadora");
			if(rs!=null) {
				while(rs.next()) {
					PCDto pca = new PCDto();
					TypePc type = new TypePc();
					type.setIdTipoComputadora(rs.getString("idTipoComputadora"));
					type.setDescripcion(rs.getString("descripcion"));
					pca.setMotherboard(rs.getString("placa_madre"));
					pca.setVideocard(rs.getString("placa_de_video"));
					pca.setRam(rs.getString("ram"));
					pca.setCore(rs.getString("procesador"));
					pca.setStorage(rs.getString("storage"));
					pca.setType(type);
					pcs.add(pca);
				}
				return pcs;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return pcs;
	}
	
	public Computadora findOneavailable(TypePc tpc) {
		
		Computadora pc = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM computadoras WHERE idTipoComputadora = ? and estado = ?");
			stmt.setString(1, tpc.getIdTipoComputadora());
			stmt.setString(2, "disponible");
			rs = stmt.executeQuery();
			if(rs!=null&&rs.next()) {
				pc = new Computadora();
				pc.setIdComputadora(rs.getInt("idComputadora"));
				pc.setPlaca_de_video(rs.getString("placa_de_video"));
				pc.setPlaca_madre(rs.getString("placa_madre"));
				pc.setRam(rs.getString("ram"));
				pc.setStorage(rs.getString("storage"));
				pc.setProcesador(rs.getString("procesador"));
				pc.setEstado(rs.getString("estado"));
				pc.setTipo(tpc);
			}
		} catch (Exception e) {
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
		return pc;
	}
	
	public void setEstado(Computadora pc, String estado) {
		
		PreparedStatement stmt = null;
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("UPDATE computadoras SET estado = ? WHERE idComputadora = ?");
			stmt.setString(1, estado);
			stmt.setInt(2, pc.getIdComputadora());
			stmt.executeUpdate();
		} catch (Exception e) {
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
