package data;

import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Types;

public class DataPrecios {

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
	
	
	
	
}
