package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.Register;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.swing.text.DateFormatter;

import entities.Usuario;

/**
 * Servlet implementation class Signup
 */
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup() {
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
		
		
		Usuario newUser = new Usuario();
		Register ctrl = new Register();
		
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		LocalDate fechanac = LocalDate.parse(request.getParameter("fechanac"));
		String dni = request.getParameter("dni");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String username = request.getParameter("user");
		String password = request.getParameter("password");
		
		newUser.setNombre(nombre);
		newUser.setApellido(apellido);
		newUser.setFecha_nacimiento(fechanac);
		newUser.setDni(dni);
		newUser.setEmail(email);
		newUser.setTelefono(tel);
		newUser.setUsername(username);
		newUser.setPassword(password);
		
		ctrl.registerUser(newUser);
		
		response.sendRedirect("index.html");
		
	}
}
