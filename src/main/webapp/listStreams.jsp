<%@page import="dto.Streamers"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	<%LinkedList<Streamers> list = (LinkedList<Streamers>) request.getAttribute("liststreamers"); %>
<div class="table-container">
	<table class="table is-fullwidth">
		<thead>
			<tr>
				<th>Streamer</th>
				<th>Plataforma</th>
				<th>Link a stream</th>
			</tr>
		</thead>
		<tbody>
			<%if(list!=null){ for(Streamers item : list){ %>
			<tr>
				<td><%=item.getName() %></td>
				<td><%=item.getPlataform() %></td>
				<td> <a href="<%=item.getLink()%>" target="_blank" ><%=item.getLink() %></a> </td>
			</tr>
			<%}} %>
		</tbody>
	</table>
</div>