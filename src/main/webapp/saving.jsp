<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<%
		Usuario user = (Usuario) session.getAttribute("user");
		if(user==null) {
			response.sendRedirect("login.jsp");
		} else {
	%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<%}%>