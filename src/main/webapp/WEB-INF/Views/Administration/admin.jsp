<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<jsp:include page="/includes/head.html"></jsp:include>
<body>
	<div class="container is-fluid">
		<header class="mt-6" style="border-bottom: 50px; border-bottom-color: black;">
		<h1 class="title has-text-centered m-2"> <a href="admin">CiberRosario - Administración</a> </h1>
		</header>
		
		<div>
			<aside class="menu" style="width: 250px; height: 650px; position: relative;">
			  <p class="menu-label">
			    Reservas
			  </p>
			  <ul class="menu-list">
			    <li><a href="#" class="navbar-item" onclick='divVisibility("listreserve");'>Listar reservas</a></li>
			    <li><a href="#" class="navbar-item" onclick='divVisibility("validate");'>Validar reserva</a></li>
			    <li><a href="#" class="navbar-item" onclick='divVisibility("cancel");'>Cancelar reserva</a></li>
			    <li><a href="#" class="navbar-item" onclick='divVisibility("finish");'>Concretar reserva</a></li>
			  </ul>
			  <p class="menu-label">
			    Usuario
			  </p>
			  <ul class="menu-list">
			    <li><a href="#" class="navbar-item" onclick='divVisibility("updateuser");'>Modificar rol usuario</a></li>
			  </ul>
			  <p class="menu-label">
			    Precios
			  </p>
			  <ul class="menu-list">
			    <li><a href="#" class="navbar-item" onclick='divVisibility("updatediscount");'>Actualizar descuentos</a></li>
				<li><a href="#" class="navbar-item" onclick='divVisibility("updateprice");'>Actualizar precios</a></li>
			  </ul>
			  <p class="menu-label">
			  	Computadoras
			  </p>
			  <ul class="menu-list">
			  	<li><a href="#" class="navbar-item" onclick='divVisibility("addpc");'>Registrar nueva PC</a></li>
			  </ul>
			  <p class="menu-label">
			  	Sesion
			  </p>
			  <ul class="menu-list">
			  	<li><a class="navbar-item" href="./index.jsp"> <strong class="is-danger">SALIR</strong> </a></li>
			  </ul>
			</aside>
		</div>	
		
		<div class="container ml-6" style="display: inline-block;">
		
			<div id="listreserve" class="is-hidden" style="width: 1000px;">
				<div class="container">
					<jsp:include page="/reserves"></jsp:include>
				</div>
			</div>
		
			<div id="validate" class="is-hidden">
				<div class="container " style="width: 500px; height: 300px;">	
					<form action="admin/validate" method="post" class="box" autocomplete="off" id="form_validate" onsubmit="return validateFormValidate()">
					<div class="field">
					<h3 class="title is-size-6">Validar reserva</h3>
					<div id="msgcode" class="is-sr-only">
						<p class="help is-danger">Por favor, especifique el codigo</p>
					</div>
						<label class="label">Código reserva</label>
						<div class="control">
							<input id="code" class="input" type="text" placeholder="Code" name="code" value="">
						</div>
					</div>
					<button type="submit" class="button is-success">Validar</button>
					</form>
				</div>
			</div>
			
			<div id="cancel" class="is-hidden">
				<div class="container" style="width: 500px; height: 400px;">
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
			
			<div id="finish" class="is-hidden" style="width: 500px; height: 400px;">
				<div class="container">
					<form action="admin/finish" method="post" class="box">
						<h3 class="title is-size-6">Concretar reserva</h3>
						<div class="field">
							<label class="label">Codigo de reserva</label>
							<p class="control">
								<input class="input" type="text" name="code">
							</p>
							<button class="button is-warning mt-2">Finalizar</button>
						</div>
					</form>
				</div>
			</div>
			
			<div id="updateuser" class="is-hidden">
				<div class="container" style="width: 620px; height: 400px;">
					<form action="admin/modify" method="post" class="box">
						<h3 class="title is-size-6">Modificar rol usuario</h3>
						<div class="field">
							<div class="is-sr-only">
								<p></p>
							</div>
							<label class="label">Username</label>
							<p class="control">
								<input class="input" type="text" name="username" placeholder="Username">
							</p>
						</div>
						<div class="field">
							<div></div>
							<label class="label">Seleccione el rol</label>
							<div class="select">
								<select id="rol" name="rol">
									<option selected>Rol</option>
									<option value="admin">Admin</option>
									<option value="user">Usuario</option>
								</select>
							</div>
						</div>
						<button type="submit" class="button is-success">Modificar</button>
					</form>
				</div>
			</div>
			
			<div id="updatediscount" class="is-hidden">
				<div class="container" style="width: 500px; height: 400px;">
					<form action="admin/updatediscount" class="box" method="post">
						<h3 class="title is-size-6">Actualizar Descuentos</h3>
						<jsp:include page="/discounts"></jsp:include>
						<div class="field">
							<label class="label">Seleccionar horas minimas</label>
							<div class="select">
								<select name="range">
									<option>Horas</option>
									<option value="flex">4</option>
									<option value="medium">6</option>
									<option value="high">8</option>
									<option value="ultra">15</option>
								</select>
							</div>
						</div>
						<div class="field">
							<label class="label">Nuevo descuento(%)</label>
							<p class="control">
								<input name="discount" class="input" type="text">
							</p>
						</div>
						<button class="button is-success" type="submit">Actualizar</button>
					</form>
				</div>
			</div>
			
			<div id="updateprice" class="is-hidden">
				<div class="container" style="width: 500px; height: 400px;">
					<form action="admin/updateprice" class="box" method="post">
						<h3 class="title is-size-6">Actualizar Precios</h3>
						<jsp:include page="/prices"></jsp:include>
						<div class="field">
							<label class="label">Seleccione tipo computadora</label>
							<div class="select">
								<select name="type">
									<option>Tipo</option>
									<option value="gamer">Gamer</option>
									<option value="streamer">Streamer</option>
									<option value="workstation">Workstation</option>
								</select>
							</div>
						</div>
						<div class="field">
							<label class="label">Fecha de comienzo de vigencia</label>
							<div class="select">
								<select name="vigencia" onchange="show('calendar', this)">
									<option selected>Vigencia</option>
									<option value="hoy">Hoy</option>
									<option value="definir" >Definir</option>
								</select>
							</div>
							<div style="display: inline-block;">
								<p class="control" style="display: none;" id="calendar">
										<input class="input" type="date" name="fechaprecio">								
								</p>
							</div>
						</div>
						<div class="field">
							<label class="label">Nuevo precio($)</label>
							<p class="control">
								<input name="price" class="input" type="text">
							</p>
						</div>
						<button class="button is-success" type="submit">Actualizar</button>
					</form>
				</div>
			</div>
			
			<div id="addpc" class="is-hidden">
				<div class="container" style="width: 700px; height: 650px; ">
					<form action="admin/addpc" class="box" method="post">
						<h3 class="title is-size-6">Registrar nueva PC</h3>
						<div class="field">
							<label class="label">Tipo de computadora</label>
							<div class="select">
								<select name="tipo">
									<option selected>Tipo</option>
									<option value="gamer">Gamer</option>
									<option value="streamer">Streamer</option>
									<option value="workstation">Workstation</option>
								</select>
							</div>
						</div>
						<div class="field">
							<label class="label">Procesador</label>
							<p class="control">
								<input class="input" type="text" name="proce">
							</p>
						</div>
						<div class="field">
							<label class="label">Placa madre</label>
							<p class="control">
								<input class="input" type="text" name="mother">
							</p>
						</div>
						<div class="field">
							<label class="label">RAM</label>
							<p class="control">
								<input class="input" type="text" name="ram">
							</p>
						</div>
						<div class="field">
							<label class="label">Placa de video</label>
							<p class="control">
								<input class="input" type="text" name="grafica">
							</p>
						</div>
						<div class="field">
							<label class="label">Almacenamiento</label>
							<p class="control">
								<input class="input" type="text" name="storage">
							</p>
						</div>
						<button class="button is-success" type="submit">Registrar</button>
					</form>
				</div>
			</div>
			
		</div>
	</div>
	
	<script type="text/javascript">
		function show(divId, element)
		{
		    document.getElementById(divId).style.display = element.value == "definir" ? 'block' : 'none';
		}
	</script>
	<script type="text/javascript">
		
		var divs = ["listreserve", "validate", "cancel", "finish", "updateuser", "updatediscount", "updateprice", "addpc"];

		var visibleDivId = null;
		
	    function divVisibility(divId) {
	      if(visibleDivId === divId) {
	        visibleDivId = null;
	      } else {
	        visibleDivId = divId;
	      }
	      hideNonVisibleDivs();
	    }
	    
	    function hideNonVisibleDivs() {
	      var i, divId, div;
	      for(i = 0; i < divs.length; i++) {
	        divId = divs[i];
	        div = document.getElementById(divId);
	        if(visibleDivId === divId) {
	        div.classList.remove("is-hidden");
	        } else {
	        div.classList.add("is-hidden");
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
</body>
</html>