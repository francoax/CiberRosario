package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import logic.ControladorUser;

import java.io.IOException;
import java.time.LocalDate;

import data.DataRoles;
import data.DataUsuarios;
import entities.Usuario;

/**
 * Servlet implementation class User
 */
public class UserConnection extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ControladorUser ctrl = new ControladorUser(new DataUsuarios(), new DataRoles());
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserConnection() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String path = (String) request.getPathInfo().substring(1);
		
		switch(path) {
		
		case "signup" : {
				Usuario newUser = build(request);
				if(newUser!=null) {
					this.ctrl.add(newUser);
					request.setAttribute("msg", "Se ha registrado con exito");
					request.getRequestDispatcher("/signup.jsp").include(request, response);
				} else {
					request.setAttribute("error", "El mail ya esta registrado.");
					response.sendError(400);
				}
				break;
		}
		case "login" : {
				Usuario user = new Usuario();
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				
				user.setEmail(email);
				user.setPassword(password);
				
				user = this.ctrl.validate(user);
				if(user!=null) {
					request.getSession(true).setAttribute("user", user);
					response.sendRedirect(request.getContextPath()+"/index.jsp");
				} else {
					request.setAttribute("error", "Usuario y/o contraseña incorrectos.");
					response.sendError(400);
				}
			break;
		}
		
		case "logout" : {
				HttpSession session = request.getSession(); 
				session.removeAttribute("user");
				session.invalidate();
				response.sendRedirect("../index.jsp");
			break;
		}
		}
		
	}
	
	private Usuario build (HttpServletRequest request) {
		
		Usuario newUser = new Usuario();
		String email = (String) request.getParameter("email");
		newUser.setEmail(email);
		if(this.ctrl.exist(newUser)) {
			return null;
		} else {
			newUser.setNombre(request.getParameter("name"));
			newUser.setApellido(request.getParameter("lastname"));
			newUser.setDni(request.getParameter("dni"));
			newUser.setFecha_nacimiento(LocalDate.parse(request.getParameter("fechanac")));
			newUser.setTelefono(request.getParameter("tel"));
			newUser.setUsername(request.getParameter("username"));
			newUser.setPassword(request.getParameter("password"));
			newUser.setRol(ctrl.getRol("user"));
			return newUser;
		}
	}

}
