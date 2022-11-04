<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<%@ include file="../includes/head.html" %>
	
	<script type="text/javascript">
		
		currentIdVisible = "";
		const ids = ['vr', 'rr', 'cr'];
		
		function showOption(id) {
			var element = document.getElementById(id);
			element.classList.remove("is-sr-only");
			currentIdVisible = id;
			isVisible();
		}
		function isVisible() {
			for (let id of ids) {
				var element = document.getElementById(id);
				if(!element.classList.contains("is-sr-only") && currentIdVisible != id) {
					element.classList.toggle("is-sr-only");
				}
			}
		}
	</script>
	
	<%String inform = (String) request.getAttribute("inform");%>
	
<body>
	<header class="container mt-6" style="border-bottom: 25px; border-bottom-color: black;">
	<h1 class="title has-text-centered m-2"> <a href="administration">CiberRosario - Administracion</a> </h1>
		<nav class="navbar" role="navigation" aria-label="main navigation">
			<div class="navbar-menu" style="border-bottom: 2px solid black;">
				<div class="navbar-start"></div>
					<a class="navbar-item is-size-5" onclick="showOption('vr')">Validar reserva</a>
					<a class="navbar-item is-size-5" onclick="showOption('rr')">Registrar reserva</a>
					<a class="navbar-item is-size-5" onclick="showOption('cr')">Cancelar reserva</a>
					<a class="navbar-item is-size-5" href="./index.jsp"> <strong>SALIR</strong> </a>
				<div class="navbar-end"></div>
			</div>
		</nav>
	</header>
	<div class="m-6">
		<div id="vr" class="is-sr-only">
			<jsp:include page="options/validatereserve.jsp"></jsp:include>
		</div>
		<div id="rr" class="is-sr-only">
			<jsp:include page="options/doreserve.jsp"></jsp:include>
		</div>
		<div id="cr" class="is-sr-only">
			<jsp:include page="options/cancelreserve.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>