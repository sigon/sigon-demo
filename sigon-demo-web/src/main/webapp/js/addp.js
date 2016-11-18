define(function(require, exports, module) {
	require('jquery');
	return function(elm,alm,cb) {
		$(elm).each(function(){
			var $t=$(this).on("click",".del_p",function(){
					$(this).parent().remove()
					btn_clear()
				}).on("click",".add_p",function(){
					$(this).parent().after($c.clone())
					btn_clear()
				}),
				btn_clear=function(){
					var $a=$t.find(".add_p");
					if($a.length==1){
						$a.show().css("right",0)
						$t.find(".del_p").hide()
					}else{
						$t.find(".del_p").show()
						$a.hide().last().show().css("right",32)
					}
					cb()
				},
				$c=$t.find(alm).append('<a href="javascript:" class="add_p btn_i bg_green" title="Add">a</a><a href="javascript:" class="del_p btn_i bg_red">d</a>').last().clone();
			$c.find("input,select,textarea").val("");
			btn_clear()
		})
	}
});