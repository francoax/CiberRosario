<%@page import="dto.UserModificated"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%UserModificated user = (UserModificated) request.getAttribute("userModificated");
    String rol = (String) request.getAttribute("rol");%>
    
<!DOCTYPE html>
<html>
	<jsp:include page="/includes/head.html"></jsp:include>
<body>
	<div class="container" style="margin-top: 20px;">
		<div class="notification">
			<div class="content">
				<div class="has-text-centered is-size-6">
					<p>Usuario: <strong><%=user.getName()+" "+user.getLastname() %></strong> con Username: <strong><%=user.getUsername().toUpperCase() %></strong> </p>
					<br>
					<p>Rol <%=user.getRol().toUpperCase() %> cambiado con exito a <%=rol.toUpperCase() %> </p>
				</div>
			</div>
			<div class="buttons is-centered">
				<a class="button is-warning" href="<%=request.getContextPath()+"/admin"%>">Regresar</a>
			</div>
		</div>
	</div>
</body>
</html>