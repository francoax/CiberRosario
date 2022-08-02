<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<div class="field">
		<label class="label">Rubro </label>
		<div class="control">
			<input class="input" type="text" name="rubro">
		</div>
	</div>
	<div class="field">
		<label class="label">Empresa (opcional)</label>
		<div class="control">
			<input class="input" type="text" name="emp">
		</div>
	</div>
	<div class="field">
		<label class="label">Descripcion del trabajo a realizar</label>
		<p class="">Esto es necesario para corroborar que realmente va utilizar la computadora para trabajar.</p>
		<div class="control">
			<textarea class="textarea has-fixed-size" placeholder="Describa el trabajo que va a realizar." name="desc"></textarea>
		</div>
	</div>
</body>
</html>