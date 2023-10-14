<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.Roulette" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1">
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
		<link rel="stylesheet" href="./css/base.css"></link>
		<link rel="stylesheet" href="./css/home.css"></link>
	</head>
	<body>
		<header>
			<h1>Roulette Application</h1>
		</header>
		<main>
			<div id="title_img">
				<img src="./image/Roulette_image.png">
			</div>
			<div id="grid-container">
				<div id="roulette_list">
					<h2>Roulette List</h2>
					<table class="table-design">
						<thead>
							<tr>
								<th>Name</th>
								<th>Date</th>
								<th></th>
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
			                    	<form action="ExecutionServlet" method="get">
			                    		<input type="hidden" name="roulette_id" value="<%= roulette.getId() %>">
			                    		<input type="submit" value="実行" class="btn"></input>
			                    	</form>
			                    <td>
			                    	<form action="EditServlet" method="get">
			                    		<input type="hidden" name="roulette_id" value="<%= roulette.getId() %>">
			                    		<input type="submit" value="編集" class="btn"></input>
			                    	</form>
			                    </td>
							</tr>
							<% } 
							
							}%>
						</tbody>
					</table>
				</div>
				<div id="create_button">
					<form action="CreateServlet" method="get">
						<input type="submit" value="作成" class="btn"></input>
					</form>
				</div>
				<div id="explain">
					<h2>How to use</h2>
					<p>このアプリケーションは，入力フォームにルーレットの項目を入れることで，簡単にルーレットを作成いたします．<br></p>
					<ul>
						<li>新しくルーレットを作成する場合は「作成」ボタン</li>
						<li>すでにあるルーレットを編集・削除する場合は「編集」ボタン</li>
						<li>すでにあるルーレットを実行する場合は「実行」ボタン</li>		
					</ul>
				</div>
			</div>
			
		</main>
	</body>
</html>