<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<jsp:include page="/includes/head.html"></jsp:include>
	
	<script type="text/javascript">
		
		currentIdVisible = "";
		currentTab = "";
		const ids = ['vr', 'rr', 'cr', 'pc'];
		const idstab = ['validate', 'list', 'do', 'cancel'];
		
		function showOption(id, idtab) {
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
	
		function validateFormValidate() {
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
		
		function validateFormReserve(){
			var correct = true;
			var error = "";
			if(document.getElementById('username').value == "") {
				correct = false;
				error = "user";
			}
			if(document.getElementById('tipo').value == "Tipo") {
				correct = false;
				error = "tipo";
			}
			if(document.getElementById('dia').value == "Dia") {
				correct = false;
				error = "dia";
			}
			
			if(!correct) {
				switch (error) {
				case "user" : 
					var element = document.getElementById('error_username');
					element.classList.remove('is-sr-only');
					break;
				case "tipo" :
					var element = document.getElementById('error_tipo');
					element.classList.remove('is-sr-only');
					break;
				case "dia" : 
					var element = document.getElementById('error_dia');
					element.classList.remove('is-sr-only');
					break;
				}
			}
			
			return correct;
		}
	
	</script>
	
<body>
	<div class="container is-widescreen">
		<header class="mt-6" style="border-bottom: 25px; border-bottom-color: black;">
		<h1 class="title has-text-centered m-2"> <a href="admin">CiberRosario - Administración</a> </h1>
			<p class="help is-danger">${error}</p>
			
			<div class="tabs">
				<ul>
					<li><a class="navbar-item">Listar reservas</a></li>
					<li id="validate" class=""><a class="navbar-item" onclick="showOption('vr', 'validate')">Validar reserva</a></li>
					<li id="do" class=""><a class="navbar-item" onclick="showOption('rr', 'do')">Realizar reserva</a></li>
					<li id="cancel" class=""><a class="navbar-item" onclick="showOption('cr', 'cancel')">Cancelar reserva</a></li>
					<li><a class="navbar-item">Dar de alta usuario</a></li>
					<li><a class="navbar-item">Actualizar descuentos</a></li>
					<li><a class="navbar-item">Actualizar precios</a></li>
					<li><a class="navbar-item" onclick="showOption('pc')">Registrar nueva PC</a></li>
					<li><a class="navbar-item" href="./index.jsp"> <strong class="is-danger">SALIR</strong> </a></li>
				</ul>
			</div>
		</header>
		<div class="m-6">
			<div id="vr" class="is-sr-only">
				<div class="container " style="width: 500px; height: 300px;">	
					<form action="admin/validate" method="post" class="box" autocomplete="off" id="form_validate" onsubmit="return validateFormValidate()">
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
				<div class="container" style="width: 1000px; height: 800px">
					<form action="reserve/selected" method="post" class="box" autocomplete="off" id="form_reserve" onsubmit="return validateFormReserve()">
						<h3 class="title is-size-6">Realizar reserva</h3>
						<div class="field">
							<div id="error_username" class="is-sr-only">
								<p class="help is-danger">Especifique username.</p>
							</div>
							<label class="label">Username de cliente</label>
							<div class="control">
								<input id="username" class="input" type="text" placeholder="Username" name="username" value="">
							</div>
							<div id="error_tipo" class="is-sr-only">
								<p class="help is-danger">Especifique tipo.</p>
							</div>
							<label class="label">Tipo de computadora</label>
							<div class="select">
								<select id="tipo" name="tipo">
									<option selected>Tipo</option>
									<option value="gamer">Gamer</option>
									<option value="streamer">Streamer</option>
									<option value="workstation">Workstation</option>
								</select>
							</div>
							<div id="error_dia" class="is-sr-only">
								<p class="help is-danger">Especifique dia.</p>
							</div>
							<label class="label">Dia de reserva</label>
							<div class="select">
								<select id="dia" name="reserva_para">
									<option selected>Dia</option>
									<option value="hoy">Hoy</option>
									<option value="mañana">Mañana</option>
								</select>
							</div>
						</div>
					<button type="submit" class="button is-success">Iniciar reserva</button>
					</form>
				</div>
			</div>
			<div id="cr" class="is-sr-only">
				<div class="container" style="width: 800px; height: 400px;">
					<form action="admin/cancel" method="post" class="box">
						<h3 class="title is-size-6">Cancelar Reserva</h3>
						<div class="field">
							<div id="error_code" class="is-sr-only">
								<p class="help is-danger">Especifique el codigo.</p>
							</div>
							<label class="label">Codigo de reserva</label>
							<div class="control">
								<input type="text" class="input" placeholder="Code" name="cancelcode" value="">
							</div>
							<button class="button is-danger mt-2" type="submit">Cancelar reserva</button>
						</div>
					</form>
				</div>
			</div>
			<div id="pc" class="is-sr-only">
				
			</div>
		</div>
	</div>
</body>
</html>