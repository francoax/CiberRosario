package servlet;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import logic.ControladorReserva;

import java.io.IOException;



import entities.Computadora;

import entities.Usuario;

/**
 * Servlet implementation class Reservation
 */
public class Reservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Intencion: Conseguir la cantidad de computadoras disponibles de cada tipo.
		try {
			ControladorReserva reserve = new ControladorReserva();
			Computadora g, s, w;
			int gq, sq, wq = 0;
			// Obtengo computadoras y sus cantidades disponibles para mostrar.
			g = reserve.pcByType(reserve.getType("gamer"));
			s = reserve.pcByType(reserve.getType("streamer"));
			w = reserve.pcByType(reserve.getType("workstation"));
			// Seteo parametros para enviar.
			request.setAttribute("g", g);
			request.setAttribute("s", s);
			request.setAttribute("w", w);
			request.setAttribute("amountg", gq);
			request.setAttribute("amounts", sq);
			request.setAttribute("amountw", wq);
			// Redirijo con parametros.
			request.getRequestDispatcher("reservation.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Usuario user = (Usuario) request.getSession().getAttribute("user");
		if(user!=null) {
		try {
			ControladorReserva reserve = new ControladorReserva();
			Computadora pc = new Computadora();
			String tipo = request.getParameter("tipo");
			String para = request.getParameter("for");

			pc = reserve.selectToReserve(reserve.getType(tipo));
			
			request.getSession().setAttribute("para", para);
			request.getSession().setAttribute("pc", pc);
			request.getRequestDispatcher("WEB-INF/saving.jsp").forward(request, response);
			
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
			request.getRequestDispatcher("bookings.jsp").forward(request, response);
		}
		}else {
			response.sendRedirect("login.jsp");
		}
	}

}
