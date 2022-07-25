<%@page import="entities.Usuario"%>
<%@page import="entities.Computadora"%>
<%@page import="java.time.LocalTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<%
		Usuario user = (Usuario) session.getAttribute("user");
		if(user==null) {
			response.sendRedirect("login.jsp");
		} else {
		Computadora pc = (Computadora) session.getAttribute("pc");
		String para = (String) session.getAttribute("para");
		LocalTime actual = LocalTime.now();
		int hactual = actual.getHour();
		int[] horas = {8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23};
	%>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="author" content="CiberRosario">
	<meta name="description" content="CiberRosario es una empresa dedicada a brindar el servicio de computadoras para jugar, desarrollar y stremear.">
	<meta name="keywords" content="ciber, rosario ciber, computadora ciber, ciber computadora, ciber torneo">
	<meta name="copyright" content="CiberRosario inc.">
	<title>CiberRosario</title>
	<link rel="icon" href="images/pc.gif">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
    <script src="https://www.w3schools.com/lib/w3.js"></script>
</head>
<body>
	<h1>gamer</h1>
</body>
</html>
<%}%>