define(function(require, exports, module) {
	require('jquery');
	var $bind, $pop, rsDelay,$w=$(window),
	address_resize = function() {
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
		country:["中国1","中国2","中国3","中国4"],
		province:[
			["河北省1","河北省5","河北省q","河北省","河北省","河北省","河北省"],
			["河北省2","河北省6","河北省w","河北省","河北省","河北省","河北省"],
			["河北省3","河北省7","河北省e","河北省","河北省","河北省","河北省"],
			["河北省4","河北省8","河北省r","河北省","河北省","河北省","河北省"],
		],
		city:[
			[{c:"石家庄",p:1},{c:"石家庄2",p:2},{c:"石家庄3",p:3},{c:"石家庄3",p:0},{c:"石家庄3",p:1},{c:"石家庄3",p:1},{c:"石家庄3",p:1}],
			[{c:"石家庄",p:1},{c:"石家庄2",p:2},{c:"石家庄3",p:3},{c:"石家庄3",p:0},{c:"石家庄3",p:1},{c:"石家庄3",p:1},{c:"石家庄3",p:1}],
			[{c:"石家庄",p:1},{c:"石家庄2",p:2},{c:"石家庄3",p:3},{c:"石家庄3",p:0},{c:"石家庄3",p:1},{c:"石家庄3",p:1},{c:"石家庄3",p:1}],
			[{c:"石家庄",p:1},{c:"石家庄2",p:2},{c:"石家庄3",p:3},{c:"石家庄3",p:0},{c:"石家庄3",p:1},{c:"石家庄3",p:1},{c:"石家庄3",p:1}]
		],
		create:function(val,city,province){
			if(!val)
				return '<li><span>Please enter like "北京" or "wellington"</span></li>'
			var html="",j=0;
			for (var i = city.length - 1; i >-1; i--) {
				if(city[i].c.indexOf(val)>-1&&j++<10)
					html+='<li class="'+(html?"":"pop")+'">' + city[i].c +' <span class="gray"> - '+province[city[i].p]+'</span></li>';
			};
			if(html)
				$pop.show()
			else
				$pop.hide()
			return html//||"<li>Sorry, Can't found this city</li>"
		},
		init:function(){
			if(!$("#autoaddress").length){
				$("body").append('<ul id="autoaddress" class="autopop"></ul>');
				$pop = $("#autoaddress").on("mouseover", "li", function() {
					$pop.find("li.pop").removeClass("pop");
					$(this).addClass("pop");
				}).on("mousedown", "li", function() {
					$pop.hide();
					$bind.val($(this).text());
				});
			}
			return module.exports;
		},
		bind:function(opt){
			var city=module.exports.city,
				country=module.exports.country,
				province=module.exports.province,
				$city=$(opt.city).attr("autocomplete", "off").on({
					focus: function() {
						$bind = $city.trigger("keyup").data("selected",0);
						address_resize();
						$w.on("resize", address_resize);
						$pop.show();
					},
					keydown: function(e) {
						switch (e.which) {
							case 9:
								$pop.hide();
								break;
							case 13:
								$city.val($pop.find(".pop").text());
								return false;
							case 38:
								var $p = $pop.find(".pop").removeClass("pop");
								if ($p.index() > 0) $p.prev().addClass("pop");
								else $pop.find("li").last().addClass("pop");
								$city.val($pop.find(".pop").text());
								return false;
							case 40:
								var $p = $pop.find(".pop").removeClass("pop");
								if ($p.index() < ($pop.find("li").length-1)) $p.next().addClass("pop");
								else $pop.find("li").first().addClass("pop");
								$city.val($pop.find(".pop").text());
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
								$pop.html(module.exports.create($.trim($city.val().split(" ")[0]),city[$country.val()],province[$country.val()]));
						}
					},
					blur: function() {
						$pop.hide();
						$w.off("resize", address_resize);
						var v=$city.val()
						$pop.find("li").each(function(){
							if(v==$(this).text()){
								$city.data("selected",1)
								return false;
							}
						})
					}
				}),
				$country=$(opt.country).on("change",function(){
					$city.val("");
				}).html(function(){
					var html="";
					for (var i = country.length-1; i >-1; i--) {
						html+='<option value="'+i+'">'+country[i]+'</option>'
					};
					return html;
				})
			return module.exports;
		}
	}
});