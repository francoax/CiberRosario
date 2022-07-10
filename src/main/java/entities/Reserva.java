package entities;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class Reserva {

	private int idReserva;
	private LocalDateTime fecha_de_reserva;
	private LocalDateTime fecha_a_reservar;
	private LocalDateTime horaDesde;
	private LocalDateTime horaHasta;
	private String username;
	private int idComputadora;
	private int importe;
	
	public int getIdReserva() {
		return idReserva;
	}
	public void setIdReserva(int idReserva) {
		this.idReserva = idReserva;
	}
	public LocalDateTime getFecha_de_reserva() {
		return fecha_de_reserva;
	}
	public void setFecha_de_reserva(LocalDateTime fecha_de_reserva) {
		this.fecha_de_reserva = fecha_de_reserva;
	}
	public LocalDateTime getFecha_a_reservar() {
		return fecha_a_reservar;
	}
	public void setFecha_a_reservar(LocalDateTime fecha_a_reservar) {
		this.fecha_a_reservar = fecha_a_reservar;
	}
	public LocalDateTime getHoraDesde() {
		return horaDesde;
	}
	public void setHoraDesde(LocalDateTime horaDesde) {
		this.horaDesde = horaDesde;
	}
	public LocalDateTime getHoraHasta() {
		return horaHasta;
	}
	public void setHoraHasta(LocalDateTime horaHasta) {
		this.horaHasta = horaHasta;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getIdComputadora() {
		return idComputadora;
	}
	public void setIdComputadora(int idComputadora) {
		this.idComputadora = idComputadora;
	}
	public int getImporte() {
		return importe;
	}
	public void setImporte(int importe) {
		this.importe = importe;
	}
	
	
	
}
