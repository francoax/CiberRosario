package entities;

import java.time.LocalDate;
import java.time.LocalTime;

public class Reserva {

	
	private int idReserva;
	private LocalDate fecha_de_reserva;
	private LocalDate fecha_a_reservar;
	private LocalTime horaDesde;
	private LocalTime horaHasta;
	private int idUsuario;
	private String plataforma_stream;
	private String name_stream;
	private String link_stream;
	private String rubro_work;
	private String empresa_work;
	private String descripcion_work;
	private int idComputadora;
	private int importe;
	
	public int getIdReserva() {
		return idReserva;
	}
	public void setIdReserva(int idReserva) {
		this.idReserva = idReserva;
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
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	public String getPlataforma_stream() {
		return plataforma_stream;
	}
	public void setPlataforma_stream(String plataforma_stream) {
		this.plataforma_stream = plataforma_stream;
	}
	public String getName_stream() {
		return name_stream;
	}
	public void setName_stream(String name_stream) {
		this.name_stream = name_stream;
	}
	public String getLink_stream() {
		return link_stream;
	}
	public void setLink_stream(String link_stream) {
		this.link_stream = link_stream;
	}
	public String getRubro_work() {
		return rubro_work;
	}
	public void setRubro_work(String rubro_work) {
		this.rubro_work = rubro_work;
	}
	public String getEmpresa_work() {
		return empresa_work;
	}
	public void setEmpresa_work(String empresa_work) {
		this.empresa_work = empresa_work;
	}
	public String getDescripcion_work() {
		return descripcion_work;
	}
	public void setDescripcion_work(String descripcion_work) {
		this.descripcion_work = descripcion_work;
	}
	public LocalDate getFecha_de_reserva() {
		return fecha_de_reserva;
	}
	public void setFecha_de_reserva(LocalDate fecha_de_reserva) {
		this.fecha_de_reserva = fecha_de_reserva;
	}
	public LocalDate getFecha_a_reservar() {
		return fecha_a_reservar;
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
	
	
	
}
