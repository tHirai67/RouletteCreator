<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html">
	<head>
		<meta charset="UTF-8">
		<title>RouletteCounterApplication</title>
		<!-- css -->
		<link rel="stylesheet" href="./css/execution.css"></link>
		<!-- js -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
		<!-- <script src="./js/executions.js"></script> -->
		<script src="./js/execution.js"></script>
		 <script>
		  jQuery(function(){    
		  // initialize!
			var option = {
				speed : 10,
				duration : 5,
		        //stopItemNumber : 0,
			}
			$('div.roulette').roulette(option);	
		 
			// START!
			$('.start').click(function(){
				option.stopItemNumber = 1;
				$('div.roulette').roulette('start');	
			});
		 
			// STOP!
			$('.stop').click(function(){
				$('div.roulette').roulette('stop');	
			});
		   });
		 
		 </script>
		
	</head>
	<body>
		<header>
			<h1><%= request.getAttribute("rouletteName") %></h1>
		</header>
		<main>	
			<div id="roulette_container">
				<% String[] itemNames = (String[]) request.getAttribute("itemNames"); %>
				<div class="roulette">
					<% for(int i = 0; i < itemNames.length; i++){ %>
						<div class="roulette_item" style="height:250px; width:250px;"><%= itemNames[i] %></div>
					<% } %>
				</div>
			</div>
			<div class="btn_container">
				<p>
					<button class="start">Start</button>
					<button class="stop">Stop</button>
				</p>
			</div>
			
			<div>
				
				<table>
					<thead>
						<tr>
							<th>ItemName</th>
						</tr>
					</thead>
					<tbody>
						<%
							for(int i = 0; i < itemNames.length; i++){
						%>
						<tr>
							<td><%= itemNames[i] %></td>
						</tr>
						<% } %>
					</tbody>
					
					
				</table>
			</div>
			<form action="HomeServlet" method="get">
				<input type="submit" value="ホームへ戻る"></input>
			</form>
			
		</main>
	</body>
</html>