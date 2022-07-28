package logic;

import data.DataPrecios;
import entities.Precio;
import entities.TypePc;

public class LogicPrice {

	DataPrecios pdao;
	
	public LogicPrice() {
		
		pdao = new DataPrecios();
	}
	
	
	public Precio obtenerPrecioAlDia(TypePc tpc) {
		
		return pdao.getLastPriceFor(tpc);
	}
	
}
