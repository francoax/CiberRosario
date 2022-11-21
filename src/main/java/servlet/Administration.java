package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logic.ControladorDiscount;
import logic.ControladorPc;
import logic.ControladorPrecio;
import logic.ControladorReserva;
import logic.ControladorUser;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;

import data.DataRoles;
import data.DataUsuarios;
import dto.ReserveSpecification;
import dto.UserModificated;
import entities.Computadora;
import entities.Precio;
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
				response.sendError(403);
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
		try {
			switch(path) {
			case "validate" : {
				
				request.getSession().removeAttribute("reservespec");
				
				String code = (String) request.getParameter("code");
				
				if(code.equals("")) {
					request.setAttribute("error", "Por favor, especifique el codigo");
					response.sendError(400);
				} else {
					ReserveSpecification rs = this.ctrl.validate(code);
					if(rs==null) {
						request.setAttribute("error", "Reserva no encontrada");
						response.sendError(400);
					} else {
						request.getSession().setAttribute("reservespec", rs);						
						request.getRequestDispatcher("/WEB-INF/Views/Administration/info.jsp").forward(request, response);
					}
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
			
			case "doreserve" : {
				
				String username = (String) request.getParameter("username");
				String type = (String) request.getParameter("tipo");
				String dia = (String) request.getParameter("reserva_para");
				
				if(username.isEmpty()||type.equals("Tipo")||dia.equals("Dia")) {
					request.setAttribute("error", "Especifique los campos necesarios para realizar la reserva.");
					response.sendError(400);
				} else {
					Usuario user = this.ctrl.getUserByUsername(username);
					if(user!=null) {
						request.getSession().setAttribute("forUser", user);
						request.getRequestDispatcher("reserve/selected").forward(request, response);
					} else {
						request.setAttribute("error", "Username no encontrado.");
						response.sendError(404);
					}
				}
				break;
			}
			
			case "cancel" : {
				
				String code = (String) request.getParameter("cancelcode");
				
				if(code.equals("")){
					request.setAttribute("error", "Especifique el codigo de reserva a cancelar");
					response.sendError(400);
				} else { 
					ReserveSpecification reserve = this.ctrl.cancelarReserva(code);
					if(reserve == null) {
						request.setAttribute("error", "Reserva no encontrada");
						response.sendError(404);
					} else {
						this.ctrl.changeState(reserve.getIdPc(), "disponible");
						request.setAttribute("reserveCanceled", reserve);
						request.getRequestDispatcher("/WEB-INF/Views/Administration/reserveCanceled.jsp").forward(request, response);
					}
				}
				break;	
			}
			
			case "finish" : {
				
				String code = (String) request.getParameter("code");
				
				if(code.isEmpty()) {
					request.setAttribute("error", "Especifique el codigo para concretar reserva");
					response.sendError(400);
				} else {
					this.ctrl.finish(code);
					request.setAttribute("success", "Reserva concretada con exito. Computadora utilizada ya disponible");
					request.getRequestDispatcher("/WEB-INF/Views/Administration/optionSuccess.jsp").forward(request, response);
				}
				
				break;
			}
			
			case "modify" : {
				
				ControladorUser userctrl = new ControladorUser(new DataUsuarios(), new DataRoles());
				String username = (String) request.getParameter("username");
				String rol = (String) request.getParameter("rol");
				
				if(username.isEmpty()||rol.equals("Rol")) {
					request.setAttribute("error", "Modificar Usuario: Por favor, especifique correctamente los campos");
					response.sendError(400);
				} else {
					UserModificated user = userctrl.modify(username, rol);
					if(user==null) {
						request.setAttribute("error", "Usuario no encontrado o ya posee ese rol.");
						response.sendError(404);
					} else {
						request.setAttribute("userModificated", user);
						request.setAttribute("rol", rol);
						request.getRequestDispatcher("/WEB-INF/Views/Administration/userModify.jsp").forward(request, response);
					}
				}
			break;
			}
			
			case "updatediscount" : {
				
				String range = (String) request.getParameter("range");
				String discount = (String) request.getParameter("discount");
				if(range.equals("Rango")||discount.isEmpty()) {
					request.setAttribute("error", "Especifique los campos necesarios para actualizar un descuento.");
					response.sendError(400);
				} else {
					ControladorDiscount desctrl = new ControladorDiscount();
					desctrl.update(range, Integer.parseInt(discount));
					request.getRequestDispatcher("/WEB-INF/Views/Administration/optionSuccess.jsp").forward(request, response);
				}
				
				break;
			}
			
			case "updateprice" : {
				
				String type = (String) request.getParameter("type");
				String price = (String) request.getParameter("price");
				String fecha = (String) request.getParameter("vigencia");
				if(type.equals("Tipo")||price.isEmpty()||fecha.equals("Vigencia")) {
					request.setAttribute("error", "Especifique los campos necesarios para actualizar un precio.");
					response.sendError(400);
				} else {
					ControladorPrecio ctrlpr = new ControladorPrecio();
					Precio precio = new Precio();
					if(fecha.equals("hoy")) {
						precio.setFecha_precio(LocalDate.now());
					} else {
						precio.setFecha_precio(LocalDate.parse(request.getParameter("fechaprecio")));
					}
					precio.setPrecio(Integer.parseInt(price));
					precio.setIdTipoComputadora(type);
					try {
						ctrlpr.update(precio);
						request.getRequestDispatcher("/WEB-INF/Views/Administration/optionSuccess.jsp").forward(request, response);
					} catch (SQLException e) {
						request.setAttribute("error", "El precio ya fue actualizado hoy, espere hasta mañana.");
						response.sendError(400);
					}
				}
				
				break;
			}
			
			case "addpc" : {
				
				Computadora newPc = buildNewPc(request);
				String tipo = (String) request.getParameter("tipo");
				if(newPc!=null&&!tipo.equals("Tipo")) {
					ControladorPc pctrl = new ControladorPc();
					pctrl.add(newPc, tipo);
					request.getRequestDispatcher("/WEB-INF/Views/Administration/optionSuccess.jsp").forward(request, response);
				} else {
					request.setAttribute("error", "Especifique los campos necesarios para registrar una nueva pc");
					response.sendError(400);
				}
				break;
			}
			default: {
				break;
			}
			}
		} catch (IllegalStateException e) {
			response.sendError(500);
		}
	}
	
	private Computadora buildNewPc(HttpServletRequest request) {
		
		Computadora newPc = new Computadora();
		String proce = (String) request.getParameter("proce");
		String mother = (String) request.getParameter("mother");
		String grafica = (String) request.getParameter("grafica");
		String ram = (String) request.getParameter("ram");
		String storage = (String) request.getParameter("storage");
		String[] datos = {proce, mother, grafica, ram, storage};
		for (String dato : datos) {
			if(dato.isEmpty()) {
				return null;
			}
		}
		newPc.setProcesador(proce);
		newPc.setPlaca_madre(mother);
		newPc.setPlaca_de_video(grafica);
		newPc.setRam(ram);
		newPc.setStorage(storage);
		return newPc;
	}

}
