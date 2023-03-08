<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<jsp:include page="includes/head.html"></jsp:include>
<body>
	<div class="container ">
		<form class="box m-6 p-6 has-background-grey-lighter" action="user/login" method="post">
		<h1 class="title is-3">Iniciar sesion.</h1>
		<h2 class="subtitle is-5">Complete los campos necesarios.</h2>
		<p class="help is-danger">${error}</p>
			<div class="field">
				<label class="label">Email</label>
				<div class="control has-icons-left">
					<input class="input" type="email" required="required" placeholder="alguien@example.com" name="email">
					<span class="icon is-small is-left">
						<i class="fas fa-envelope"></i>
					</span>
				</div>
				<p class="help">Ingresa tu correo</p>
			</div>
			<div class="field">
				<label class="label">Password</label>
				<div class="control has-icons-left">
					<input class="input" type="password" required="required" placeholder="************" name="password">
					<span class="icon is-small is-left">
						<i class="fas fa-user"></i>
					</span>
				</div>
				<p class="help mb-4">Ingresa tu contraseña</p>
			<div class="field">
				<div class="control">
					<input class="button" type="submit" value="Ingresar">
					<a href="index.jsp" class="button is-warning">Volver al inicio</a>
				</div>
			</div>
			</div>
		</form>
	</div>
	<jsp:include page="includes/footer.jsp"></jsp:include>
</body>
</html>