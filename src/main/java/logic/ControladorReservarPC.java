package logic;

import java.time.LocalTime;

import data.DataDescuentos;
import data.DataPc;
import data.DataPrecios;
import data.DataReservas;
import data.DataTpc;
import entities.Computadora;
import entities.Descuento;
import entities.Precio;
import entities.Reserva;
import entities.TypePc;

public class ControladorReservarPC {
	
		DataPc pcdao;
		DataTpc tpcdao;
		DataReservas rdao;
		DataPrecios pdao;
		DataDescuentos ddao;
	
	public ControladorReservarPC() {
		pcdao = new DataPc();
		tpcdao = new DataTpc();
		rdao = new DataReservas();
		pdao = new DataPrecios();
		ddao = new DataDescuentos();
	}

	public Computadora pcById (int id) {
		
		return pcdao.getById(id);
	}
	public Computadora pcByType(TypePc tpc) {
		
		return pcdao.getOne(tpc);
	}
	
	public int cantidadDisponible (TypePc tpc) {
		
		return pcdao.countAvailable(tpc);
	}
	
	public Computadora selectToReserve (TypePc tpc) {
		
		Computadora pc = new Computadora();
		pc = pcdao.findOneavailable(tpc);
		if(pc==null) {
			// Preguntar sobre throws.
			throw new RuntimeException("No hay mas computadoras disponibles de este tipo. Disculpe las molestias.");
		}
		changeMood(pc, "seleccionada");
		return pc;
	}
	
	public void changeMood(Computadora pc, String estado) {
		
		pcdao.setEstado(pc,estado);
	}
	// Busca y devuelve el objeto del tipo de computadora por descripcion
	public TypePc getType(String desc) {
				
		return tpcdao.getByDesc(desc);
	}		
	// Busca y devuelve el objeto del tipo de computadora por id.
	public TypePc getType(int id) {
				
		return tpcdao.getById(id);
	}
	public int calcularMonto(LocalTime d, LocalTime h, Precio precioActual) {

		int monto = 0;
		int precio = precioActual.getPrecio();
		int cantHoras = h.getHour() - d.getHour();
		int submonto = 0;
		if(cantHoras>=4) {
			Descuento desc = obtenerDescuento(cantHoras);
			double porcentaje = desc.getPorcentaje();
			submonto = cantHoras * precio;
			monto = (int) (submonto - submonto*porcentaje);
		} else {
			monto = cantHoras * precio;
		}
		
		return monto;
	}
	
	public Descuento obtenerDescuento(int cantHoras) {
		
		return ddao.getOne(cantHoras);
	}
	
	public void registrar(Reserva r) {
		
		rdao.save(r);
	}
	
	public Precio obtenerPrecioAlDia(TypePc tpc) {
		
		return pdao.getLastPriceFor(tpc);
	}
}
