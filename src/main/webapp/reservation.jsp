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
		int amountg = (int) request.getAttribute("amountg");
		int amounts = (int) request.getAttribute("amounts");
		int amountw = (int) request.getAttribute("amountw");
		Computadora g = (Computadora) request.getAttribute("gpc");
		Computadora s = (Computadora) request.getAttribute("spc");
		Computadora w = (Computadora) request.getAttribute("wpc");
	%>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="CiberRosario">
	<meta name="description" content="CiberRosario es una empresa dedicada a brindar el servicio de computadoras para jugar, desarrollar y stremear.">
	<meta name="keywords" content="ciber, rosario ciber, computadora ciber, ciber computadora, ciber torneo">
	<meta name="copyright" content="CiberRosario inc.">
	<title>CiberRosario</title>
	<link rel="icon" href="images/pc.gif">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
    <script src="https://www.w3schools.com/lib/w3.js"></script>
</head>
<body>
	<div w3-include-html="menu.jsp"></div>
	<script type="text/javascript">
		w3.includeHTML();
	</script>
	<div class="container mt mt-4">
		<div class="columns ">
			<div class="column">
				<div class="container m m-2 p p-2" style="border: 2px solid black; border-radius: 10px;">
					<h1 class="title is-5 has-text-centered">GAMER</h1>
						<div class="is-family-code has-text-centered">
							<p > <strong>Procesador</strong> </p>
							<p class="pb pb-5"><%=g.getProcesador().toUpperCase() %></p>
							<p > <strong>Placa de video</strong> </p>
							<p class="pb pb-5"><%=g.getPlaca_de_video().toUpperCase() %></p>
							<p > <strong>Placa madre</strong> </p>
							<p class="pb pb-5""><%=g.getPlaca_madre().toUpperCase() %></p>
							<p > <strong>RAM</strong> </p>
							<p class="pb pb-5"><%=g.getRam().toUpperCase() %></p>
							<p > <strong>Almacenamiento</strong> </p>
							<p class="pb pb-5"><%=g.getStorage().toUpperCase() %></p>
							<%if(amountg>=10){ %> <p class="is-5" style="color:green;"><%=amountg %> disponibles</p>
							<%} else if(amountg<10&&amountg>=5){ %> <p class="is-5" style="color:#DC7633  ;"><%=amountg %> disponibles</p>
							<%} else if(amountg<5&&amountg>0){ %> <p class="is-5" style="color: red;"><%=amountg %> disponibles</p>
							<%} else { %> <p style="color:red; font-size: 12px;"> No hay disponibles</p>
							<%} %>
							<%if(amountg!=0){ %>
							<div class="mt mt-5">
								<form action="reservation" method="post">
									<input type="submit" class="button has-text-white is-rounded" name="for" style="background-color: #2E4053; " value="Reservar para hoy">	
									<input type="submit" class="button has-text-white is-rounded" name="for" style="background-color: #4D5656 ;" value="Reservar para mañana">	
									<input type="hidden" name="tipo" value="gamer">
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
			<div class="column">
				<div class="container m m-2 p p-2" style="border: 2px solid black; border-radius: 10px;">
					<h1 class="title is-5 has-text-centered">STREAMER</h1>
						<div class="is-family-code has-text-centered">
							<p > <strong>Procesador</strong> </p>
							<p class="pb pb-5"><%=s.getProcesador().toUpperCase() %></p>
							<p > <strong>Placa de video</strong> </p>
							<p class="pb pb-5"><%=s.getPlaca_de_video().toUpperCase() %></p>
							<p > <strong>Placa madre</strong> </p>
							<p class="pb pb-5"><%=s.getPlaca_madre().toUpperCase() %></p>
							<p > <strong>RAM</strong> </p>
							<p class="pb pb-5"><%=s.getRam().toUpperCase() %></p>
							<p > <strong>Almacenamiento</strong> </p>
							<p class="pb pb-5"><%=s.getStorage().toUpperCase() %></p>
							<%if(amounts>=10){ %> <p class="is-5" style="color:green;"><%=amounts %> disponibles</p>
							<%} else if(amounts<10&&amounts>=5){ %> <p class="is-5" style="color:#DC7633 ;"><%=amounts %> disponibles</p>
							<%} else if(amounts<5&&amounts>0){ %> <p class="is-5" style="color: red;"><%=amounts %> disponibles</p>
							<%} else { %> <p style="color:red; font-size: 12px;"> No hay disponibles</p>
							<%} %>
							<%if(amounts!=0){ %>
							<div class="mt mt-5">
								<form action="reservation" method="post">
									<input type="submit" class="button has-text-white is-rounded" name="for" style="background-color: #2E4053; " value="Reservar para hoy">	
									<input type="submit" class="button has-text-white is-rounded" name="for" style="background-color: #4D5656 ;" value="Reservar para mañana">	
									<input type="hidden" name="tipo" value="streamer">
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
			<div class="column">
				<div class="container m m-2 p p-2" style="border: 2px solid black; border-radius: 10px;">
					<h1 class="title is-5 has-text-centered">WORKSTATION</h1>
						<div class="is-family-code has-text-centered">
							<p > <strong>Procesador</strong> </p>
							<p class="pb pb-5"><%=w.getProcesador().toUpperCase() %></p>
							<p > <strong>Placa de video</strong> </p>
							<p class="pb pb-5"><%=w.getPlaca_de_video().toUpperCase() %></p>
							<p > <strong>Placa madre</strong> </p>
							<p class="pb pb-5"><%=w.getPlaca_madre().toUpperCase() %></p>
							<p > <strong>RAM</strong> </p>
							<p class="pb pb-5"><%=w.getRam().toUpperCase() %></p>
							<p > <strong>Almacenamiento</strong> </p>
							<p class="pb pb-5"><%=w.getStorage().toUpperCase() %></p>
							<%if(amountw>=10){ %> <p class="is-5" style="color:green;"><%=amountw %> disponibles</p>
							<%} else if(amountw<10&&amountw>=5){ %> <p class="is-5" style="color:#DC7633 ;"><%=amountw %> disponibles</p>
							<%} else if(amountw<5&&amountw>0){ %> <p class="is-5" style="color: red;"><%=amountw %> disponibles</p>
							<%} else { %> <p style="color:red; font-size: 12px;"> No hay disponibles</p>
							<%} %>
							<%if(amountw!=0){ %>
							<div class="mt mt-5">
								<form action="reservation" method="post">
									<input type="submit" class="button has-text-white is-rounded" name="for" style="background-color: #2E4053; " value="Reservar para hoy">	
									<input type="submit" class="button has-text-white is-rounded" name="for" style="background-color: #4D5656 ;" value="Reservar para mañana">	
									<input type="hidden" name="tipo" value="workstation">
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
		</div>
	</div>
</body>
</html>
<%}%>