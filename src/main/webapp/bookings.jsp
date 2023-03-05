<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	Usuario user = (Usuario) session.getAttribute("user");
    %>
<!DOCTYPE html>
<html>
<jsp:include page="includes/head.html"></jsp:include>
<body>
	<jsp:include page="includes/header.jsp"></jsp:include>
	<p class="title is-5 is-danger">${error}</p>
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
			<p class="pb pb-5">Podes reservarla la cantidad de horas que quieras, dentro de nuestros horarios de atencion.</p>
			<h1 class="title is-5">Hay descuentos por reservar varias horas? </h1>
			<p class="pb pb-5">Si. Los descuentos aplican a reservas mayores a 2 horas en adelante.</p>
			<h1 class="title is-5">Entre que horarios puedo reservar?</h1>
			<p class="pb pb-5">Podes reservar de 8:00 de la mañana a 23:00 de la noche de lunes a viernes.</p>
			<div class="buttons">
			<%if(user!=null) {%>
			<form action="reserve/start" method="get">
				<input type="submit" class="button is-success is-medium" value="Reservar">
			</form>
			<%} else { %>
			<a id="btnRout" class="button is-success is-medium">Reservar</a>
			<div class="msgReserve"></div>
			<%}%>
		</div>
		</section>
	</div>
	<script type="text/javascript">
	
	const btn = document.getElementById('btnRout');
	const msg = document.querySelector('.msgReserve');
	btn.addEventListener('click', ()=> {
	    if(<%=user%> == null) {
	    	msg.textContent = 'Debe iniciar sesion.';
	    	msg.style = 'color: red';
	    };
	    setTimeout(() => {
	        msg.textContent = '';
	    }, 3000);
	})
		
	</script>
	<jsp:include page="includes/footer.html"></jsp:include>
</body>
</html>