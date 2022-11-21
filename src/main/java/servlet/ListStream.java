package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.ControladorReserva;

import java.io.IOException;
import java.util.LinkedList;

import dto.Streamers;

/**
 * Servlet implementation class ListStream
 */
public class ListStream extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListStream() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ControladorReserva ctrl = new ControladorReserva();
		LinkedList<Streamers> list = ctrl.getStreamersList();
		request.setAttribute("liststreamers", list);
		request.getRequestDispatcher("listStreams.jsp").include(request, response);
	}

}
