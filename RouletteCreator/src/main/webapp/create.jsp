<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>RouletteCounterApplication</title>
		<link rel="stylesheet" href="./css/base.css"></link>
		<link rel="stylesheet" href="./css/create.css"></link>
	</head>
	<body>
		<header>
        		<h1>ルーレット作成</h1>
        </header>
        <main>
        	<form action="CreateServlet" method="post" >
        		<div id="roulette_name">
        			 <h2>ルーレット名</h2>
        			 	<input type="text" name="roulette_name" id="roulette_name_form">
        			 </div>
        			 
        		</div>
        		<div id="roulette_items">
        			<h2>ルーレット項目</h2>
        			<table class="table-design">
        				<thead>
        					<tr>
        						<th>項目名</th>
        						<th></th>
        					</tr>
        				</thead>
        				<tbody id="roulette_items_list">
        					<tr class="item">
        						<td><input type="text" name="item_name[]" class="item_name"></td>
        						<td><button type="button" name="item_delete[]" class="deleteItem btn">削除</button></td>
        					</tr>
        					<tr class="item">
        						<td><input type="text" name="item_name[]" class="item_name"></td>
        						<td><button type="button" name="item_delete[]" class="deleteItem btn" class="btn">削除</button></td>
        					</tr>
        				</tbody>
        			</table>
        		</div>
        		<button type="button" id="addItem" class="btn">項目を追加</button> <br>
        		<input type="submit" id="create" value="作成" class="btn"></input>
       		</form>

        </main>
        <script 
			src="https://code.jquery.com/jquery-3.6.1.min.js" 
			integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" 
			crossorigin="anonymous"></script>
		<script type="text/javascript" src="js/create.js"></script>
	</body>
</html>