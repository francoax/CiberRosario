<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<jsp:include page="includes/head.html"></jsp:include>
<body>
	<div class="container is-max-widescreen mt-6">
		<h1 class="title has-text-left">Registro</h1>
		<h2 class="subtitle has-text-left">Complete los campos necesarios.</h2>
		<h2 class="subittle is-size-5 has-text-centered" style="background-color: green; color: white;">${msg}</h2>
		<form action="user/signup" method="post" class="box">
		
			<div class="field is-horizontal">
				<div class="field-label is-normal">
					<label class="label">Nombre y Apellido</label>
				</div>
				<div class="field-body">
					<div class="field">
						<p class="control">
							<input class="input" required name="name" type="text" placeholder="Nombre">
						</p>
					</div>
					<div class="field">
						<p class="control">
							<input class="input" required type="text" placeholder="Apellido" name="lastname">
						</p>
					</div>
				</div>
			</div>
			
			<div class="field is-horizontal">
				<div class="field-label is-normal">
					<label class="label">Email</label>
				</div>
				<div class="field-body">
					<div class="field">
						<p class="control" style="width: 450px;">
							<input class="input" required type="email" placeholder="example@gmail.com" name="email">
						</p>
					</div>
				</div>
			</div>
			
			<div class="field is-horizontal">
				<div class="field-label is-normal">
					<label class="label">DNI</label>
				</div>
				<div class="field-body">
					<div class="field">
						<p class="control" style="width: 200px;">
							<input class="input" required type="text" placeholder="xx.xxx.xxx" name="dni">
						</p>
					</div>
				</div>
			</div>
			
			<div class="field is-horizontal">
				<div class="field-label is-normal">
					<label class="label">Fecha de nacimiento</label>
				</div>
				<div class="field-body">
					<div class="field">
						<p class="control" style="width: 200px;">
							<input class="input" required type="date" name="fechanac">
						</p>
					</div>
				</div>
			</div>
			
			<div class="field is-horizontal">
				<div class="field-label is-normal">
					<label class="label">Teléfono</label>
				</div>
				<div class="field-body">
					<div class="field">
						<p class="control" style="width: 200px;">
							<input class="input" required type="tel" name="tel">
						</p>
					</div>
				</div>
			</div>
			
			<div class="field is-horizontal">
				<div class="field-label is-normal">
					<label class="label">Username</label>
				</div>
				<div class="field-body">
					<div class="field">
						<p class="control has-icons-right" style="width: 200px;">
							<input class="input" required type="text" name="username">
							<p class="help">(Identificacion dentro del negocio)</p>
						</p>
					</div>
				</div>
			</div>
			
			<div class="field is-horizontal">
				<div class="field-label is-normal">
					<label class="label">Contraseña</label>
				</div>
				<div class="field-body">
					<div class="field">
						<p class="control" style="width: 200px;">
							<input class="input" required type="password" name="password">
						</p>
					</div>
				</div>
			</div>
			
			<div class="field is-horizontal">
				<div class="field-label is-normal">
					<label class="label">Repetir contraseña</label>
				</div>
				<div class="field-body">
					<div class="field">
						<p class="control" style="width: 200px;">
							<input class="input" required type="password" name="repeatpassword">
						</p>
					</div>
				</div>
			</div>
			
			<div class="field is-grouped is-grouped-centered">
			<p class="control">
				<a href="/CiberRosario/index.jsp" class="button">
					Volver
				</a>
			</p>
			 <p class="control">
			    <button type="submit" class="button is-success">
			      Registrarse
			    </button>
			  </p>
			</div>
			
		</form>
	</div>
	<jsp:include page="/includes/footer.html"></jsp:include>
</body>
</html>