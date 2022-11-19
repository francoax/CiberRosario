package logic;

import data.DataPc;
import entities.Computadora;

public class ControladorPc {

	private DataPc data;
	
	public ControladorPc() {
		
		data = new DataPc();
	}
	
	public void add(Computadora newPc, String tipo) {
		
		data.add(newPc, tipo);
	}
	
}
