<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<jsp:include page="/includes/head.html"></jsp:include>
<body>
	<div class="container" style="width: 500px; height: 300px;">
		<form action="validate" method="post" class="box">
			<div class="field">
				<label class="label">CÓDIGO reserva</label>
				<div class="control">
					<input class="input" type="text" placeholder="-----" name="code" value="invalid">
				</div>
			</div>
			<button type="submit" class="button is-success">Validar</button>
		</form>
	</div>
</body>
</html>