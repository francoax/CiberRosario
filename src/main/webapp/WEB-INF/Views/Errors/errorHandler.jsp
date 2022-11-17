<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true"  %>
<!DOCTYPE html>
<html>
	<jsp:include page="/includes/head.html"></jsp:include>
<body>
	<div class="notification">
		<div class="content">
			<p class="is-size-6">Situación: <strong><%=request.getAttribute("error") %></strong></p>
			<br>
			<% String requested = pageContext.getErrorData().getRequestURI();
			
			if(requested.contains("admin")){ %>
				<a href="<%=request.getContextPath()+"/admin"%>">Volver a administracion</a>
			<%}
			if(requested.contains("user/login")){%>
				<a href="<%=request.getContextPath()+"/login.jsp"%>">Reintentar</a>
			<%}%>
		</div>
	</div>
	<p><%=pageContext.getErrorData().getRequestURI() %></p>
</body>
</html>