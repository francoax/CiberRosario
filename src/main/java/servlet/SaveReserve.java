package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalTime;

import entities.Computadora;

/**
 * Servlet implementation class SaveReserve
 */
public class SaveReserve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveReserve() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		LocalTime horadesde = LocalTime.parse(request.getParameter("horadesde"));
		LocalTime horahasta = LocalTime.parse(request.getParameter("horahasta"));
		String type = request.getParameter("reserve");
		request.getRequestDispatcher("saving.jsp").forward(request, response);
		if(horadesde.getHour()>=horahasta.getHour()) {
			request.setAttribute("msgerror", "Establezca un rango horario valido.");
			request.getRequestDispatcher("saving.jsp").forward(request, response);
		}
		
		
	}

}
