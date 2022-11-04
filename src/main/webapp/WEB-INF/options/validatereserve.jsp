<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<body>
	<div class="container" style="width: 500px; height: 300px;">
		<form action="administration" method="post" class="box">
			<div class="field">
				<label class="label">CÓDIGO</label>
				<div class="control">
					<input class="input" type="text" placeholder="-----" name="code">
				</div>
			</div>
			<input type="hidden" name="option" value="vr">
			<button class="button is-success">Validar</button>
		</form>
	</div>
</body>
</html>