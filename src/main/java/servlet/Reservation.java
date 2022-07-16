package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.Pclogic;
import logic.Tpclogic;

import java.io.IOException;
import java.util.Enumeration;
import java.util.LinkedList;

import data.TpcDao;
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
			Pclogic pctrl = new Pclogic();
			Tpclogic tctrl = new Tpclogic();
			int amountg = pctrl.getAmountavailable(tctrl.getOne("gamer"));
			int amounts = pctrl.getAmountavailable(tctrl.getOne("streamer"));
			int amountw = pctrl.getAmountavailable(tctrl.getOne("workstation"));
			System.out.println("g: "+amountg+" "+"s: "+amounts+" "+" w: "+amountw);
			request.setAttribute("amountg", amountg);
			request.setAttribute("amounts", amounts);
			request.setAttribute("amountw", amountw);
			request.getRequestDispatcher("reservation.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("nulo", 0);
			response.sendRedirect("index.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String tipo = request.getParameter("tipo");
		
	}

}
