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
		<link rel="stylesheet" href="./css/base.css"></link>
		<link rel="stylesheet" href="./css/home.css"></link>
	</head>
	<body>
		<header>
			<h1>ルーレットアプリケーション</h1>
		</header>
		<div id="title_img">
			<img src="./image/roulette.jpg">
		</div>
		<main>
			<div id="side">
				<h2>アプリケーション説明</h2>
				<p>このアプリケーションは，入力フォームに選択肢となる項目を入れることで，簡単にルーレットを作成いたします．<br></p>
				<ul>
					<li>新しくルーレットを作成する場合は「作成」ボタン</li>
					<li>すでにあるルーレットを編集・削除する場合は「編集」ボタン</li>
					<li>すでにあるルーレットを実行する場合は「実行」ボタン</li>		
				</ul>
			</div>
			<div id="roulette_list">
				<h2>ルーレットリスト</h2>
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
		                    	<form action="ExecutionServlet" method="get">
		                    		<input type="hidden" name="roulette_id" value="<%= roulette.getId() %>">
		                    		<input type="submit" value="実行"></input>
		                    	</form>
		                    <td>
		                    	<form action="EditServlet" method="get">
		                    		<input type="hidden" name="roulette_id" value="<%= roulette.getId() %>">
		                    		<input type="submit" value="編集"></input>
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
	</body>
</html>