<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>RouletteCounterApplication</title>
		
	</head>
	<body>
		<header>
        		<h1>ルーレット作成</h1>
        </header>
        <main>
        	<form action="ExecutionServlet" method="post" >
        		<div id="roulette_type">
        			<h2>ルーレットタイプ</h2>
        				<input type="radio" name="roulette_type" value="normal">ノーマルモード</br>
        			 	<input type="radio" name="roulette_type" value="cheat">チートモード</br>
        		</div>
        		<div id="roulette_name">
        			 <h2>ルーレット名</h2>
        			 	<input type="text" name="roulette_name">
        			 </div>
        			 
        		</div>
        		<div id="roulette_items">
        			<h2>ルーレット項目</h2>
        			<table>
        				<thead>
        					<tr>
        						<th>項目名</th>
        						<th>確率</th>
        						<th></th>
        					</tr>
        				</thead>
        				<tbody id="roulette_items_list">
        					<tr class="item">
        						<td><input type="text" name="item_name[]"></td>
        						<td><input type="number" name="item_probability[]"></td>
        						<td><button type="button" name="item_delete[]" id="deleteItem">削除</button></td>
        					</tr>
        					<tr class="item">
        						<td><input type="text" name="item_name[]"></td>
        						<td><input type="number" name="item_probability[]"></td>
        						<td><button type="button" name="item_delete[]" id="deleteItem">削除</button></td>
        					</tr>
        				</tbody>
        			</table>
        		</div>
        		<button type="button" id="addItem">項目を追加</button> 
        		<input type="submit" value="作成"></input>
       		</form>

        </main>
        <script 
			src="https://code.jquery.com/jquery-3.6.1.min.js" 
			integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" 
			crossorigin="anonymous"></script>
		<script type="text/javascript" src="js/create.js"></script>
	</body>
</html>