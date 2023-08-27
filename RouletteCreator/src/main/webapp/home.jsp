<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Roulette" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>RouletteCounterApplication</title>
		<script 
			src="https://code.jquery.com/jquery-3.6.1.min.js" 
			integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" 
			crossorigin="anonymous"></script>
		<script>
			$(function(){
				$('#delete_btn').click(function(){
					alert('ルーレットが削除されました．');
				});
			});
		</script>
	</head>
	<body>
		<header>
			<h1>ルーレットアプリケーション</h1>
		</header>
		<div>
			<aside>
				<h2>アプリケーション説明</h2>
				<p>アプリの説明</p>
			</aside>
			<main>
				<h2>ルーレットリスト</h2>
				<div id="roulette_list">
				<table>
					<thead>
						<tr>
							<th>ルーレット名</th>
							<th>日付</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<% List<Roulette> rouletteInfoList = (List<Roulette>) request.getAttribute("rouletteInfoList");
						if (rouletteInfoList != null) {
		                    for (Roulette roulette : rouletteInfoList) {
						%>
						<tr>
		                    <td><%= roulette.getRouletteName() %></td>
		                    <td><%= roulette.getDate() %></td>
		                    <td>
		                    	<form action="EditServlet" method="get">
		                    		<input type="hidden" name="roulette_id" value="<%= roulette.getId() %>">
		                    		<input type="submit" value="編集"></input>
		                    	</form>
		                    </td>
		                    <td>
		                    	<form action="DeleteServlet" method="post">
		                    		<input type="hidden" name="roulette_id" value="<%= roulette.getId() %>">
		                    		<input type="submit" id="delete_btn" value="削除"></input>
		                    	</form>
		                    </td>
						</tr>
						<% } 
						
						}%>
					</tbody>
				</table>
			</div>
				
				<form action="CreateServlet" method="get">
					<input type="submit" value="作成"></input>
				</form>
			
			</main>
		</div>
	</body>
</html>