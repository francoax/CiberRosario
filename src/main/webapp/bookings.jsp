<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	Usuario user = (Usuario) session.getAttribute("user");
    %>
<!DOCTYPE html>
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
	<link rel="stylesheet" type="text/css" href="styles/bulma.min.css">
	<script src="https://www.w3schools.com/lib/w3.js"></script>
</head>
<body>
	<div w3-include-html="menu.jsp"></div>
	<script type="text/javascript">
		w3.includeHTML();
	</script>
	<div class="container">
		<section class="section is-small">
			<h1 class="title is-5">Como reservo ?</h1>
			<p class="pb pb-5">Para reservar, seleccionas el tipo de computadora dependiendo de lo que necesites, mencionas las horas que queres estar y cuando y listo.
								Se te enviara un mail con un codigo para que cuando llegues al local, se lo muestres al recepcionista y este te habilite a utilizarla.</p>
			<h1 class="title is-5">Puedo reservar para dentro de dos dias?</h1>
			<p class="pb pb-5">No. Las reservas unicamente pueden ser para el mismo dia en que lo estas realizando o para el dia siguiente.</p>
			<h1 class="title is-5">Como se abona una reserva?</h1>
			<p class="pb pb-5">Las reservas son abonadas en efectivo en el local, aun si realizaste la reserva de manera online.</p>
			<h1 class="title is-5">Por cuantas horas puedo reservar una computadora?</h1>
			<p class="pb pb-5">Podes reservarla por hasta un maximo de 8 horas en el dia dentro de nuestro horario de apertura y clausura del local.</p>
			<h1 class="title is-5">Entre que horarios puedo reservar?</h1>
			<p class="pb pb-5">Podes reservar entre las 8:00am hasta las 00:00pm de lunes a viernes.</p>
			<div class="buttons">
			<%if(user!=null) {%>
			<form action="reservation" method="get">
				<input type="submit" class="button is-success is-medium" value="Reservar">
			</form>
			<%} else { %>
			<a id="btnRout" class="button is-success is-medium">Reservar</a>
			<div id="msgRout"></div>
			<%}%>
		</div>
		</section>
	</div>
</body>
</html>