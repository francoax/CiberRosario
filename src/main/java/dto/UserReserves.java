package dto;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class UserReserves {
	
	private String cod_reserva;
	private String fecha_de_reserva;
	private String fecha_reservada;
	private String horaDesde;
	private String horasHasta;
	private int cant_horas;
	private String estado;
	private String descripcion_pc;
	private String importe;
	
	public String getCod_reserva() {
		return cod_reserva;
	}
	public void setCod_reserva(String cod_reserva) {
		this.cod_reserva = cod_reserva;
	}
	public String getFecha_de_reserva() {
		return fecha_de_reserva;
	}
	public void setFecha_de_reserva(String fecha_de_reserva) {
		this.fecha_de_reserva = fecha_de_reserva;
	}
	public String getFecha_reservada() {
		return fecha_reservada;
	}
	public void setFecha_reservada(String fecha_reservada) {
		this.fecha_reservada = fecha_reservada;
	}
	public String getHoraDesde() {
		return horaDesde;
	}
	public void setHoraDesde(String horaDesde) {
		this.horaDesde = horaDesde;
	}
	public String getHorasHasta() {
		return horasHasta;
	}
	public void setHorasHasta(String horasHasta) {
		this.horasHasta = horasHasta;
	}
	public int getCant_horas() {
		return cant_horas;
	}
	public void setCant_horas(int cant_horas) {
		this.cant_horas = cant_horas;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getDescripcion_pc() {
		return descripcion_pc;
	}
	public void setDescripcion_pc(String descripcion_pc) {
		this.descripcion_pc = descripcion_pc;
	}
	public String getImporte() {
		return importe;
	}
	public void setImporte(String importe) {
		this.importe = importe;
	}
	
	
	

}
