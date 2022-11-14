<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<jsp:include page="/includes/head.html"></jsp:include>
<body>

	<div class="notification">
		<div class="content">
			<p class="is-size-6">Situación: <strong><%=request.getAttribute("error") %></strong></p>
			<br>
			<a href="/CiberRosario/admin">Regresar a administracion</a>
		</div>
	</div>
</body>
</html>