package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.ControladorDiscount;

import java.io.IOException;
import java.util.LinkedList;

import entities.Descuento;

/**
 * Servlet implementation class ListDiscount
 */
public class ListDiscount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListDiscount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ControladorDiscount desctrl = new ControladorDiscount();
		LinkedList<Descuento> descounts = desctrl.getAll();
		request.setAttribute("listDescount", descounts);
		request.getRequestDispatcher("/WEB-INF/Views/Administration/listdescount.jsp").include(request, response);
	}

}
