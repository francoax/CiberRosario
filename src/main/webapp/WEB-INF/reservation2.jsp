<%@page import="java.util.LinkedList"%>
<%@page import="java.util.HashMap"%>
<%@page import="entities.PCDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="entities.Computadora"%>
<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<%
		Usuario user = (Usuario) session.getAttribute("user");
		if (user==null) {
			response.sendRedirect("login.jsp");
		} else {
		LinkedList<PCDto> pcs = (LinkedList<PCDto>) request.getAttribute("pcs");
	%>
<html>
<jsp:include page="../includes/head.html"></jsp:include>
<body>
	<div class="container mt mt-4">
		<h1 class="title is-5">Seleccione el tipo de computadora.</h1>
		<div class="columns ">
		<%for(PCDto pc : pcs) {
		int amount = pc.getAmount();%>
			<div class="column">
				<div class="container m m-2 p p-2" style="border: 2px solid black; border-radius: 10px;">
					<h1 class="title is-5 has-text-centered"><%=pc.getType().getDescripcion().toUpperCase() %></h1>
						<div class="is-family-code has-text-centered">
							<p > <strong>Procesador</strong> </p>
							<p class="pb pb-5"><%=pc.getCore().toUpperCase() %></p>
							<p > <strong>Placa de video</strong> </p>
							<p class="pb pb-5"><%=pc.getVideocard().toUpperCase() %></p>
							<p > <strong>Placa madre</strong> </p>
							<p class="pb pb-5"><%=pc.getMotherboard().toUpperCase() %></p>
							<p > <strong>RAM</strong> </p>
							<p class="pb pb-5"><%=pc.getRam().toUpperCase() %></p>
							<p > <strong>Almacenamiento</strong> </p>
							<p class="pb pb-5"><%=pc.getStorage().toUpperCase() %></p>
							< %><%if(amount>=10){ %> <p class="is-5" style="color:green;"><%=amount %> disponibles</p>
							<%} else if(amount<10&&amount>=5){ %> <p class="is-5" style="color:#DC7633  ;"><%=amount %> disponibles</p>
							<%} else if(amount<5&&amount>0){ %> <p class="is-5" style="color: red;"><%=amount %> disponibles</p>
							<%} else { %> <p style="color:red; font-size: 12px;"> No hay disponibles</p>
							<%} %>
							<%if(amount!=0){ %>
							<div class="mt mt-5">
								<form action="reservation" method="post">
									<input type="submit" class="button has-text-white is-rounded" name="for" style="background-color: #2E4053; " value="Reservar para hoy">	
									<input type="submit" class="button has-text-white is-rounded" name="for" style="background-color: #4D5656 ;" value="Reservar para mañana">	
									<input type="hidden" name="tipo" value="<%pc.getType().getDescripcion();%>>">
								</form>
							</div>
							<%} else {%>
							<div class="mt mt-5">
								<input type="button" class="button is-success is-rounded" title="Disabled button" disabled value="Deshabilitado">
							</div>
							<%} %>
						</div>
				</div>
			</div>
		<%} %>
		</div>
	</div>
</body>
</html>
<%}%>