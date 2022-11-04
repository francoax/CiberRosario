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
import entities.Computadora;
import entities.Descuento;
import entities.PCDto;
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

	public Computadora pcById (int id) {
		
		return pcdao.getById(id);
	}
	
	public LinkedList<PCDto> GetPcsAvailable () {
		
		return pcdao.GetPcsAvailable();
	}
	
	public Computadora selectToReserve (TypePc tpc) {
		
		Computadora pc = new Computadora();
		pc = pcdao.findOneavailable(tpc);
		if(pc==null) {
			// Preguntar sobre throws.
			throw new RuntimeException("No hay mas computadoras disponibles de este tipo. Disculpe las molestias.");
		}
		changeMood(pc, "seleccionada");
		return pc;
	}
	
	public void changeMood(Computadora pc, String estado) {
		
		pcdao.setEstado(pc,estado);
	}
	
	public int calcularMonto(LocalTime d, LocalTime h, Precio precioActual) {

		int monto = 0;
		int precio = precioActual.getPrecio();
		int cantHoras = h.getHour() - d.getHour();
		int submonto = 0;
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
	
	public Descuento obtenerDescuento(int cantHoras) {
		
		return ddao.getOne(cantHoras);
	}
	
	public Reserva save(Reserva r) {
		
		return rdao.save(r);
	}
	
	public Precio obtenerPrecioAlDia(TypePc tpc) {
		
		return pdao.getLastPriceFor(tpc);
	}
	
	public void enviarMail(Usuario u, Reserva r, Computadora pc) throws AddressException, MessagingException {
		
		try {
		 final Properties props;
		 int port = 465;
		 String to = u.getEmail();
		 String subject = "CiberRosario - Reserva ";
		 String content = 
				 "Hola"+" "+u.getNombre().toUpperCase()+", "+"su reserva se ha realizado con éxito."
				+ "\nLe adjuntamos la informacion de su reserva: "
				+ "\n\t>> Computadora: "+pc.getTipo().getDescripcion().toUpperCase()+" ."
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
