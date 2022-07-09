package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

import data.PersonasDao;
import entities.Persona;

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
		
		Persona per = new Persona();
		PersonasDao pdao = new PersonasDao();
		
		String dni = request.getParameter("dni");
		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String email = request.getParameter("email");
		String tel = request.getParameter("fechanac");
		String fechanac = request.getParameter("fechanac");
		String user = request.getParameter("user");
		String password = request.getParameter("password");
		
		per.setDni(dni);
		per.setNombre(nombre);
		per.setApellido(apellido);
		per.setEmail(email);
		per.setTelefono(tel);
		per.setFechanac(fechanac);
		per.setUsername(user);
		per.setPassword(password);
		
		pdao.addUser(per);
		
		response.getWriter().append("Registro completo ").append(per.getNombre()).append(". Bienvenido");
	}

}
