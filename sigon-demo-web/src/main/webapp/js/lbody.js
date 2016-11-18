define(function(require, exports, module) {
	require('jquery');
	var alertM = require('alert'),
		send=function(data,url,$t,call){
			$t.empty();
			$.ajax({
				url:url,
				type:"post",
				dataType:'json',
				data:data
			}).done(function(data) {
				var html='<p class="no_data">No Data</p>'
				if(data.status=="succ"){
					if(data.list.length){
						if(call)
							window.re_title.go();
						html=""
						for(var i in data.list){
							i=data.list[i];
							var orderNoHtml = '';
							if(i.orderNo!=undefined){
								orderNoHtml = '<b>'+i.orderNo+'&nbsp;:&nbsp;</b>';
							}
							html+='<div class="'+(i.isself?"fr bg_blue":"fl")+'"><div><b>'+i.username+'&nbsp;:&nbsp;</b> <span>'+i.date+'</span></div><p>'+orderNoHtml+i.remark+'</p></div>'
						}
					}
				}else
					alertM(data.msg,{cls:data.status});
				$t.html(html);
			}).fail(function() {
				alertM("连接失败，请检查网络连接是否已断开",{cls:"error"})
			});
			return false;
		}
	return function(opt){
		var $l_p=$(".l_page"),
			$l_n=$("#l_nav a").on("click",function(){
				$l_n.removeClass("on")
				$l_p.hide().eq($(this).addClass("on").index()).show()
			}),
			$l_i=$(".l_info"),
			$l_f=$(".l_form form"),
			$task_btn=$l_f.eq(4).on("submit",function(){
				setTimeout(function(){
					$task_btn.prev().val("").prev().val("")
					$task_btn.trigger("click");
				},300000)
				window.re_title.clear()
				return send("",opt.t_get,$l_i.eq(2),1)
			}).find("button").trigger("click")

		$l_p.eq($l_n.find(".on").index()).show()
		$l_f.eq(0).on("submit",function(){
			return send($(this).serialize()+"&code="+$l_f.eq(1).find("input").val(),opt.b_get,$l_i.eq(0))
		})
		$l_f.eq(1).on("submit",function(){
			return send($(this).serialize(),opt.b_add,$l_i.eq(0))
		})
		$l_f.eq(2).on("submit",function(){
			return send($(this).serialize()+"&code="+$l_f.eq(3).find("input").val(),opt.u_get,$l_i.eq(1))
		})
		$l_f.eq(3).on("submit",function(){
			return send($(this).serialize(),opt.u_add,$l_i.eq(1))
		})

		module.exports.set=function(code,type){
			var i=(type=="user"?1:0)
			$l_p.hide().eq(i).show()
			$l_n.removeClass("on").eq(i).addClass("on")
			$l_f.eq(i*2+1).find("input").val(code)
			send("code="+code,i?opt.u_get:opt.b_get,$l_i.eq(i))
		}
	}
});