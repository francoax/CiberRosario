<%@page import="java.time.LocalTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<%
		String para = (String) session.getAttribute("para");
		LocalTime actual = LocalTime.now();
		int hactual = actual.getHour();
		int[] horas = {8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
	%>
<html>
<body>
		<%if(para.contains("hoy")){%>
				<label class="label">Indique hora desde y hora hasta</label>
				<%if(request.getAttribute("msghour")!=null){ %>
				<p style="color: red;" >${msghour}</p>
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
				<label class="label">Indique hora desde y hora hasta</label>
				<%if(request.getAttribute("msghour")!=null){ %>
				<p style="color: red;" >${msghour}</p>
				<%} %>
				<div class="field">
					<div class="select">
						<select name="horadesde">
							<option selected>Desde</option>
							<%
							for (int i : horas) {
								if(i<23) {
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
								if(j>8) {
									LocalTime hhasta = LocalTime.of(j, 0);
									%> <option value="<%=hhasta %>" ><%=hhasta %></option> <%
								}
							}%>
						</select>
					</div>
				</div>
			<%} %>
</body>
</html>