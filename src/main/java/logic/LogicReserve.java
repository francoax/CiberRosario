package logic;

import java.time.LocalTime;

import data.DataReservas;
import entities.Descuento;
import entities.Precio;

public class LogicReserve {

	DataReservas rdao ; 
	
	public LogicReserve () {
		
		rdao = new DataReservas();
	}
	
	
	public int calcularMonto(LocalTime d, LocalTime h, Precio precioActual) {

		int monto = 0;
		int precio = precioActual.getPrecio();
		int cantHoras = h.getHour() - d.getHour();
		int submonto = 0;
		if(cantHoras>=4) {
			LogicDiscount dctrl = new LogicDiscount();
			Descuento desc = dctrl.obtenerDescuento(cantHoras);
			double porcentaje = desc.getPorcentaje();
			submonto = cantHoras * precio;
			monto = (int) (submonto - submonto*porcentaje);
		} else {
			monto = cantHoras * precio;
		}
		
		return monto;
	}
	
}
