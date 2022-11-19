package dto;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class ReserveList {
	
	private String cod_reserva;
	private LocalDate fecha_de_reserva;
	private LocalDate fecha_a_reservar;
	private String horaDesde;
	private String horaHasta;
	private String user_name;
	private String user_lastname;
	private String user_dni;
	private int idComputadora;
	
	private String dateFormat="dd/MM/yyyy";
	private DateTimeFormatter format = DateTimeFormatter.ofPattern(dateFormat);
	
	public int getIdComputadora() {
		return idComputadora;
	}
	public void setIdComputadora(int idComputadora) {
		this.idComputadora = idComputadora;
	}
	public String getCod_reserva() {
		return cod_reserva;
	}
	public void setCod_reserva(String cod_reserva) {
		this.cod_reserva = cod_reserva;
	}
	public String getFecha_de_reserva() {
		return fecha_de_reserva.format(format);
	}
	public void setFecha_de_reserva(LocalDate fecha_de_reserva) {
		this.fecha_de_reserva = fecha_de_reserva;
	}
	public String getFecha_a_reservar() {
		return fecha_a_reservar.format(format);
	}
	public void setFecha_a_reservar(LocalDate fecha_a_reservar) {
		this.fecha_a_reservar = fecha_a_reservar;
	}
	public String getHoraDesde() {
		return horaDesde;
	}
	public void setHoraDesde(String horaDesde) {
		this.horaDesde = horaDesde;
	}
	public String getHoraHasta() {
		return horaHasta;
	}
	public void setHoraHasta(String horaHasta) {
		this.horaHasta = horaHasta;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_lastname() {
		return user_lastname;
	}
	public void setUser_lastname(String user_lastname) {
		this.user_lastname = user_lastname;
	}
	public String getUser_dni() {
		return user_dni;
	}
	public void setUser_dni(String user_dni) {
		this.user_dni = user_dni;
	}
	
	

}
