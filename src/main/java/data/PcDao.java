package data;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import com.mysql.cj.PreparedQuery;

import entities.Computadora;
import entities.TypePc;

public class PcDao {
	
	public Computadora getOne() {
		
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Computadora pc = null;
		try {
			
		} finally {
			// TODO: handle finally clause
		}
		
		
		return pc;
	}
	
	public LinkedList<Computadora> findAllavailable(TypePc tpc) {
		
		LinkedList<Computadora> pcs = null;
		TpcDao tpcdao;
		Computadora pc = null;
		ResultSet rs = null;
		PreparedStatement stmt = null;
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT * FROM computadoras WHERE idTipoComputadora = ? and estado = ?");
			stmt.setString(1, tpc.getIdTipoComputadora());
			stmt.setString(2, "disponible");
			rs = stmt.executeQuery();
			if(rs!=null&&rs.next()) {
				pcs = new LinkedList<Computadora>();
				pc = new Computadora();
				tpcdao = new TpcDao();
				pc.setIdComputadora(rs.getInt("idComputadora"));
				pc.setPlaca_de_video(rs.getString("placa_madre"));
				pc.setPlaca_de_video(rs.getString("placa_de_video"));
				pc.setRam(rs.getString("ram"));
				pc.setProcesador(rs.getString("procesador"));
				pc.setStorage(rs.getString("storage"));
				//pc.setTipo(tpcdao.findType(pc));
				pc.setEstado(rs.getString("estado"));
				pcs.add(pc);
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
		return pcs;
	}

	public int countAvailable(TypePc tpc) {
		
		ResultSet rs = null;
		int cant = 0;
		PreparedStatement stmt = null;
		
		try {
			
			stmt = DbConnector.getInstancia().getConn().prepareStatement("SELECT count(c.idComputadora) FROM computadoras c INNER JOIN pcs_tipos tpc ON c.idComputadora = tpc.idComputadora WHERE tpc.idTipoComputadora = ?");
			stmt.setString(1, tpc.getIdTipoComputadora());
			rs = stmt.executeQuery();
			if(rs!=null&&rs.next()) {
				rs.first();
				while(rs.next()) {
					cant++;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return cant;
	}
}
