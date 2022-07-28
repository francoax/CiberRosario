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
		
	%>
<html>
<jsp:include page="include/head.html"></jsp:include>
<body>
		<div class="container is-max-desktop mt-6">
			<h1 class="title is-4 has-text-centered"><%=para.toUpperCase() %> computadora <%=pc.getTipo().getDescripcion().toUpperCase() %>.</h1>
			<h2 class="subtitle is-6 has-text-centered">Completa los campos necesarios para poder realizar la reserva.</h2>
			<form action="save" method="get" class="box">
				<jsp:include page="include/reserveHours.jsp"></jsp:include>
				<%if(pc.getTipo().getDescripcion().equals("gamer")) { %>
				<jsp:include page="include/formgamer.jsp"></jsp:include>
				<%} else if(pc.getTipo().getDescripcion().equals("streamer")) { %>
				<jsp:include page="include/formstreamer.jsp"></jsp:include>
				<%} else if(pc.getTipo().getDescripcion().equals("workstation")) { %>
				<jsp:include page="include/formwork.jsp"></jsp:include>
				<%} %>
				<div class="buttons is-right">
					<a href="cancel" class="button is-danger">Cancelar</a>
					<button class="button is-success" type="submit">Siguiente</button>
				</div>
			</form>
		</div>
		<jsp:include page="include/footer.html"></jsp:include>
</body>
</html>
<%}%>