package servlet;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.AddressException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.ControladorReserva;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.LinkedList;

import dto.ComputersSpecification;
import entities.Reserva;
import entities.Usuario;

/**
 * Servlet implementation class Reserve
 */
public class Reserve extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ControladorReserva ctrl = new ControladorReserva();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reserve() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String path = (String) request.getPathInfo().substring(1);
		Usuario user = (Usuario) request.getSession().getAttribute("user");
		if(user!=null) {
			try {
				switch (path) {
				case "start": {
					LinkedList<ComputersSpecification> pcs = this.ctrl.GetPcsAvailable();
					request.setAttribute("pcs", pcs);
					request.getRequestDispatcher("/WEB-INF/reservation.jsp").forward(request, response);
					break;
				}
				case "cancel": {
					Reserva r = (Reserva) request.getSession().getAttribute("reserva");
					request.getSession().removeAttribute("reserva");
					request.getSession().removeAttribute("para");
					request.getSession().removeAttribute("pc");
					this.ctrl.changeState(r.getIdComputadora(), "disponible");
					response.sendRedirect("../bookings.jsp");
				}
				default:
				}
			} catch (IllegalStateException e) {
				response.sendRedirect("../login.jsp");
			}
		} else {
			response.sendRedirect("../login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String path = (String) request.getPathInfo().substring(1);
		
		Usuario user = (Usuario) request.getSession().getAttribute("user");
		if(user!=null) {
			try {
				switch (path) {
				case "selected": {
					
					Reserva reserve = new Reserva();
					String dia = (String) request.getParameter("reserva_para");
					String type = (String) request.getParameter("tipo");
					
					int idpc = this.ctrl.selectToReserve(type);
					
					reserve.setIdComputadora(idpc);
					reserve.setIdUsuario(user.getId());
					
					reserve.setFecha_de_reserva(LocalDate.now());
					if(dia.contains("mañana")&&LocalTime.now().getHour()!=0) {
						reserve.setFecha_a_reservar(LocalDate.now().plusDays(1));
					} else {
						reserve.setFecha_a_reservar(LocalDate.now());
					}
					
					request.getSession().setAttribute("para", dia);
					request.getSession().setAttribute("pc", type);
					request.getSession().setAttribute("reserva", reserve);
					request.getRequestDispatcher("/WEB-INF/saving.jsp").forward(request, response);
					break;
				}
				case "resume" : {
					
					String hdesde = (String) request.getParameter("horadesde");
					String hhasta = (String) request.getParameter("horahasta");
					
					
					if(hdesde.equals("Desde") && hhasta.equals("Hasta")) {
						request.setAttribute("error", "Por favor, especifique las horas");
						request.getRequestDispatcher("/WEB-INF/saving.jsp").forward(request, response);
					}
					
					Reserva reserve = (Reserva) request.getSession().getAttribute("reserva");
					
					reserve.setHoraDesde(LocalTime.parse(hdesde));
					reserve.setHoraHasta(LocalTime.parse(hhasta));
					
					int price = this.ctrl.obtenerPrecioAlDia((String)request.getSession().getAttribute("pc"));
					request.setAttribute("precio", price);
					
					int monto = this.ctrl.calcularMonto(reserve.getHoraDesde(), reserve.getHoraHasta(), price);
					reserve.setImporte(monto);
					
					completeReserveByType(request, reserve);
					
					request.getRequestDispatcher("/WEB-INF/resume.jsp").forward(request, response);
					break;
				}
				case "save" : {
					
					Reserva reserve = (Reserva) request.getSession().getAttribute("reserva");
					this.ctrl.save(reserve);
					
					try {
						this.ctrl.sendMail(user, reserve, (String)request.getSession().getAttribute("pc"));
					} catch (AddressException e) {
						System.out.println("address exception");
						e.printStackTrace();
					} catch (MessagingException e) {
						System.out.println("messaging excepction");
						e.printStackTrace();
					}
					request.getRequestDispatcher("/WEB-INF/success.jsp").forward(request, response);
					break;
				}
				default:
					break;
				}
			} catch (IllegalStateException e) {
				response.sendRedirect("../login.jsp");
			}
		} else {
			response.sendRedirect("../login.jsp");
		}
	}
	
	
	protected Reserva completeReserveByType(HttpServletRequest request, Reserva reserve) {
		
		switch ((String)request.getSession().getAttribute("pc")) {
		case "streamer" : {
			
			reserve.setPlataforma_stream((String)request.getParameter("platform"));
			reserve.setName_stream((String)request.getParameter("sname"));
			reserve.setLink_stream((String)request.getParameter("links"));
			
			break;
		}
		case "workstation" : {
			
			reserve.setRubro_work((String)request.getParameter("rubro"));
			reserve.setEmpresa_work((String)request.getParameter("emp"));
			reserve.setDescripcion_work((String)request.getParameter("desc"));
			
			break;
		}
		}
		
		return reserve;
		
	}
}
	
