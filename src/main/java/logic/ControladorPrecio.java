package logic;

import java.sql.SQLException;
import java.util.LinkedList;

import data.DataPrecios;
import dto.PriceSpecification;
import entities.Precio;

public class ControladorPrecio {

	private DataPrecios data;
	
	public ControladorPrecio() {
		data = new DataPrecios();
	}
	
	public LinkedList<PriceSpecification> getAll(){
		
		return data.getAll();
	}
	
	public void update(Precio precio) throws SQLException {
		
		data.update(precio);
	}
	
}
