define(function(require, exports, module) {
	require('jquery');
	var $bind, $pop, rsDelay,$w=$(window),
	resize = function() {
		if (rsDelay) clearTimeout(rsDelay);
		rsDelay = setTimeout(function() {
			var offset = $bind.offset();
			$pop.css({
				left: offset.left,
				top: offset.top + $bind.outerHeight() + 2,
				width: $bind.outerWidth()-2
			});
		}, 99)
	};
	return {
		init:function(){
			if(!$("#autocs").length){
				$("body").append('<ul id="autocs" class="autopop"></ul>');
				$pop = $("#autocs").on("mouseover", "li", function() {
					$pop.find("li.pop").removeClass("pop");
					$(this).addClass("pop");
				}).on("mousedown", "li", function() {
					$pop.hide();
					$bind.val($(this).text());
				})
			}
			return module.exports;
		},
		bind:function(elm,url,post){
			var list=module.exports.list;
			if(!$.isFunction(post))
				post=function(){return ""}
			$(elm).each(function() {
				var l = 0,
					delay = 0,
					$t = $(this).attr("autocomplete", "off").on({
						focus: function() {
							$bind = $t.trigger("keyup");
							resize();
							$w.on("resize", resize);
						},
						keydown: function(e) {
							switch (e.which) {
								case 9:
									$pop.hide();
									break;
								case 13:
									$t.val($pop.hide().find(".pop").text());
									break;
								case 38:
									var $p = $pop.find(".pop").removeClass("pop");
									if ($p.index() > 0) $p.prev().addClass("pop");
									else $pop.find("li").last().addClass("pop");
									$t.val($pop.find(".pop").text());
									return false;
								case 40:
									var $p = $pop.find(".pop").removeClass("pop");
									if ($p.index() < l) $p.next().addClass("pop");
									else $pop.find("li").first().addClass("pop");
									$t.val($pop.find(".pop").text());
									return false;
							}
						},
						keyup: function(e) {
							switch (e.which) {
								case 9:
								case 38:
								case 40:
									return false;
									break;
								default:
									var val = $.trim($t.val()),
										html = "<li class='pop'>" + val + "</li>";
									if (val == "" || e.which == 13) $pop.hide();
									else {
										if (delay) clearTimeout(delay);
										delay = setTimeout(function() {
											$.ajax({
												url: url+"?"+name+"="+val+post.call($t, url),
												dataType: 'json'
											}).done(function(data) {
												if (data.length > 0) {
													l = data.length;
													for (var i = 0; i < l; i++) {
														html += '<li>' + data[i].txt + '</li>';
													}
													$pop.html(html).show();
												} else {
													$pop.hide();
												}
											});
										}, 400)
									}
									$pop.html(html);
							}
						},
						blur: function() {
							$pop.hide();
							$w.off("resize", resize);
						}
					}),
					name=$t.attr("name")
			})
		}
	}
});