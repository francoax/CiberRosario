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
		Computadora pc = (Computadora) session.getAttribute("pc");
		String para = (String) session.getAttribute("para");
		Reserva r = (Reserva) request.getAttribute("reserva");
		int precioPc = (int) request.getAttribute("precio");
		
	%>
<html>
<jsp:include page="includes/head.html"></jsp:include>
<body>
	<div class="container is-max-desktop mt-6">
		<h1 class="title is-4 has-text-centered"><%=para.toUpperCase() %> computadora <%=pc.getTipo().getDescripcion().toUpperCase() %>.</h1>
		<h2 class="subtitle is-6 has-text-centered">Completa los campos necesarios para poder realizar la reserva.</h2>
		<div class="box">
			<h2><strong>Resumen de reserva</strong></h2>
			<p>Rango horario reservado: desde las <strong><%=r.getHoraDesde() %></strong>, hasta las <strong><%=r.getHoraHasta() %></strong> .</p>
			<p>Precio hora por computadora <strong><%=pc.getTipo().getDescripcion().toUpperCase() %></strong>: $<%=precioPc %></p>
			<p>Total de horas: <%=r.getHoraHasta().getHour()-r.getHoraDesde().getHour()%></p>
			<br>
			<br>
			<p class="has-text-centered">TOTAL A PAGAR: <strong> $<%=r.getImporte() %> </strong> </p>
			<br>
			<p class="is-danger is-5">Una vez confirmada la reserva, se te enviaria un codigo a tu EMAIL con el que te registraste.
			Este codigo se utiliza para poder reclamar tu reserva en el local.</p>
			<form action="save" method="post">
				<div class="buttons is-centered">
					<a class="button is-danger" href="cancel">Cancelar</a>
					<button class="button is-success" >Confirmar</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
<%}%>