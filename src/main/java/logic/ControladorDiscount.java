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
		
		HashMap<String, int[]> rangos = new HashMap<String, int[]>();
		rangos.put("flex", new int[] {2,4});
		rangos.put("medium", new int[] {4,6});
		rangos.put("high", new int[] {6,8});
		rangos.put("ultra", new int[] {8,16});
		
		data.update(rangos.get(range), discount);
	}

}
