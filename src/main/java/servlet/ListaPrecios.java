package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.ControladorDiscount;
import logic.ControladorPrecio;

import java.io.IOException;
import java.util.LinkedList;

import entities.Descuento;
import entities.Precio;

/**
 * Servlet implementation class ListaPrecios
 */
public class ListaPrecios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListaPrecios() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ControladorPrecio desctrl = new ControladorPrecio();
		LinkedList<Precio> precios = desctrl.getAll();
		request.setAttribute("listPrecios", precios);
		request.getRequestDispatcher("/WEB-INF/Views/Administration/listPrice.jsp").include(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
