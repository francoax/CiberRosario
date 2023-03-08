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
		String pc = (String) session.getAttribute("pc");
		String para = (String) session.getAttribute("para");
	%>
<html>
<jsp:include page="/includes/head.html"></jsp:include>
<body>
		<div class="container is-max-desktop mt-6">
			
			<h2 class="subtitle is-6 has-text-centered">Completa los campos necesarios para poder realizar la reserva.</h2>
			<div class="box">
				<form action="resume" method="post">
				<jsp:include page="reserveHours.jsp"></jsp:include>
				<%if(pc.equals("gamer")) { %>
				<jsp:include page="formgamer.jsp"></jsp:include>
				<%} else if(pc.equals("streamer")) { %>
				<jsp:include page="formstreamer.jsp"></jsp:include>
				<%} else if(pc.equals("workstation")) { %>
				<jsp:include page="formwork.jsp"></jsp:include>
				<%} %>
				<div class="buttons is-right">
					<a href="cancel" class="button is-danger">Cancelar</a>
					<button class="button is-success">Siguiente</button>
				</div>
				</form>
			</div>
		</div>
		<jsp:include page="/includes/footer.jsp"></jsp:include>
</body>
</html>
<%}%>