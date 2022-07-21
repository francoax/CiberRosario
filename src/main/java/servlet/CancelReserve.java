package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.Pclogic;

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
		
		String id = request.getParameter("pc");
		Computadora pc = new Computadora();
		Pclogic pctrl = new Pclogic();
		pc = pctrl.getById(Integer.parseInt(id));
		System.out.println(pc.getEstado()+"cancela");
		pctrl.changeMood(pc, "disponible");
		System.out.println(pc.getEstado()+"cancela");
		request.getSession().removeAttribute("pc");
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
