<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
	
<html>
	<jsp:include page="/includes/head.html"></jsp:include>
<body>
	<jsp:include page="/includes/header.jsp"></jsp:include>
	
	<div class="container">
		<h1 class="title is-size-4 m-3">Streamers transmitiendo desde CiberRosario</h1>
		<h2 class="subtitle is-size-6 m-3">Aquellos que reserven una computadora <strong>Streamer</strong>, seran publicitados en lo que dure su reserva. </h2>
		
		<jsp:include page="/streams"></jsp:include>
	</div>
	
	<jsp:include page="/includes/footer.html"></jsp:include>
</body>
</html>