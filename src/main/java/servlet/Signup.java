package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import logic.Rollogic;
import logic.Userlogic;

import java.io.IOException;
import java.time.LocalDate;

import entities.Rol;
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

//		request.getSession().getAttribute("user");
		request.getRequestDispatcher("./signup.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Casteo todos los parametros
			
			Usuario u = new Usuario();
			Userlogic uctrl = new Userlogic();
			String email = request.getParameter("email");
			u.setEmail(email);
			//Verifico si ese usuario ya existe. Si no es nulo, mando mensaje y redirijo. Si es nulo, quiere decir que no existe, entonces registro.
			if(uctrl.validateExist(u)!=null) {
				request.setAttribute("msg", "El mail ingresado ya esta asociado a una cuenta.");
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			} else {
				String password = request.getParameter("password");
				String nombre = request.getParameter("nombre");
				String apellido = request.getParameter("apellido");
				String dni = request.getParameter("dni");
				LocalDate fechanac = LocalDate.parse(request.getParameter("fechanac"));
				String tel = request.getParameter("tel");
				String user = request.getParameter("user");
				String typeuser = request.getParameter("typeuser");
					
				Rol r = new Rol();
				Rollogic rctrl = new Rollogic();
				// Mapeo los parametros
				u.setPassword(password);
				u.setNombre(nombre);
				u.setApellido(apellido);
				u.setDni(dni);
				u.setFecha_nacimiento(fechanac);
				u.setTelefono(tel);
				u.setUsername(user);
				// En caso de que sea el administrador quien defina el usuario, verifico.
				if(typeuser!=null) {
					r = rctrl.getRol(typeuser);
					u.setRol(r);
				} else { // Si quien esta creando una cuenta es alguien completamente nuevo.
					r = rctrl.getRol("user");
					u.setRol(r);
				}
				// Agrego al usuario con todos los datos.
				uctrl.adduser(u);
				request.setAttribute("msg", "Registro completado");
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
	}

}
