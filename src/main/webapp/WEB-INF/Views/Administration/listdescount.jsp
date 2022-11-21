<%@page import="entities.Descuento"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    	<%LinkedList<Descuento> descount = (LinkedList<Descuento>) request.getAttribute("listDescount"); %>
	<div class="box">
		<h3 class="title is-size-6">Lista descuentos actuales</h3>
		<table class="table is-centered">
			<thead>
				<tr>
					<th>Horas minimas</th>
					<th>Porcentaje</th>
				</tr>
			</thead>
			<tbody>
				<%for (Descuento desc : descount){ %>
				<tr>
					<td><%=desc.getHoras_minimas()%></td>
					<td><%=desc.getPorcentaje()*100 %>%</td>
				</tr>
				<%} %>			
			</tbody>
		</table>
	</div>