<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
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
        	<% String rouletteName = (String) request.getAttribute("rouletteName"); %>
        	<form action="EditServlet" method="post" >
        		<div id="roulette_name">
        			 <h2>ルーレット名</h2>
        			 	<input type="text" name="roulette_name" id="roulette_name_form" value="<%= rouletteName %>">
        			 </div>
        		</div>
        		<div id="roulette_items">
        			<h2>ルーレット項目</h2>
        			<table>
        				<thead>
        					<tr>
        						<th>項目名</th>
        						<th></th>
        					</tr>
        				</thead>
        				<tbody id="roulette_items_list">
        					<% List<String> itemNames = (List<String>) request.getAttribute("rouletteItemList"); 
        					if(itemNames != null){
        						for (String name : itemNames){
        						
        					%>
								<tr class="item">
	        						<td><input type="text" name="item_name[]" class="item_name" value="<%= name %>"></td>
	        						<td><button type="button" name="item_delete[]" class="deleteItem">削除</button></td>
	        					</tr>
							<% } 
								
        					}	%>
							</div>
        				</tbody>
        			</table>
        		</div>
        		<button type="button" id="addItem">項目を追加</button> 
        		<input type="hidden" name="roulette_id" value="<%= request.getAttribute("rouletteId")%>">
        		<input type="submit" id="create" value="作成"></input>
       		</form>

        </main>
        <script 
			src="https://code.jquery.com/jquery-3.6.1.min.js" 
			integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" 
			crossorigin="anonymous"></script>
		<script type="text/javascript" src="js/create.js"></script>
	</body>
</html>