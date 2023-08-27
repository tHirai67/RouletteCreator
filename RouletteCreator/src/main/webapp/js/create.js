//jQuery
$(function(){
	
	// 追加ボタンを押した時のイベントハンドラ
	$('#addItem').click(function(){
		var newRow = `
			<tr class="item">
        		<td><input type="text" name="item_name[]" class="item_name"></td>
     			<td><button type="button" name="item_delete[]" class="deleteItem">削除</button></td>
        	</tr>
		
		`;
		
		$('#roulette_items_list').append(newRow);
		
	});
	
	//削除ボタンを押した時のイベントハンドラ
	$('#roulette_items_list').on('click','.deleteItem',function(){
		var rows = $('#roulette_items_list').find('.item');
		if(rows.length > 2){
			$(this).closest('tr').remove();
		}else{
			alert("最低2つの項目が必要です！");
		}
		
	});
	
	//作成ボタンを押した時のバリデーションチェック
	$('#create').click(function(event){
		if($('#roulette_name_form').val() === ''){
			alert('ルーレット名が未入力です！');
			event.preventDefault();
		}
		var hasEmptyItem = false; // 未入力の項目があるかどうかを記録する変数

        // 動的に生成された .item_name 要素に対してチェック
        $('.item_name').each(function() {
            if ($(this).val() === '') {
                hasEmptyItem = true;
                return false; // 未入力の項目がある場合、処理を中断
            }
        });

        if (hasEmptyItem) {
            alert('ルーレット項目に未入力があります．');
            event.preventDefault();
        }
	});	
});












