define(function(require, exports, module) {
	require('jquery');
	var $t,option;
	return {
		init:function(){
			if(!$("#message").length)
				$("body").append('<div id="message"></div>');
			$t=$("#message").on("click","u",function(){
				$(this).parent().remove();
				return false;
			});
			return module.exports;
		},
		create:function(data){
			var html=""
			for (var i = data.length - 1; i >= 0; i--) {
				html+='<a class="bg_';
				switch(data[i].status){
					case "alert":
						html+='blue'
					break;
					case "succ":
						html+='green'
					break;
					case "error":
						html+='red'
					break;
					case "cross":
						html+='orange'
					break;
				}
				html+='" href="'+data[i].href+'">'+data[i].msg+'</a>';//<u data-icon="c"></u>
			};
			$t.append(html).find("a").delay(4000).fadeOut();
			setTimeout(module.exports.clear,5000)
			setTimeout(module.exports.get,option.time)
			return module.exports;
		},
		clear:function(){
			$t.find("a").remove()
			return module.exports;
		},
		get:function(opt){
			option=$.extend({
				url:"",
				time:30000,
				done:function(){}
			}, opt || option);
			$.ajax({
				url:option.url,
				dataType:'json'
			}).done(function(data) {
				if(!(option.done.call($t, data) === false))
					module.exports.create(data);
			});
			return module.exports;
		}
	}
});