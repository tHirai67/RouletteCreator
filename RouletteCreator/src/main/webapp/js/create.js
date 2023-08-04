//jQuery
$(function(){
	
	// 追加ボタンを押した時のイベントハンドラ
	$('#addItem').click(function(){
		var newRow = `
			<tr class="item">
        		<td><input type="text" name="item_name[]"></td>
        		<td><input type="number" name="item_probability[]"></td>
     			<td><button type="button" name="item_delete[]" id="deleteItem">削除</button></td>
        	</tr>
		
		`;
		
		$('#roulette_items_list').append(newRow);
		
	});
	
	//削除ボタンを押した時のイベントハンドラ
	$('#roulette_items_list').on('click','#deleteItem',function(){
		var rows = $('#roulette_items_list').find('.item');
		if(rows.length > 2){
			$(this).closest('tr').remove();
		}else{
			alert("最低2つの項目が必要です！");
		}
		
	});
	
	
	
	
});












