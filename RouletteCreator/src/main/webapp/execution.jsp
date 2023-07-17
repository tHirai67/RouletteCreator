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
			<h1>ルーレットアプリケーション</h1>
		</header>
		<div>
			<main>
				<div>
					<h2>入力情報</h2>
					名前：<%= request.getParameter("name") %></br>
					項目数<%= request.getParameter("item_num") %></br>
				</div>
				<form action="HomeServlet" method="get">
					<input type="submit" value="実行"></input>
				</form>
			
			</main>
		</div>
	</body>
</html>