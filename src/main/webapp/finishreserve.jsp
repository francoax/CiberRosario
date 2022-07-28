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
		Reserva r = (Reserva) session.getAttribute("reserva");
		
	%>
<html>
<jsp:include page="include/head.html"></jsp:include>
<body>
		<div class="container is-max-desktop mt-6">
			<h1 class="title is-4 has-text-centered"><%=para.toUpperCase() %> computadora <%=pc.getTipo().getDescripcion().toUpperCase() %>.</h1>
			<h2 class="subtitle is-6 has-text-centered">Da click a <strong>Reservar </strong> para finalizar la reserva.</h2>
				<label class="label">Rango horario reservado: </label>
				<p class="subtitle is-5"> <strong>Desde:</strong> <%=r.getHoraDesde() %> <strong>hasta</strong> <%=r.getHoraHasta() %></p>
				<p class="">Total: $<%=r.getImporte() %></p>
			<form action="save" method="post" class="box">
				<div class="buttons is-right">
					<a href="save" class="button is-warning">Volver</a>
					<a href="cancel" class="button is-danger">Cancelar</a>
					<button class="button is-success" type="submit">Reservar</button>
				</div>
			</form>
		</div>
		<jsp:include page="include/footer.html"></jsp:include>
</body>
</html>
<%}%>