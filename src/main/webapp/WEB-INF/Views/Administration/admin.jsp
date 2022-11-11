<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<jsp:include page="/includes/head.html"></jsp:include>
	
	<script type="text/javascript">
		
		currentIdVisible = "";
		const ids = ['vr', 'rr', 'cr', 'pc'];
		
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
	
	<script type="text/javascript">
	
		function validate() {
			var correct = true;
			if(document.getElementById('code').value == "") {
				correct = false;
			}
			
			if(!correct) {
				var element = document.getElementById('msgcode');
				element.classList.remove('is-sr-only');
			}
			
			return correct;
		}
	
	</script>
	
<body>
	<header class="container mt-6" style="border-bottom: 25px; border-bottom-color: black;">
	<h1 class="title has-text-centered m-2"> <a href="admin">CiberRosario - Administración</a> </h1>
		<p class="help is-danger">${error}</p>
		<nav class="navbar" role="navigation" aria-label="main navigation">
			<div class="navbar-menu" style="border-bottom: 2px solid black;">
				<div class="navbar-start"></div>
					<a class="navbar-item is-size-5" onclick="showOption('vr')">Validar reserva</a>
					<a class="navbar-item is-size-5" onclick="showOption('rr')">Realizar reserva</a>
					<a class="navbar-item is-size-5" onclick="showOption('cr')">Cancelar reserva</a>
					<a class="navbar-item is-size-5">Actualizar descuentos</a>
					<a class="navbar-item is-size-5">Actualizar precios</a>
					<a class="navbar-item is-size-5" onclick="showOption('pc')">Registrar nueva PC</a>
					<a class="navbar-item is-size-5" href="./index.jsp"> <strong class="is-danger">SALIR</strong> </a>
				<div class="navbar-end"></div>
			</div>
		</nav>
	</header>
	<div class="m-6">
		<div id="vr" class="is-sr-only">
		<div class="container " style="width: 500px; height: 300px;">	
			<form action="admin/validate" method="post" class="box" autocomplete="off" id="form_validate" onsubmit="return validate()">
			<div class="field">
			<div id="msgcode" class="is-sr-only">
				<p class="help is-danger">Por favor, especifique el codigo</p>
			</div>
				<label class="label">CÓDIGO reserva</label>
				<div class="control">
					<input id="code" class="input" type="text" placeholder="-----" name="code" value="">
				</div>
			</div>
			<button type="submit" class="button is-success">Validar</button>
			</form>
		</div>
		</div>
		<div id="rr" class="is-sr-only">
			<jsp:include page="options/doreserve.jsp"></jsp:include>
		</div>
		<div id="cr" class="is-sr-only">
			<jsp:include page="options/cancelreserve.jsp"></jsp:include>
		</div>
		<div id="pc" class="is-sr-only">
			<jsp:include page="options/addpc.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>