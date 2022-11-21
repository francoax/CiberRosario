package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;

import dto.ComputersSpecification;
import entities.Computadora;
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
				pc.setStorage(rs.getString("almacenamiento"));
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
	
	public int getIdAvailable(String type) {
		
		ResultSet rs = null;
		PreparedStatement stmt = null;
		int id = 0;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("select pc.idComputadora id from computadoras pc inner join tipo_computadora tpc on pc.idTipoComputadora = tpc.idTipoComputadora where tpc.descripcion = ? and pc.estado = 'disponible' limit 1;");
			stmt.setString(1, type);
			rs = stmt.executeQuery();
			if(rs!=null&&rs.next()) {
				id = rs.getInt("id");
				System.out.println(id);
				return id;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(stmt!=null) {stmt.close();}
				DbConnector.getInstancia().releaseConn();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return id;
	}

	public LinkedList<ComputersSpecification> GetPcsAvailable() {
		
		ResultSet rs = null;
		Statement stmt = null;
		LinkedList<ComputersSpecification> pcs = new LinkedList<ComputersSpecification>();
		try {
			stmt = DbConnector.getInstancia().getConn().createStatement();
			rs = stmt.executeQuery("with pc_cant as (select tpc.idTipoComputadora, count(*) cant from computadoras pc "
					+ "inner join tipo_computadora tpc "
					+ "on pc.idTipoComputadora = tpc.idTipoComputadora "
					+ "where pc.estado = 'disponible' "
					+ "group by 1) "
					+ "select distinct pc.placa_madre, pc.placa_de_video, pc.ram, pc.procesador, pc.almacenamiento, pc.idTipoComputadora, tp.descripcion, ifnull(pc_cant.cant, 0) cant "
					+ "from computadoras pc "
					+ "left join pc_cant "
					+ "on pc.idTipoComputadora = pc_cant.idTipoComputadora "
					+ "left join tipo_computadora tp "
					+ "on tp.idTipoComputadora = pc.idTipoComputadora");
			if(rs!=null) {
				while(rs.next()) {
					ComputersSpecification pca = new ComputersSpecification();
					TypePc type = new TypePc();
					type.setIdTipoComputadora(rs.getString("idTipoComputadora"));
					type.setDescripcion(rs.getString("descripcion"));
					pca.setMotherboard(rs.getString("placa_madre"));
					pca.setVideocard(rs.getString("placa_de_video"));
					pca.setRam(rs.getString("ram"));
					pca.setCore(rs.getString("procesador"));
					pca.setStorage(rs.getString("almacenamiento"));
					pca.setAmount(rs.getInt("cant"));
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
	
	public void setEstado(int id, String estado) {
		
		PreparedStatement stmt = null;
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("UPDATE computadoras SET estado = ? WHERE idComputadora = ?");
			stmt.setString(1, estado);
			stmt.setInt(2, id);
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
	
	public void setEstado(String code, String estado) {
		
		PreparedStatement stmt = null;
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("UPDATE computadoras pc inner join reservas r on pc.idComputadora = r.idComputadora set pc.estado = ? where r.cod_reserva = ?;");
			stmt.setString(1, estado);
			stmt.setString(2, code);
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
	
	public void add(Computadora newPc, String tipo) {
		
		PreparedStatement stmt = null;
		try {
			stmt = DbConnector.getInstancia().getConn().prepareStatement("insert into computadoras (placa_madre, placa_de_video, ram, procesador, almacenamiento, estado, idTipoComputadora) "
					+ "select ?,?,?,?,?,?, tpc.idTipoComputadora  "
					+ "from tipo_computadora tpc "
					+ "where tpc.descripcion = ?");
			stmt.setString(1, newPc.getPlaca_madre());
			stmt.setString(2, newPc.getPlaca_de_video());
			stmt.setString(3, newPc.getRam());
			stmt.setString(4, newPc.getProcesador());
			stmt.setString(5, newPc.getStorage());
			stmt.setString(6, "disponible");
			stmt.setString(7, tipo);
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
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
