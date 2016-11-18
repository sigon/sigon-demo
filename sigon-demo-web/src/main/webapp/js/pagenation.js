define(function(require, exports, module) {
	require('jquery');
	var $pn=$("#pageNumber"),
			$sn=$("#sortname"),
			$sv=$("#sortval"),
			$ps=$("#pageSize").on("change",function(){
				$form.trigger("submit");
			}),
			$page=$pn.parent().on("click","a",function(){
				var $t=$(this);
				pi=$t.data("pageindex")
				if(pi){
					$pn.val(pi);
				}else{
					switch($t.html()){
						case "r":
							window.location.reload();
							return false;
							break;
//					case "p":
//						window.print();
//						return false;
//					break;
						case "f":
							$pn.val("1");
							break;
						case "l":
							$pn.val($pn.data("pagelength"));
							break;
						case "p":
							$pn.val(parseInt($pn.data("pageindex"))-1);
							break;
						case "n":
							$pn.val(parseInt($pn.data("pageindex"))+1);
							break;
					}
				}
				$form.trigger("submit");
			}),
			$form=$pn.closest("form"),
			$table=$form.find("table").on("change", "td input[type=checkbox]", function() {
				if ($(this).prop("checked")) $(this).parent().parent().addClass("on");
				else $(this).parent().parent().removeClass("on");
				checkAll();
			}).on("click","th a",function(){
				var $t=$(this);
				$sn.val($t.data("sname"));
				$sv.val($t.data("sval"));
				$form.trigger("submit");
			}).on("click",".td_down",function(){
				$(this).parent().parent().toggleClass("tr_next_show")
			}),
			$tr=$table.find("tr"),
			$menu=$form.find("menu"),
			$checkbox = $table.find('td input[type="checkbox"]'),
			$all = $table.find('th input[type="checkbox"]').on("change", function() {
				if ($(this).prop("checked")) {
					$checkbox.prop("checked", true);
					$menu.addClass("on");
				}else{
					$checkbox.prop("checked", false);
					$menu.removeClass("on");
				}
			}),
			l = $checkbox.length,
			checkAll = function() {
				if ($checkbox.filter(":checked").length == l) $all.prop("checked", true);
				else $all.prop("checked", false);
				if ($checkbox.filter(":checked").length > 0) $("menu").addClass("on");
				else $("menu").removeClass("on");
			}
});