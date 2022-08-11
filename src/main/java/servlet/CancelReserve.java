package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.ControladorReservarPC;
import logic.LogicPc;

import java.io.IOException;

import org.apache.catalina.ha.backend.Sender;

import entities.Computadora;

/**
 * Servlet implementation class CancelReserve
 */
public class CancelReserve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelReserve() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Computadora pc = (Computadora) request.getSession().getAttribute("pc");
		ControladorReservarPC ctrlrpc = new ControladorReservarPC();
		ctrlrpc.changeMood(pc, "disponible");
		if (request.getSession().getAttribute("reserva")!=null) {
			request.getSession().removeAttribute("reserve");
		}
		request.getSession().removeAttribute("pc");
		request.getSession().removeAttribute("para");
		response.sendRedirect("bookings.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
