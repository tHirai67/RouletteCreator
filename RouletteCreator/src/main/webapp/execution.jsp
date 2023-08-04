<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>RouletteCounterApplication</title>
	</head>
	<body>
		<header>
			<h1><%= request.getAttribute("rouletteName") %></h1>
		</header>
		<main>
			<div>
				<% 
					String rouletteType = "";
					if(request.getAttribute("rouletteType").equals("normal")){
						rouletteType = "ノーマルモード";
					}else if(request.getAttribute("rouletteType").equals("cheat")){
						rouletteType = "チートモード";
					}
				%>
				<p>選択したモード：<%= rouletteType %></p>
			</div>
			<div>
				<% String[] itemNames = (String[]) request.getAttribute("itemNames"); %>
				<% String[] itemProbabilities = (String[]) request.getAttribute("itemProbabilities"); %>
				<table>
					<thead>
						<tr>
							<th>ItemName</th>
							<th>Item Probability</th>
						</tr>
					</thead>
					<tbody>
						<%
							for(int i = 0; i < itemNames.length; i++){
						%>
						<tr>
							<td><%= itemNames[i] %></td>
							<td><%= itemProbabilities[i] %></td>
						</tr>
						<% } %>
					</tbody>
					
					
				</table>
			</div>
			<form action="HomeServlet" method="get">
				<input type="submit" value="実行"></input>
			</form>
		
		</main>
	</body>
</html>