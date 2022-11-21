package dto;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class PriceSpecification {
	
	private String pc_descripcion;
	private LocalDate fechaPrecioActual;
	private LocalDate fechaPrecioProxima;
	private int precioActual;
	private int precioProximo;
	
	private String dateFormat="dd/MM/yyyy";
	private DateTimeFormatter format = DateTimeFormatter.ofPattern(dateFormat);
	
	public String getPc_descripcion() {
		return pc_descripcion;
	}
	public void setPc_descripcion(String pc_descripcion) {
		this.pc_descripcion = pc_descripcion;
	}
	public String getFechaPrecioActual() {
		return fechaPrecioActual.format(format);
	}
	public void setFechaPrecioActual(LocalDate fechaPrecioActual) {
		this.fechaPrecioActual = fechaPrecioActual;
	}
	public String getFechaPrecioProxima() {
		return fechaPrecioProxima.format(format);
	}
	public void setFechaPrecioProxima(LocalDate fechaPrecioProxima) {
		this.fechaPrecioProxima = fechaPrecioProxima;
	}
	public int getPrecioActual() {
		return precioActual;
	}
	public void setPrecioActual(int precioActual) {
		this.precioActual = precioActual;
	}
	public int getPrecioProximo() {
		return precioProximo;
	}
	public void setPrecioProximo(int precioProximo) {
		this.precioProximo = precioProximo;
	}
	
	
	

}
