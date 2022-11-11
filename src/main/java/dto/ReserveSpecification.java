package dto;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class ReserveSpecification {
	
	private String code;
	private LocalDate fecha_de_reserva;
	private LocalDate fecha_a_reservar;
	private LocalTime horaDesde;
	private LocalTime horaHasta;
	private int idPc;
	private int importe;
	private String user_dni;
	private String user_nombre;
	private String user_apellido;
	
	private String dateFormat="dd/MM/yyyy";
	private DateTimeFormatter format = DateTimeFormatter.ofPattern(dateFormat);
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getFecha_de_reserva() {
		return fecha_de_reserva.format(format);
	}
	public void setFecha_de_reserva(LocalDate fecha_de_reserva) {
		this.fecha_de_reserva = fecha_de_reserva;
	}
	public String getFecha_a_reservar() {
		return fecha_a_reservar == null ? null : fecha_a_reservar.format(format);
	}
	public void setFecha_a_reservar(LocalDate fecha_a_reservar) {
		this.fecha_a_reservar = fecha_a_reservar;
	}
	public LocalTime getHoraDesde() {
		return horaDesde;
	}
	public void setHoraDesde(LocalTime horaDesde) {
		this.horaDesde = horaDesde;
	}
	public LocalTime getHoraHasta() {
		return horaHasta;
	}
	public void setHoraHasta(LocalTime horaHasta) {
		this.horaHasta = horaHasta;
	}
	public int getIdPc() {
		return idPc;
	}
	public void setIdPc(int idPc) {
		this.idPc = idPc;
	}
	public int getImporte() {
		return importe;
	}
	public void setImporte(int importe) {
		this.importe = importe;
	}
	public String getUser_dni() {
		return user_dni;
	}
	public void setUser_dni(String user_dni) {
		this.user_dni = user_dni;
	}
	public String getUser_nombre() {
		return user_nombre;
	}
	public void setUser_nombre(String user_nombre) {
		this.user_nombre = user_nombre;
	}
	public String getUser_apellido() {
		return user_apellido;
	}
	public void setUser_apellido(String user_apellido) {
		this.user_apellido = user_apellido;
	}
	
	
}
