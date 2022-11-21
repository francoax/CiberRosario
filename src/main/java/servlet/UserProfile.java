package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.ControladorReserva;

import java.io.IOException;

import dto.ReserveSpecification;
import entities.Usuario;

/**
 * Servlet implementation class UserProfile
 */
public class UserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserProfile() {
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
				response.sendRedirect("login.jsp");
			} else {
				request.getRequestDispatcher("/WEB-INF/Views/User/profile.jsp").forward(request, response);
			}
		} else {
			response.sendRedirect("login.jsp");
		}
		
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
		String code = (String) request.getParameter("code");
		String idpc = (String) request.getParameter("idpc");
		ControladorReserva ctrl = new ControladorReserva();
		ctrl.cancelarReserva(code);
		ctrl.changeState(Integer.parseInt(idpc), "disponible");
		request.setAttribute("canceled", "Reserva cancelada con éxito!");
		request.getRequestDispatcher("/WEB-INF/Views/User/reserveCanceled.jsp").forward(request, response);
		
		
		
	}

}
