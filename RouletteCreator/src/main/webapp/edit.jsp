<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>RouletteCounterApplication</title>
	</head>
	<body>
		<header>
			<h1>ルーレット編集</h1>
		</header>
		<main>
			<form action="ExecutionServlet" method="post">
				<p>ルーレット名：<input type="text" name="name"></p>
				<p>項目数：<input type="number" name="num"></p>
				<p><input type="submit" value="決定"></p>
			</form>
		</main>
		
	</body>
</html>