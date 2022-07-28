package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.LogicPrice;
import logic.LogicReserve;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

import entities.Computadora;
import entities.Precio;
import entities.Reserva;
import entities.Usuario;

/**
 * Servlet implementation class SaveReserve
 */
public class SaveReserve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveReserve() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {	
				Reserva r = new Reserva();
				LogicReserve rctrl = new LogicReserve();
				LogicPrice pctrl = new LogicPrice();
				Precio precioActual = new Precio();
				Computadora pc = (Computadora) request.getSession().getAttribute("pc");
				LocalTime horadesde = (LocalTime) LocalTime.parse(request.getParameter("horadesde"));
				LocalTime horahasta = (LocalTime) LocalTime.parse(request.getParameter("horahasta"));
				precioActual = pctrl.obtenerPrecioAlDia(pc.getTipo());
				int monto = rctrl.calcularMonto(horadesde, horahasta, precioActual);
				r.setFecha_de_reserva(LocalDate.now());
				String para = (String) request.getSession().getAttribute("para");
				if(para.contains("mañana")&&LocalTime.now().getHour()!=0) {
					r.setFecha_a_reservar(LocalDate.now().plusDays(1));
				} else {
					r.setFecha_a_reservar(LocalDate.now());
				}
				r.setHoraDesde(horadesde);
				r.setHoraHasta(horahasta);
				r.setImporte(monto);
				Usuario user = (Usuario) request.getSession().getAttribute("user");
				r.setIdUsuario(user.getId());
				r.setIdComputadora(pc.getIdComputadora());
				switch (pc.getTipo().getDescripcion()) {
				case "gamer":
					
					break;
				case "streamer":
						r.setName_stream(request.getParameter("sname"));
						r.setPlataforma_stream(request.getParameter("platform"));
						r.setLink_stream(request.getParameter("links"));
					break;
				case "workstation":
						r.setRubro_work(request.getParameter("rubro"));
						r.setEmpresa_work(request.getParameter("emp"));
						r.setDescripcion_work(request.getParameter("descwork"));
					break;
				default:
					break;
				}
				request.getSession().setAttribute("reserva", r);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			
			
		
	}
	
}
