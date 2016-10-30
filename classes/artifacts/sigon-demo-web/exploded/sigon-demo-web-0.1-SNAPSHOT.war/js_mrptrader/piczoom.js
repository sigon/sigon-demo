define(function(require, exports, module) {
	require('jquery');
	var alertM = require('alert'),$w=$(window),open=function($a,$p,$t,$ap){
		var src=$t.data("src"),
			title=$t.data("title"),
			img=new Image();
		$p.empty();
		img.onload=function(){
			img.onload = null;
			var ww=$w.width()-40,
				wh=$w.height()-120,
				w=img.width>ww?ww:img.width,
				h=img.width>ww?img.height/img.width*ww:img.height
			w=h>wh?w/h*wh:w;
			h=h>wh?wh:h;
			wh=h>160?0:80-h/2;
			$ap.css({
				width:w<240?240:w,
				height:h<160?160:h
			})
			$a.css({
				left:($w.width()-(w<240?240:w)-40)/2,
				top:($w.height() -(h<160?160:h)-70) / 3 + $w.scrollTop()
			}).find(".piczoom_title").html('<a href="'+src+'" class="piczoom_a fr" data-icon="b" target="_blank"></a>'+title);
			setTimeout(function(){
				$p.html('<img class="piczoom_img" style="margin:0 auto;display:block;padding:'+wh+'px 0 '+wh+'px 0" width="'+w+'" src="'+src+'"><span class="piczoom_l">&lsaquo;</span><span class="piczoom_r">&rsaquo;</span>').find("img").fadeIn();
			},240)
		};
		img.src=src;
	}
	return function(elm,bind) {
		var l=$(elm).on("click",bind||".piczoom",function(){
			var $elm=$(elm).find(bind||".piczoom"),
				$t=$(this)
			alertM('<div class="piczoom_lr"><span class="piczoom_l">&lsaquo;</span><span class="piczoom_r">&rsaquo;</span></div>',{
				time:"y",
				title:'<span class="piczoom_title"></span>',
				of:function(){
					var $a=this,$ap=$("#alertP"),
						$p=this.find(".piczoom_lr")
					open($a,$p,$t,$ap);
					if($elm.length>1)
						$p.on({
							mousemove:function(e){
								var l=$p.offset().left,
									w=$p.width()/2;
								$p.attr("class",e.pageX-l<w?"piczoom_ll":"piczoom_rr")
							},
							mouseleave:function(){
								$p.attr("class","piczoom_lr")
							},
							click:function(e){
								var i=$elm.index($t),
									length=$elm.length,
									l=$p.offset().left,
									w=$p.width()/2;
								$t=$elm.eq(e.pageX-l<w?(--i<0?length-1:i):(++i==length?0:i));
								open($a,$p,$t,$ap);
							}
						})
				}
			})
			return false;
		})
	}
});