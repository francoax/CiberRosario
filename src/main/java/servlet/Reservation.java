package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import logic.Pclogic;
import logic.Tpclogic;

import java.io.IOException;
import java.util.Enumeration;
import java.util.LinkedList;

import com.mysql.cj.Session;

import data.TpcDao;
import entities.Computadora;
import entities.Usuario;

/**
 * Servlet implementation class Reservation
 */
public class Reservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Reservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Intencion: Conseguir la cantidad de computadoras disponibles de cada tipo.
		try {
			Pclogic pctrl = new Pclogic();
			Tpclogic tctrl = new Tpclogic();
			Computadora g = new Computadora();
			Computadora s = new Computadora();
			Computadora w = new Computadora();
			g = pctrl.getOne(tctrl.getOne("gamer"));
			s = pctrl.getOne(tctrl.getOne("streamer"));
			w = pctrl.getOne(tctrl.getOne("workstation"));
			int amountg = pctrl.getAmountavailable(tctrl.getOne("gamer"));
			int amounts = pctrl.getAmountavailable(tctrl.getOne("streamer"));
			int amountw = pctrl.getAmountavailable(tctrl.getOne("workstation"));
			System.out.println("g: "+amountg+" "+"s: "+amounts+" "+" w: "+amountw+"gamer: "+g.getProcesador()+" "+"streamer: "+s.getProcesador()+" "+"workstation: "+w.getProcesador());
			request.setAttribute("gpc", g);
			request.setAttribute("spc", s);
			request.setAttribute("wpc", w);
			request.setAttribute("amountg", amountg);
			request.setAttribute("amounts", amounts);
			request.setAttribute("amountw", amountw);
			request.getRequestDispatcher("reservation.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("nulo", 0);
			response.sendRedirect("index.jsp");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Usuario user = (Usuario) request.getSession().getAttribute("user");
		if(user!=null) {
		try {
			Pclogic pctrl = new Pclogic();
			Tpclogic tpctrl = new Tpclogic();
			Computadora pc = new Computadora();
			String tipo = request.getParameter("tipo");
			String para = request.getParameter("for");
			pc = pctrl.selectToReserve(tpctrl.getOne(tipo));
			pctrl.changeMood(pc, "seleccionada");
			request.setAttribute("pc", pc);
			request.setAttribute("para", para);
			request.getRequestDispatcher("saving.jsp").forward(request, response);
		} catch (Exception e) {
			request.setAttribute("error", "Ya no existen computadoras disponibles de este tipo. Disculpe las molestias.");
			response.sendRedirect("bookings.jsp");
		}
		}else {
			response.sendRedirect("login.jsp");
		}
	}

}
