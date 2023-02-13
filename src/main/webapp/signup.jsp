<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<jsp:include page="includes/head.html"></jsp:include>
<body>
	<div class="container is-max-desktop mt-6">
		<h1 class="title has-text-centered">Registro</h1>
		<h2 class="subtitle has-text-centered">Complete los campos necesarios.</h2>
		<h2 class="subittle is-size-5 has-text-centered" style="background-color: green; color: white;">${msg}</h2>
		<form id="signupForm" action="user/signup" method="post" class="box" >
		
			<div class="field is-horizontal formGroup">
            <div class="field-label is-normal">
            <label class="label">Nombre</label>
            </div>
            <div class="field-body">
                <div class="field">
                    <p class="control is-expanded has-icons-right">
                        <input id="name" class="input" required minlength="2" custommaxlength="15" name="name" type="text" placeholder="Nombre">
                        <span class="icon is-small is-right is-hidden success-icon">
                              <i class="fas fa-check"></i>
                        </span>
                        <span class="icon is-small is-right is-hidden error-icon">
                            <i class="fas fa-exclamation-triangle"></i>
                        </span>
                    </p>
                    <p class="help"></p>
                </div>
            </div>
        </div>
        
        <div class="field is-horizontal formGroup">
            <div class="field-label is-normal">
            <label class="label">Apellido</label>
            </div>
            <div class="field-body">
                <div class="field">
                    <p class="control is-expanded has-icons-right">
                        <input id="lastname" class="input" required minlength="2" custommaxlength="15" type="text" placeholder="Apellido" name="lastname">
                        <span class="icon is-small is-right is-hidden success-icon">
                              <i class="fas fa-check"></i>
                        </span>
                        <span class="icon is-small is-right is-hidden error-icon">
                            <i class="fas fa-exclamation-triangle"></i>
                        </span>
                    </p>
                    <p class="help"></p>
                </div>
            </div>
        </div>
        
        <div class="field is-horizontal formGroup">
            <div class="field-label is-normal">
            <label class="label">Email</label>
            </div>
            <div class="field-body">
                <div class="field">
                    <p class="control is-expanded has-icons-right">
                        <input  id="email" class="input" required pattern="^([A-Z|a-z|0-9](\.|_){0,1})+[A-Z|a-z|0-9]\@([A-Z|a-z|0-9])+((\.){0,1}[A-Z|a-z|0-9]){2}\.[a-z]{2,3}$" type="email" placeholder="example@gmail.com" name="email">
                        <span class="icon is-small is-right is-hidden success-icon">
                              <i class="fas fa-check"></i>
                        </span>
                        <span class="icon is-small is-right is-hidden error-icon">
                            <i class="fas fa-exclamation-triangle"></i>
                        </span>
                    </p>
                    <p class="help"></p>
                </div>
            </div>
        </div>
        
        <div class="field is-horizontal formGroup">
            <div class="field-label is-normal">
            <label class="label">Teléfono</label>
            </div>
            <div class="field-body">
                <div class="field">
                    <p class="control is-expanded has-icons-right">
                        <input id="tel" class="input" required pattern="^\s*(?:\+?(\d{1,3}))?([-. (]*(\d{3})[-. )]*)?((\d{3})[-. ]*(\d{2,4})(?:[-.x ]*(\d+))?)\s*$" type="tel" name="tel" placeholder="000-0000000">
                        <span class="icon is-small is-right is-hidden success-icon">
                              <i class="fas fa-check"></i>
                        </span>
                        <span class="icon is-small is-right is-hidden error-icon">
                            <i class="fas fa-exclamation-triangle"></i>
                        </span>
                    </p>
                    <p class="help"></p>
                </div>
            </div>
        </div>
        
        <div class="field is-horizontal formGroup">
            <div class="field-label is-normal">
            <label class="label">Username</label>
            </div>
            <div class="field-body">
                <div class="field">
                    <p class="control is-expanded has-icons-right">
                        <input id="username" class="input" required minlength="5" type="text" name="username" placeholder="Username">
                        <span class="icon is-small is-right is-hidden success-icon">
                              <i class="fas fa-check"></i>
                        </span>
                        <span class="icon is-small is-right is-hidden error-icon">
                            <i class="fas fa-exclamation-triangle"></i>
                        </span>
                    </p>
                    <p class="help"></p>
                </div>
            </div>
        </div>
        
        <div class="field is-horizontal formGroup">
            <div class="field-label is-normal">
            <label class="label">Contraseña</label>
            </div>
            <div class="field-body">
                <div class="field">
                    <p class="control is-expanded has-icons-right">
                        <input id="password" class="input" required minlength="5" type="password" name="password" placeholder="**********">
                        <span class="icon is-small is-right is-hidden success-icon">
                              <i class="fas fa-check"></i>
                        </span>
                        <span class="icon is-small is-right is-hidden error-icon">
                            <i class="fas fa-exclamation-triangle"></i>
                        </span>
                    </p>
                    <p class="help"></p>
                </div>
            </div>
        </div>
        
        <div class="field is-horizontal formGroup">
            <div class="field-label is-normal">
            <label class="label">Confirmar Contraseña</label>
            </div>
            <div class="field-body">
                <div class="field">
                    <p class="control is-expanded has-icons-right">
                        <input id="repeatedPassword" class="input" match="password" required minlength="5" type="password" name="repeatpassword" placeholder="**********">
                        <span class="icon is-small is-right is-hidden success-icon">
                              <i class="fas fa-check"></i>
                        </span>
                        <span class="icon is-small is-right is-hidden error-icon">
                            <i class="fas fa-exclamation-triangle"></i>
                        </span>
                    </p>
                    <p class="help"></p>
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
			    <button id="btnSubmit" type="submit" class="button is-success">
			      Registrarse
			    </button>
			  </p>
			</div>
			
		</form>
	</div>
	<script type="text/javascript" src="js/formValidation.js"></script>
	<jsp:include page="/includes/footer.html"></jsp:include>
</body>
</html>