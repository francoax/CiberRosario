package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.ControladorReserva;

import java.io.IOException;

import entities.Reserva;
import entities.Usuario;

/**
 * Servlet implementation class AdminConnect
 */
public class Administration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ControladorReserva rsva = new ControladorReserva(); 
       
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
				response.sendRedirect("login.jsp");
			} else if (user.getRol().getIdRol()==2) {
				request.getRequestDispatcher("WEB-INF/admin.jsp").forward(request, response);
			} else {
				response.sendRedirect("pages/autherror.jsp");
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
		
		String code = (String) request.getAttribute("code");
		Reserva reserved;
		if(true) {;
			request.setAttribute("success", 1);
			doGet(request, response);
		}
	}

}
