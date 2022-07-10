package entities;

import java.time.LocalDate;

public class Precio {

	private String idTipoComputadora;
	private LocalDate fecha_precio;
	private int precio;
	
	public String getIdTipoComputadora() {
		return idTipoComputadora;
	}
	public void setIdTipoComputadora(String idTipoComputadora) {
		this.idTipoComputadora = idTipoComputadora;
	}
	public LocalDate getFecha_precio() {
		return fecha_precio;
	}
	public void setFecha_precio(LocalDate fecha_precio) {
		this.fecha_precio = fecha_precio;
	}
	public int getPrecio() {
		return precio;
	}
	public void setPrecio(int precio) {
		this.precio = precio;
	}
	
	
}
