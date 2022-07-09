package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.Login;

import java.io.IOException;
import java.util.Objects;

import entities.Persona;

/**
 * Servlet implementation class Signin
 */
public class Signin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signin() {
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
		
		Persona p = new Persona();
		Login ctrlLogin = new Login();
		String user = request.getParameter("user");
		String password = request.getParameter("password");
		
		p.setUsername(user);
		p.setPassword(password);
		
		p=ctrlLogin.validarPersona(p);
		
		if(Objects.isNull(p)){
			response.getWriter().append("No existe el usuario");
		}
		else {
		response.getWriter().append("Bienvenido ").append(p.getNombre()).append(" ").append(p.getApellido());
		}
		
		
	}

}
