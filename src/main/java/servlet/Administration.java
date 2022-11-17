package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.ControladorReserva;
import logic.ControladorUser;

import java.io.IOException;

import javax.management.ServiceNotFoundException;

import data.DataRoles;
import data.DataUsuarios;
import dto.ReserveSpecification;
import dto.UserModificated;
import entities.Usuario;

/**
 * Servlet implementation class AdminConnect
 */
public class Administration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ControladorReserva ctrl = new ControladorReserva(); 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Administration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(request.getSession(false) != null) {
			
			Usuario user = (Usuario) request.getSession(false).getAttribute("user");
			
			if(user == null) {
				response.sendRedirect("./login.jsp");
			} else if (user.getRol().getIdRol()==2) {
				request.getRequestDispatcher("/WEB-INF/Views/Administration/admin.jsp").forward(request, response);
			} else {
				response.sendError(403);
			}
		} else {
			response.sendRedirect("./login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String path = (String) request.getPathInfo().substring(1);
		try {
			switch(path) {
			case "validate" : {
				
				request.getSession().removeAttribute("reservespec");
				
				String code = (String) request.getParameter("code");
				
				if(code.equals("")) {
					request.setAttribute("error", "Por favor, especifique el codigo");
					response.sendError(400);
				} else {
					ReserveSpecification rs = this.ctrl.validate(code);
					if(rs==null) {
						request.setAttribute("error", "Reserva no encontrada");
						response.sendError(400);
					} else {
						request.getSession().setAttribute("reservespec", rs);						
						request.getRequestDispatcher("/WEB-INF/Views/Administration/info.jsp").forward(request, response);
					}
				}
				break;
			}
			case "confirm" : {
				
				ReserveSpecification rs = (ReserveSpecification) request.getSession().getAttribute("reservespec");
				this.ctrl.confirm(rs.getCode());
				request.getSession().removeAttribute("reservespec");
				request.setAttribute("reservespec", rs);	
				request.getRequestDispatcher("/WEB-INF/Views/Administration/confirmed.jsp").forward(request, response);
				break;
			}
			
			case "cancel" : {
				
				String code = (String) request.getParameter("cancelcode");
				System.out.println(code);
				
				if(code.equals("")){
					request.setAttribute("error", "Especifique el codigo de reserva a cancelar");
					response.sendError(400);
				} else { 
					ReserveSpecification reserve = this.ctrl.cancelarReserva(code);
					if(reserve == null) {
						request.setAttribute("error", "Reserva no encontrada");
						response.sendError(400);
					} else {
						this.ctrl.changeState(reserve.getIdPc(), "disponible");
						request.setAttribute("reserveCanceled", reserve);
						request.getRequestDispatcher("/WEB-INF/Views/Administration/reserveCanceled.jsp").forward(request, response);
					}
				}
				break;	
			}
			
			case "modify" : {
				
				ControladorUser userctrl = new ControladorUser(new DataUsuarios(), new DataRoles());
				String username = (String) request.getParameter("username");
				String rol = (String) request.getParameter("rol");
				
				if(username.equals("")||rol.equals("Rol")) {
					request.setAttribute("error", "Modificar Usuario: Por favor, especifique correctamente los campos");
					response.sendError(400);
				} else {
					UserModificated user = userctrl.modify(username, rol);
					if(user==null) {
						request.setAttribute("error", "Usuario no encontrado o ya posee ese rol.");
						response.sendError(404);
					} else {
						request.setAttribute("userModificated", user);
						request.setAttribute("rol", rol);
						request.getRequestDispatcher("/WEB-INF/Views/Administration/userModify.jsp").forward(request, response);
					}
				}
			break;
			}
			
			case "descount" : {
				
				LinkedList<Descuento> descuentos = 
				
				break;
			}
			default: {
				break;
			}
			}
		} catch (IllegalStateException e) {
			response.sendError(500);
		}
	}

}
