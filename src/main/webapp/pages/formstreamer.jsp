<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<div class="field">
		<p class="error">${msgplat}</p>
		<label class="label">Seleccione la plataforma en la que stremea.</label>
		<div class="select">
		  <select name="platform">
		  	<option selected>Plataforma</option>
		    <option value="tw">Twitch</option>
		    <option value="yt">Youtube</option>
		    <option value="fb">Facebook</option>
		  </select>
		</div>
	</div>
	<div class="field">
		<p class="error">${msgnames}</p>
		<label class="label">Su nombre de streamer: </label>
		<div class="control">
			<input class="input" style="width: 350px" type="text" name="sname" maxlength="10">
		</div>
	</div>
	<div class="field">
		<p class="error">${msglink}</p>
		<label class="label">Inserta el link hacia tu stream</label>
		<div class="control">
			<input class="input" style="width: 500px" type="url" name="links">
		</div>
	</div>
</body>
</html>
