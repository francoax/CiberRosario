<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<div class="field">
		<p style="color: red;">${msgplat}</p>
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
		<label class="label">Su nombre de streamer: </label>
		<div class="control">
			<input class="input" style="width: 350px" type="text" maxlength="10">
		</div>
	</div>
</body>
