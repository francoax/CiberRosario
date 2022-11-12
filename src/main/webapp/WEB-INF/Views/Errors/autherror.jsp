<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Error</title>
<% String path = (String) request.getAttribute("path");%>
</head>
<body>
	<div>
		<p>Usted no posee autorizacion para entrar en este sitio.</p>
		<%if(path==null){ %>
		<a href="./index.jsp">Volver a mi lugar feliz.</a>
		<%} else { %>
		<a href="../index.jsp">Volver a mi lugar feliz</a>
		<%} %>
	</div>
</body>
</html>