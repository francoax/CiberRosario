package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.ControladorUser;

import java.io.IOException;
import java.util.LinkedList;

import data.DataRoles;
import data.DataUsuarios;
import dto.UserReserves;
import entities.Usuario;

/**
 * Servlet implementation class ListReserveUser
 */
public class ListReserveUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListReserveUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ControladorUser ctrl = new ControladorUser(new DataUsuarios(), new DataRoles());
		Usuario user = (Usuario) request.getSession().getAttribute("user");
		LinkedList<UserReserves> list = ctrl.getReserves(user);
		request.setAttribute("userreserve", list);
		request.getRequestDispatcher("/WEB-INF/Views/User/reservesByUser.jsp").include(request, response);
	}

}
