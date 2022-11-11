package logic;

import java.time.LocalTime;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Properties;

import data.DataDescuentos;
import data.DataPc;
import data.DataPrecios;
import data.DataReservas;
import data.DataTpc;
import dto.ComputersSpecification;
import dto.ReserveSpecification;
import entities.Computadora;
import entities.Descuento;
import entities.Precio;
import entities.Reserva;
import entities.TypePc;
import entities.Usuario;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.AddressException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class ControladorReserva {
	
		private DataPc pcdao;
		private DataTpc tpcdao;
		private DataReservas rdao;
		private DataPrecios pdao;
		private DataDescuentos ddao;
	
	public ControladorReserva() {
		this.pcdao = new DataPc();
		this.tpcdao = new DataTpc();
		this.rdao = new DataReservas();
		this.pdao = new DataPrecios();
		this.ddao = new DataDescuentos();
	}
	
	public LinkedList<ComputersSpecification> GetPcsAvailable () {
		
		return pcdao.GetPcsAvailable();
	}
	
	public int selectToReserve(String tpc) {
		
		int id = pcdao.getIdAvailable(tpc);
		changeState(id, "seleccionada");
		return id;
	}
	
	public void changeState(int id, String estado) {
		
		pcdao.setEstado(id, estado);
	}

	
	public int obtenerPrecioAlDia(String tpc) {
		
		return pdao.getPrice(tpc);
		
	}
	
	public Descuento obtenerDescuento(int cantHoras) {
		
		return ddao.getOne(cantHoras);
	}
	
	public int calcularMonto(LocalTime d, LocalTime h, int price) {
		
		int precio = price;
		int monto = 0;
		int submonto = 0;
		int cantHoras = h.getHour() - d.getHour();
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
	
	public Reserva save(Reserva r) {
		
		return rdao.save(r);
	}
	
	public ReserveSpecification validate(String code) {
		
		return rdao.validate(code);
	}
	
	public void confirm(String code) {
		
		rdao.confirm(code);
	}
	
	public void sendMail(Usuario u, Reserva r, String pc) throws AddressException, MessagingException {
		
		try {
		 final Properties props;
		 int port = 465;
		 String to = u.getEmail();
		 String subject = "CiberRosario - Reserva ";
		 String content = 
				 "Hola"+" "+u.getNombre().toUpperCase()+", "+"su reserva se ha realizado con éxito."
				+ "\nLe adjuntamos la informacion de su reserva: "
				+ "\n\t>> Computadora: "+pc.toUpperCase()+" ."
				+ "\n\t>> Reserva hecha el: "+r.getFecha_de_reserva()+" ."
				+ "\n\t>> Para el dia: "+r.getFecha_a_reservar()+" ."
				+ "\n\t>> Desde las "+r.getHoraDesde()+", "+"hasta las "+r.getHoraHasta()+" ."
				+ "\n\t>> Por un total de: $"+r.getImporte()+" ."
		 		+ "\nPara proseguir, al momento de llegada la reserva, presente el siguiente codigo al recepcionista. Recuerde que el total debe abonarse en EFECTIVO en el local."
		 		+ ""
		 		+ "\n\n\tCÓDIGO: "+r.getCod_reserva().toUpperCase()+
		 		"\n\n"
		 		
		 		+"Muchas gracias. Nos vemos viciando!"
		 		+"\nCiberRosario";
		 
		 props = new Properties();
		 
		 props.put("mail.smtp.auth", "true");
		 props.put("mail.smtp.ssl.enable", "true");
		 props.put("mail.smtp.host", "smtp.gmail.com");
		 props.put("mail.smtp.port", port);
		 props.put("from", "ciberrosariopc@gmail.com");
		 props.put("username", "ciberrosariopc@gmail.com");
		 props.put("password", "rosfossvhymupehd");
		 
		 Session sesion = Session.getInstance(props, new Authenticator() {
			 protected PasswordAuthentication getPasswordAuthentication() {
				 return new PasswordAuthentication(props.getProperty("username"), props.getProperty("password")); 
			 }
		});
		 
		 Message mensaje = new MimeMessage(sesion);
		 mensaje.setFrom(new InternetAddress(props.getProperty("from")));
		 mensaje.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
		 mensaje.setSubject(subject);
		 mensaje.setText(content);
		 Transport.send(mensaje);
		 
		 System.out.println("mail enviado.");
		 
		} catch (Exception e) {
			System.out.println("No se pudo mandar el mail.");
			e.printStackTrace();
		}
	}
}