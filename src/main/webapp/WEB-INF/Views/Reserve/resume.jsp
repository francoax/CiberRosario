<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="entities.Reserva"%>
<%@page import="entities.Computadora"%>
<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<%
		Usuario user = (Usuario) session.getAttribute("user");
		if(user==null) {
			response.sendRedirect("login.jsp");
		} else {
			String para = (String) session.getAttribute("para");
			String pc = (String) session.getAttribute("pc");
			Reserva r = (Reserva) session.getAttribute("reserva");
			int precioPc = (int) request.getAttribute("precio");
		
		String dateFormat="dd/MM/yyyy";
		DateTimeFormatter format = DateTimeFormatter.ofPattern(dateFormat);
		
	%>
<html>
<jsp:include page="/includes/head.html"></jsp:include>
<body>
	<div class="container is-max-desktop mt-6">
		<h1 class="title is-4 has-text-centered"><%=para.toUpperCase() %> computadora <%=pc.toUpperCase() %>.</h1>
		<h2 class="subtitle is-6 has-text-centered">Fijate si los datos son correctos. Una vez visto, confirma la reserva.</h2>
		<p class="has-background-danger-dark has-text-info-light has-text-centered">ATENCION: <br>Una vez confirmada la reserva, te enviaremos al correo un <strong class="has-text-warning">codigo</strong>
		 que es necesario para reclamar la reserva
		<br></p>
		<br>
		<p class="title is-5 has-text-centered">RESUMEN DE RESERVA</p>
		<table class="table is-fullwidth">
			<thead>
				<tr>
					<th>Computadora</th>
					<%if(para.contains("mañana")){%>
					<th>Fecha reservada</th>
					<%} %>
					<th>Rango de horas</th>
					<th>Cant. de horas</th>
					<th>Costo hora</th>
					<th>Aplica descuento</th>
					<th class="has-text-centered">TOTAL</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=pc.toUpperCase() %></td>
					<%if(para.contains("mañana")){%>
					<td><%=r.getFecha_a_reservar().format(format) %></td>
					<%} %>
					<td><%=r.getHoraDesde() %> a <%=r.getHoraHasta() %></td>
					<td><%=r.getHoraHasta().getHour()-r.getHoraDesde().getHour() %></td>
					<td>$<%=precioPc %></td>
					<%if(r.getHoraHasta().getHour()-r.getHoraDesde().getHour()>=4){ %>
					<td>
						<p class="has-text-success">Si</p>
					</td>
					<%} else {%>
					<td>
						<p class="has-text-danger">No</p>
					</td>
					<%} %>
					<td class="has-text-centered has-text-success has-text-weight-bold">$<%=r.getImporte() %></td>
				</tr>
			</tbody>
		</table>
		<p class="title is-5 has-text-centered">INFORMACIÓN ADICIONAL</p>
		<%if(pc.equals("streamer")) { %>
			<div class="has-text-centered is-size-5">	
				<p>Streamer <strong><%=r.getName_stream() %></strong> en plataforma <strong><%=r.getPlataforma_stream() %></strong> con su stream link <strong><%=r.getLink_stream() %></strong> </p>
			</div>
			
		<%} else if(pc.equals("workstation")) { %>
			<div class="is-size-5">
				<p>Rubro <strong><%=r.getRubro_work() %> </strong> en Empresa <strong><%=r.getEmpresa_work()%></strong> </p>
				<p>Descripcion de trabajo: <strong><%=r.getDescripcion_work() %></strong> </p>
			</div>
		<%} %>
		<br>
		<br>
		<form action="save" method="post">
			<div class="buttons is-centered">
				<a class="button is-danger" href="cancel">Cancelar</a>
				<button id="btn-confirm" type="submit" class="button is-success" >Confirmar</button>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		document.getElementById('btn-confirm').addEventListener('click', ()=>{
			setTimeout(() => {
				document.getElementById('btn-confirm').disabled = true;
			}, 700);
		})
	</script>
</body>
</html>
<%}%>