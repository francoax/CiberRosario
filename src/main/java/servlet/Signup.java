package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.ControladorUser;

import java.io.IOException;
import java.time.LocalDate;

import entities.Usuario;

/**
 * Servlet implementation class Signup
 */
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ControladorUser ctrluser;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Signup( final ControladorUser ctrluser ) {
        super();
        this.ctrluser = ctrluser;
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
			String email = request.getParameter("email");
			u.setEmail(email);
			//Verifico si ese usuario ya existe. Si no es nulo, mando mensaje y redirijo. Si es nulo, quiere decir que no existe, entonces registro.
			if(ctrluser.exist(u)!=null) {
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
				// Mapeo los parametros
				u.setPassword(request.getParameter("password"));
				u.setNombre(request.getParameter("nombre"));
				u.setApellido(request.getParameter("apellido"));
				u.setDni(request.getParameter("dni"));
				u.setFecha_nacimiento(fechanac);
				u.setTelefono(tel);
				u.setUsername(user);
				// En caso de que sea el administrador quien defina el usuario, verifico.
				if(typeuser!=null) {
					u.setRol(ctrluser.getRol(typeuser));
				} else { // Si quien esta creando una cuenta es alguien completamente nuevo.
					u.setRol(ctrluser.getRol("user"));
				}
				// Agrego al usuario con todos los datos.
				ctrluser.add(u);
				request.setAttribute("msg", "Registro completado");
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
	}

}
