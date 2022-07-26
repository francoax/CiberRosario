package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;

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
		
			try {
				LocalTime horadesde = LocalTime.parse(request.getParameter("horadesde"));
				LocalTime horahasta = LocalTime.parse(request.getParameter("horahasta"));
				request.setAttribute("finish", "include/finishreserve.jsp");
				request.getRequestDispatcher("saving.jsp").include(request, response);
		} catch (DateTimeParseException e) {
				request.setAttribute("msghour", "Defina los horarios");
				request.getRequestDispatcher("saving.jsp").forward(request, response);
			}	
			
		
	}

}
