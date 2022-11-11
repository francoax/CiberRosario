package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.ControladorReserva;

import java.io.IOException;

import dto.ReserveSpecification;
import entities.Reserva;
import entities.Usuario;

/**
 * Servlet implementation class AdminConnect
 */
public class Administration extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final ControladorReserva ctrl = new ControladorReserva(); 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Administration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(request.getSession(false) != null) {
			
			Usuario user = (Usuario) request.getSession(false).getAttribute("user");
			
			if(user == null) {
				response.sendRedirect("./login.jsp");
			} else if (user.getRol().getIdRol()==2) {
				request.getRequestDispatcher("/WEB-INF/Views/Administration/admin.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("/WEB-INF/Views/Errors/autherror.jsp");
			}
		} else {
			response.sendRedirect("./login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String path = (String) request.getPathInfo().substring(1);
		Usuario user = (Usuario) request.getSession().getAttribute("user");
		try {
			switch(path) {
			case "validate" : {
				
				String code = (String) request.getParameter("code");
				System.out.println("codigo: "+code);
				
				if(code.equals("")) {
					request.setAttribute("error", "Por favor, especifique el codigo");
					request.getRequestDispatcher("/WEB-INF/Views/Administration/admin.jsp").include(request, response);
				}
				
				ReserveSpecification rs = this.ctrl.validate(code);
				
				if(rs==null) {
					request.setAttribute("error", "Reserva no encontrada");
					request.getRequestDispatcher("/WEB-INF/Views/Administration/info.jsp").include(request, response);
				} else {
				
				request.getSession().setAttribute("reservespec", rs);
				
				request.getRequestDispatcher("/WEB-INF/Views/Administration/info.jsp").forward(request, response);
				}
			
				break;
			}
			case "confirm" : {
				
				ReserveSpecification rs = (ReserveSpecification) request.getSession().getAttribute("reservespec");
				this.ctrl.confirm(rs.getCode());
				request.getSession().removeAttribute("reservespec");
				request.setAttribute("reservespec", rs);	
				request.getRequestDispatcher("/WEB-INF/Views/Administration/confirmed.jsp").forward(request, response);
				break;
			}
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		}
	}

}
