<%@page import="entities.Usuario"%>
<%@page import="entities.Computadora"%>
<%@page import="java.time.LocalTime"%>
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
		LocalTime actual = LocalTime.now();
		int hactual = actual.getHour();
		int[] horas = {8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
	%>
<html>
<body>
	<div class="container">
		<%if(para.contains("hoy")){%>
		<h1 class="title is-5">Reserva por computadora <%=pc.getTipo().getDescripcion().toUpperCase() %> para HOY</h1>
		<div class="container">
				<label class="label">Indique hora desde y hora hasta</label>
				<%if(request.getAttribute("msgerror")!=null){ %>
				<p style="color: red;" >${msgerror}</p>
				<%} %>
				<div class="field">
					<div class="select">
						<select name="horadesde">
							<option selected>Desde</option>
							<%
							for (int i : horas) {
								if(hactual<=i&&i!=23) {
									LocalTime hdesde = LocalTime.of(i, 0);
									%> <option value="<%=hdesde %>"><%=hdesde %></option> <%
								}
							}%>
						</select>
					</div>
					<div class="select">
						<select name="horahasta">
							<option selected>Hasta</option>
							<%
							for (int j : horas){
								if(hactual<j){
									LocalTime hhasta = LocalTime.of(j, 0);
									%> <option value="<%=hhasta %>" ><%=hhasta %></option> <%
								}
							}
							%>
						</select>
					</div>
				</div>
			<%} else { %>
			<h1 class="title is-5">Reserva por computadora <%=pc.getTipo().getDescripcion().toUpperCase() %> para MAÑANA</h1>
				<label class="label">Indique hora desde y hora hasta</label>
				<p style="color: red;" >${msgerror}</p>
				<div class="field">
					<div class="select">
						<select name="horadesde">
							<option selected>Desde</option>
							<%
							for (int i : horas) {
								LocalTime hdesde = LocalTime.of(i, 0);
								%> <option value="<%=hdesde %>"><%=hdesde %></option> <%
							}%>
						</select>
					</div>
					<div class="select">
						<select name="horahasta">
							<option selected>Hasta</option>
							<%
							for (int j : horas){
								LocalTime hhasta = LocalTime.of(j, 0);
								%> <option value="<%=hhasta %>" ><%=hhasta %></option> <%
							}
							%>
						</select>
					</div>
				</div>
			<%} %>
		</div>
	</div>
</body>
</html>
<%}%>