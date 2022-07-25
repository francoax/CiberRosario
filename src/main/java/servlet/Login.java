package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import logic.Userlogic;

import java.io.IOException;
import java.sql.SQLException;

import entities.Usuario;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
			Usuario user = new Usuario();
			Userlogic uctrl = new Userlogic();
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			user.setEmail(email);
			user.setPassword(password);
			
			user = uctrl.validateuser(user);
			// Valido si existe el usuario. Si no es nulo, guardo session y redirijo.
			if(user!=null) {
				request.getSession(true).setAttribute("user", user);
				request.getSession().setMaxInactiveInterval(300);
				response.sendRedirect("index.jsp");
			} else {
				request.setAttribute("error", "Usuario y/o contraseña incorrectos.");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
