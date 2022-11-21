package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.ControladorReserva;

import java.io.IOException;
import java.util.LinkedList;

import dto.ReserveList;

/**
 * Servlet implementation class ListReserve
 */
public class ListReserve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListReserve() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ControladorReserva ctrl = new ControladorReserva();
		LinkedList<ReserveList> list = ctrl.getAll();
		request.setAttribute("reservelist", list);
		request.getRequestDispatcher("/WEB-INF/Views/Administration/listReserve.jsp").include(request, response);
	}

}
