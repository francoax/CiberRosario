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
		Reserva rva = (Reserva) session.getAttribute("reserva");
	%>
<html>
<jsp:include page="includes/head.html"></jsp:include>
<body>
		<div class="container is-max-desktop mt-6">
			<h1 class="title is-4 has-text-centered"><%=para.toUpperCase() %> computadora <%=pc.getTipo().getDescripcion().toUpperCase() %>.</h1>
			<h2 class="subtitle is-6 has-text-centered">Completa los campos necesarios para poder realizar la reserva.</h2>
			<div class="box">
				<form action="save" method="get">
				<jsp:include page="pages/reserveHours.jsp"></jsp:include>
				<%if(pc.getTipo().getDescripcion().equals("gamer")) { %>
				<jsp:include page="pages/formgamer.jsp"></jsp:include>
				<%} else if(pc.getTipo().getDescripcion().equals("streamer")) { %>
				<jsp:include page="pages/formstreamer.jsp"></jsp:include>
				<%} else if(pc.getTipo().getDescripcion().equals("workstation")) { %>
				<jsp:include page="pages/formwork.jsp"></jsp:include>
				<%} %>
				<div class="buttons is-right">
					<a href="cancel" class="button is-danger">Cancelar</a>
					<button class="button is-success">Siguiente</button>
				</div>
				</form>
			</div>
		</div>
		<jsp:include page="includes/footer.html"></jsp:include>
</body>
</html>
<%}%>