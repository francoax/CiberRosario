package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.ControladorReserva;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;

import entities.Computadora;
import entities.PCDto;

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
		try {
			switch (path) {
			case "start": {
				LinkedList<PCDto> pcs = this.ctrl.GetPcsAvailable();
				request.setAttribute("pcs", pcs);
				request.getRequestDispatcher("/WEB-INF/reservation2.jsp").forward(request, response);
				break;
			}
			case "save": {
				
				break;
			}
			default:
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
