<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html">
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1">
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
				duration : 999,
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
		 <link rel="stylesheet" href="./css/base.css"></link>
		 <link rel="stylesheet" href="./css/execution.css"></link>
		
	</head>
	<body>
		<header>
			<h1>Roulette Application</h1>
		</header>
		<main>
			<div id="roulette-area">
				<h2><%= request.getAttribute("rouletteName") %></h2>	
				<div id="roulette_container">
					<% String[] itemNames = (String[]) request.getAttribute("rouletteItemList"); %>
					<div class="roulette">
						<% for(int i = 0; i < itemNames.length; i++){ %>
							<div class="roulette_item" style="height:200px; width:200px;"><%= itemNames[i] %></div>
						<% } %>
					</div>
				</div>
				<div class="btn_container">
					<button class="start btn grid-item1">Start</button>
					<button class="stop btn grid-item2">Stop</button>
				</div>
			</div>
			
			<div id="rouletteList-area">
				<h3>項目リスト</h3>
				<table class="table-design">
					<thead>
						<tr>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<%
							for(int i = 0; i < itemNames.length; i++){
						%>
						<tr>
							<td><li><%= itemNames[i] %></td>
						</tr>
						<% } %>
					</tbody>
				</table>
			</div>
			<form action="HomeServlet" method="get" class="grid-item1">
				<input type="submit" value="ホームへ戻る" class="btn"></input>
			</form>
		</main>
	</body>
</html>