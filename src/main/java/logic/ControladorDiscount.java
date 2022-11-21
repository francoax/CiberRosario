package logic;

import java.util.HashMap;
import java.util.LinkedList;

import data.DataDescuentos;
import entities.Descuento;

public class ControladorDiscount {
	
	private DataDescuentos data;
	
	public ControladorDiscount() {
		data = new DataDescuentos();
	}
	
	public LinkedList<Descuento> getAll() {
		
		return data.getAll();
	}
	
	public void update(String range, double discount) {
		
		HashMap<String, Integer> rangos = new HashMap<String, Integer>();
		rangos.put("flex", 4);
		rangos.put("medium", 6);
		rangos.put("high", 8);
		rangos.put("ultra", 15);
		
		data.update(rangos.get(range), discount);
	}

}
