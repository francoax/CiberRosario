package logic;

import data.DataDescuentos;
import entities.Descuento;

public class LogicDiscount {

	DataDescuentos ddao ;
	
	public LogicDiscount() {
		
		ddao = new DataDescuentos();
	}
	
	public Descuento obtenerDescuento(int d, int h) {
		
		return ddao.getOne(d, h);
	}
	
	
}
