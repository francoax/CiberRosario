<%@page import="dto.ReserveSpecification"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
	<%
		ReserveSpecification reserve = (ReserveSpecification) request.getAttribute("reservespec");
	%>
<html>
	<jsp:include page="/includes/head.html"></jsp:include>
<body>
	<div class="notification is-success">
		<h1 class="title">Reserva confirmada con éxito!</h1>
		<p class="subtitle">Informe al cliente que la computadora <%=reserve.getIdPc() %> fue habilitada.</p>
		<br>

		<a class="button is-warning" href="../admin">Volver a administracion</a>
	</div>
</body>
</html>