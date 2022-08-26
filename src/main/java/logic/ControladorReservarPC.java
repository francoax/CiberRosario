package logic;

import java.time.LocalTime;
import java.util.Date;

import javax.mail.Message;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.security.auth.Subject;

import data.DataDescuentos;
import data.DataPc;
import data.DataPrecios;
import data.DataReservas;
import data.DataTpc;
import entities.Computadora;
import entities.Descuento;
import entities.Precio;
import entities.Reserva;
import entities.TypePc;
import entities.Usuario;

public class ControladorReservarPC {
	
		DataPc pcdao;
		DataTpc tpcdao;
		DataReservas rdao;
		DataPrecios pdao;
		DataDescuentos ddao;
	
	public ControladorReservarPC() {
		pcdao = new DataPc();
		tpcdao = new DataTpc();
		rdao = new DataReservas();
		pdao = new DataPrecios();
		ddao = new DataDescuentos();
	}

	public Computadora pcById (int id) {
		
		return pcdao.getById(id);
	}
	public Computadora pcByType(TypePc tpc) {
		
		return pcdao.getOne(tpc);
	}
	
	public int cantidadDisponible (TypePc tpc) {
		
		return pcdao.countAvailable(tpc);
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
	// Busca y devuelve el objeto del tipo de computadora por descripcion
	public TypePc getType(String desc) {
				
		return tpcdao.getByDesc(desc);
	}		
	// Busca y devuelve el objeto del tipo de computadora por id.
	public TypePc getType(int id) {
				
		return tpcdao.getById(id);
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
	
	public Reserva registrar(Reserva r) {
		
		return rdao.save(r);
	}
	
	public Precio obtenerPrecioAlDia(TypePc tpc) {
		
		return pdao.getLastPriceFor(tpc);
	}
	
	public void sendMail(Usuario u, Reserva r) {
		
		MimeMessage msg = new MimeMessage(session);
	      //set message headers
	      msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
	      msg.addHeader("format", "flowed");
	      msg.addHeader("Content-Transfer-Encoding", "8bit");

	      msg.setFrom(new InternetAddress("no_reply@example.com", "NoReply-JD"));

	      msg.setReplyTo(InternetAddress.parse("no_reply@example.com", false));

	      msg.setSubject(Subject, "UTF-8");

	      msg.setText(body, "UTF-8");

	      msg.setSentDate(new Date());

	      msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
	      System.out.println("Message is ready");
  	  Transport.send(msg);  

	      System.out.println("EMail Sent Successfully!!");
	}
}
