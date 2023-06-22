<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<aside>
				<h2>アプリケーション説明</h2>
				<p>アプリの説明</p>
			</aside>
			<main>
				<h2>ルーレットリスト</h2>
				<p>ルーレット1</p>
				<p>ルーレット2</p>
				<p>ルーレット3</p>
				<form action="CreateServlet" method="get">
					<input type="submit" value="作成"></input>
				</form>
				<form action="EditServlet" method="get">
					<input type="submit" value="編集"></input>
				</form>
			
			</main>
		</div>
	</body>
</html>