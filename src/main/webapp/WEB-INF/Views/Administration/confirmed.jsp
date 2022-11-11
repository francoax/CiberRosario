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
	<h1>Reserva confirmada. Informe al cliente que la computadora con ID: <%=reserve.getIdPc() %> esta habilitada.</h1>
	<a class="button is-warning" href="../admin">Volver a administracion</a>
</body>
</html>