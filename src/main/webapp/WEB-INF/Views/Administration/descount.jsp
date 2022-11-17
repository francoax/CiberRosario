<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<jsp:include page="/includes/head.html"></jsp:include>
<body>
	<div class="container" style="width: 500px; height: 400px;">
		<form action="admin/updateoff" class="box" method="post">
			<h3 class="title is-size-6">Actualizar Descuentos</h3>
			<div class="field">
				<label class="label">Rango de horas</label>
				<div class="select">
					<select>
						<option>Rango</option>
						<option value="24">2 a 4</option>
						<option value="46">4 a 6</option>
						<option value="68">6 a 8</option>
						<option value="816">8 a 15</option>
					</select>
				</div>
			</div>
			<div class="field">
				<label class="label">Nuevo descuento(%)</label>
				<p class="control">
					<input class="input" type="text">
				</p>
			</div>
		</form>
	</div>
</body>
</html>