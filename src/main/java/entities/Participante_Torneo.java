package entities;

import java.time.LocalDate;

public class Participante_Torneo {

	private String username;
	private LocalDate fecha_inscripcion;
	private int idTorneo;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public LocalDate getFecha_inscripcion() {
		return fecha_inscripcion;
	}
	public void setFecha_inscripcion(LocalDate fecha_inscripcion) {
		this.fecha_inscripcion = fecha_inscripcion;
	}
	public int getIdTorneo() {
		return idTorneo;
	}
	public void setIdTorneo(int idTorneo) {
		this.idTorneo = idTorneo;
	}
	
}
