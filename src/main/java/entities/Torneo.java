package entities;

import java.time.LocalDate;

public class Torneo {
	
	private int idTorneo;
	private LocalDate fecha_inicio_torneo;
	private LocalDate fecha_fin_torneo;
	private String game;
	private String descripcion_premio;
	private String username;
	
	public int getIdTorneo() {
		return idTorneo;
	}
	public void setIdTorneo(int idTorneo) {
		this.idTorneo = idTorneo;
	}
	public LocalDate getFecha_inicio_torneo() {
		return fecha_inicio_torneo;
	}
	public void setFecha_inicio_torneo(LocalDate fecha_inicio_torneo) {
		this.fecha_inicio_torneo = fecha_inicio_torneo;
	}
	public LocalDate getFecha_fin_torneo() {
		return fecha_fin_torneo;
	}
	public void setFecha_fin_torneo(LocalDate fecha_fin_torneo) {
		this.fecha_fin_torneo = fecha_fin_torneo;
	}
	public String getGame() {
		return game;
	}
	public void setGame(String game) {
		this.game = game;
	}
	public String getDescripcion_premio() {
		return descripcion_premio;
	}
	public void setDescripcion_premio(String descripcion_premio) {
		this.descripcion_premio = descripcion_premio;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

}
