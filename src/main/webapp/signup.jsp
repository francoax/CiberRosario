<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	boolean cond;
	Usuario user = (Usuario) session.getAttribute("user");
	if(user!=null&&user.getRol().getIdRol()==2) {
		cond = true;
	} else {
		cond = false;
	}
%>
<html>
<jsp:include page="include/head.html"></jsp:include>
<body>
			<form action="signup" method="post" >
				
			</form>
</body>
</html>