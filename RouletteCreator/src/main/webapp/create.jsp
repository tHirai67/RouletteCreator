<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<title>RouletteCounterApplication</title>
		<link rel="stylesheet" href="./css/base.css"></link>
		<link rel="stylesheet" href="./css/create.css"></link>
	</head>
	<body>
		<header>
        		<h1>Roulette Application</h1>
        </header>
        <main>
        	<h2>ルーレット作成</h2>
        	<form action="CreateServlet" method="post" >
       			<div id="roulette_name" class="grid-container">
       			 	<span class="grid-item1">ルーレット名</span>
       			 	<input type="text" name="roulette_name" id="roulette_name_form" class="grid-item2">
       			 </div>
        		<hr>
        		<div class="grid-container">
        			<span class="grid-item1">ルーレット項目</span>
	        		<div id="roulette_items" class="grid-item2">
	        			<table class="table-design">
							<tbody id="roulette_items_list">
	        					<tr class="item">
	        						<td><input type="text" name="item_name[]" class="item_name"></td>
	        						<td><button type="button" name="item_delete[]" class="deleteItem btn">削除</button></td>
	        					</tr>
	        					<tr class="item">
	        						<td><input type="text" name="item_name[]" class="item_name"></td>
	        						<td><button type="button" name="item_delete[]" class="deleteItem btn">削除</button></td>
	        					</tr>
	        				</tbody>
	        			</table>
        			</div>
        		</div>
        		<button type="button" id="addItem" class="btn">項目を追加</button><br>
        		<span id="caution">二つ以上の項目が必要です．</span>
        		<hr>
        		<input type="submit" id="create" value="実行する" class="btn"></input>
        		<span id="explain">実行ボタンを押した時点で，データベースに保存されます．</span>
       		</form>
        </main>
        <script 
			src="https://code.jquery.com/jquery-3.6.1.min.js" 
			integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" 
			crossorigin="anonymous"></script>
		<script type="text/javascript" src="js/create.js"></script>
	</body>
</html>