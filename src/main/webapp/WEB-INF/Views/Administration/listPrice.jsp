<%@page import="entities.Precio"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    	<%LinkedList<Precio> precios = (LinkedList<Precio>) request.getAttribute("listPrice"); %>
<!DOCTYPE html>
<html>
<body>
	<div class="box">
		<h3 class="title is-size-6">Lista precios actuales</h3>
		<table class="table is-centered">
			<thead>
				<tr>
					<th>Computadora</th>
					<th>Precio a Fecha</th>
					<th>Precio</th>
				</tr>
			</thead>
			<tbody>
				<%for (Precio price : precios){ %>
				<tr>
					<td><%=price.getIdTipoComputadora()%></td>
					<td><%=price.getFecha_precio()%></td>
					<td>$<%=price.getPrecio()%></td>
				</tr>
				<%} %>			
			</tbody>
		</table>
	</div>
</body>
</html>