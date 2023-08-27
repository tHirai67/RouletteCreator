(function($) {
	var Roulette = function(options) {
		//アニメーションを制御する設定
		var defaultSettings = {
			maxPlayCount : null, // x >= 0 or null
			speed : 10, // x > 0
			stopItemNumber : null, // x >= 0 or null or -1
			rollCount : 3, // x >= 0
			duration : 3, //(x second)	
			stopCallback : function() { //ルーレットの停止時のコールバック関数
			},
			startCallback : function() { //ルーレットの開始時のコールバック関数
			},
			slowDownCallback : function() { //ルーレットのスローダウン時のコールバック関数
			}
		}
		//デフォルトのプロパティを設定する
		var defaultProperty = {
			playCount : 0,
			$rouletteTarget : null, //ルーレットのアニメーションされる要素
			itemCount : null, //項目数
			$items : null, //ルーレット内の項目を表すオブジェクト
			originalStopItemNumber : null,//アニメーションが停止する項目番号
			totalHeight : null,//ルーレット全体の高さ
			topPosition : 0,//アニメーションされている要素の上端の位置

			maxDistance : null,//アニメーションの最大移動距離
			slowDownStartDistance : null,//アニメーションがスローダウンを開始する距離

			isRunUp : true,//アニメーションが加速するかのフラグ
			isSlowdown : false,//アニメーションがスローダウンするかのフラグ
			isStop : false,//アニメーションが停止状態かのフラグ

			distance : 0,//アニメーションが進行した距離
			runUpDistance : null,//アニメーションが上昇中にすすむ距離
			isIE : navigator.userAgent.toLowerCase().indexOf('msie') > -1 // TODO IE
		};
		//extendは複数のオブジェクトをマージするメソッド
		var p = $.extend({}, defaultSettings, options, defaultProperty);
		
		//初期状態に戻すメソッド
		var reset = function() {
			p.maxDistance = defaultProperty.maxDistance;
			p.slowDownStartDistance = defaultProperty.slowDownStartDistance;
			p.distance = defaultProperty.distance;
			p.isRunUp = defaultProperty.isRunUp;
			p.isSlowdown = defaultProperty.isSlowdown;
			p.isStop = defaultProperty.isStop;
			p.topPosition = defaultProperty.topPosition;
		}
		
		var slowDownSetup = function() {
			//スローダウンがすでにはじめっている場合は終了
			if(p.isSlowdown){
				return;
			}
			p.slowDownCallback();
			p.isSlowdown = true;
			p.slowDownStartDistance = p.distance;
			p.maxDistance = p.distance + (2*p.totalHeight);
			p.maxDistance += p.itemHeight - p.topPosition % p.itemHeight;
			//ストップ位置が指定されている場合の処理
			if (p.stopItemNumber != null) {
				p.maxDistance += (p.totalHeight - (p.maxDistance % p.totalHeight) + (p.stopItemNumber * p.itemHeight))
						% p.totalHeight;
			}
		}
		
		//アニメーションを制御するためのメソッド
		var roll = function() {
			//スピードの設定
			var speed_ = p.speed;
			
			if (p.isRunUp) {//加速中の処理
				if (p.distance <= p.runUpDistance) {//
					var rate_ = ~~((p.distance / p.runUpDistance) * p.speed);
					speed_ = rate_ + 1;
				} else {
					p.isRunUp = false;
				}

			} else if (p.isSlowdown) {//減速中の処理
				var rate_ = ~~(((p.maxDistance - p.distance) / (p.maxDistance - p.slowDownStartDistance)) * (p.speed));
				speed_ = rate_ + 1;
			}

			if (p.maxDistance && p.distance >= p.maxDistance) {//アニメーションが停止する処理
				p.isStop = true;
				reset();
				p.stopCallback(p.$rouletteTarget.find('.roulette_item').eq(p.stopItemNumber));
				return;
			}
			p.distance += speed_;//アニメーションの進行距離を更新
			p.topPosition += speed_;//上端の位置を更新
			if (p.topPosition >= p.totalHeight) {
				p.topPosition = p.topPosition - p.totalHeight;
			}
			// TODO IE 
			if (p.isIE) {
				p.$rouletteTarget.css('top', '-' + p.topPosition + 'px');
			} else {
				// TODO more smooth roll
				p.$rouletteTarget.css('transform', 'translate(0px, -' + p.topPosition + 'px)');
			}
			setTimeout(roll, 1);//アニメーションが進行している間一定間隔でroll関数を呼ぶ．
		}
		
		//ルーレットの初期化するメソッド
		var init = function($roulette) {
			$roulette.css({ 'overflow' : 'hidden' });
			defaultProperty.originalStopItemNumber = p.stopItemNumber;
			if (!p.$items) {//ルーレットが未定義の場合
				p.$items = $roulette.find('.roulette_item').remove();
    			p.itemCount = p.$items.length;
				if (p.$items[0].complete || p.$items[0].complete === undefined) {
		            console.log("アイテムの読み込みが完了しました。");
		
		            p.itemHeight = p.$items.eq(0).height();
		            $roulette.css({ 'height': (p.itemHeight + 'px') });
		            p.totalHeight = p.itemCount * p.itemHeight;
		            p.runUpDistance = 2 * p.itemHeight;
		
		            // アイテムの読み込みが完了したらイベントハンドラを解除
		            p.$items[0].onload = null;
		        } else {
		            // まだ読み込みが完了していない場合は再度監視
		            setTimeout(checkItemsLoaded, 100); // 100ミリ秒ごとに再試行
		        }
			
				
			}
			$roulette.find('div').remove();
			p.$items.css({
				'display' : 'block'
			});
			p.$rouletteTarget = $('<div>').css({
				'position' : 'relative',
				'top' : '0'
			}).attr('class',"roulette-inner");
			$roulette.append(p.$rouletteTarget);
			p.$rouletteTarget.append(p.$items);
			p.$rouletteTarget.append(p.$items.eq(0).clone());
			$roulette.show();
		}

		var start = function() {
			p.playCount++;
			if (p.maxPlayCount && p.playCount > p.maxPlayCount) {
				return;
			}
			p.stopItemNumber = $.isNumeric(defaultProperty.originalStopItemNumber) && Number(defaultProperty.originalStopItemNumber) >= 0 ?
									Number(defaultProperty.originalStopItemNumber) : Math.floor(Math.random() * p.itemCount); 
			p.startCallback();
			roll();
			setTimeout(function(){
				slowDownSetup();
			}, p.duration * 1000);
		}

		var stop = function(option) {
			if (!p.isSlowdown) {
				if (option) {
					var stopItemNumber = Number(option.stopItemNumber);
					if (0 <= stopItemNumber && stopItemNumber <= (p.itemCount - 1)) {
						p.stopItemNumber = option.stopItemNumber;
					}
				}
				slowDownSetup();
			}
		}
		var option = function(options) {
			p = $.extend(p, options);
			p.speed = Number(p.speed);
			p.duration = Number(p.duration);
			p.duration = p.duration > 1 ? p.duration - 1 : 1; 
			defaultProperty.originalStopItemNumber = options.stopItemNumber; 
		}

		var ret = {
			start : start,
			stop : stop,
			init : init,
			option : option
		}
		return ret;
	}

	var pluginName = 'roulette';
	$.fn[pluginName] = function(method, options) {
		return this.each(function() {
			var self = $(this);
			var roulette = self.data('plugin_' + pluginName);

			if (roulette) {
				if (roulette[method]) {
					roulette[method](options);
				} else {
					console && console.error('Method ' + method + ' does not exist on jQuery.roulette');
				}
			} else {
				roulette = new Roulette(method);
				roulette.init(self, method);
				$(this).data('plugin_' + pluginName, roulette);
			}
		});
	}
})(jQuery);