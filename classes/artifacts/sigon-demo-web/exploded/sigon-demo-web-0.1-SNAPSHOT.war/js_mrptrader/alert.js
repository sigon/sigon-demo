define(function(require, exports, module) {
	require('jquery');
	var a=function(c, o){
		a.o = $.extend({
			time: 2000,
			title: alertip,
			width: 480,
			height: 'a',
			close: 1,
			btns: [
				// {
				// 	txt:"确定",
				// 	cls:"",
				// 	func:
				// }
			],
			cls: '',
			iframe: 0,
			of: function() {},
			cf: function() {},
			rf: function() {}
		}, o || {});
		if (a.o.cls) {
			a.o.cls += " info";
			a.o.width = "a";
		}
		if ($('#alertM').length > 0) $('#alertM').remove();
		else $('<div id="hbg"></div>').appendTo('body').fadeTo('fast', 0.4);
		var str = ['<div id="alertM" class="', a.o.cls, '"><h5 id="alertT">'],$w = $(window),$d=$(document);
		if (a.o.close) str.push('<label id="alertR" title="Close">&times;</label>');
		str.push(a.o.title, '</h5>');
		if (a.o.iframe) str.push('<iframe id="alertP" frameBorder="0" scrolling="auto" style="width:', a.o.width, 'px;height:', a.o.height, 'px" src="', c,(c.indexOf("?")>-1?"&&":"?"),"pageFrom=mask", '"></iframe>');
		else str.push('<div id="alertP" style="height:', a.o.height, 'px;width:', a.o.width, 'px;">',c,'</div>');
		if (a.o.btns.length > 0) {
			str.push('<div id="alertBtns">');
			for (var i = 0, l = a.o.btns.length; i < l; i++) {
				str.push('<label id="alert_btn_', i, '" class="btn ', a.o.btns[i].cls, '">', a.o.btns[i].txt, '</label>')
			};
			str.push('</div>');
		}
		str.push('</div>');
		$("body").append(str.join(''));
		a.a = $('#alertM');
		a.a[0].style.left = ($w.width() - a.a.width()) / 2 + "px";
		a.a[0].style.top = ($w.height() - a.a.height()) / 3 + $w.scrollTop() + "px";
		if (!a.o.cls) {
			a.a.on("click", "#alertR", function() {
				if (!(a.o.cf.call(a.a, a.o) === false)) a.remove();
			}).on("click", "#alertBtns .btn", function() {
				var i = this.id.split("_")[2]
				if (typeof(a.o.btns[i].func) != "function" || !(a.o.btns[i].func.call(a.a, a.o) === false)) a.remove();
			})
		}
		a.o.of.call(a.a, a.o);
		if (a.amrt) {
			clearTimeout(a.amrt);
			a.amrt = 0;
		}
		if (!isNaN(a.o.time))
			a.amrt = setTimeout(function() {
				a.remove();
			}, a.o.time);
		else
			$('#alertT').css('cursor', 'move').on('mousedown', function(e) {
				var w = $w.width() - a.a.outerWidth() - 4,
					u = $w.height() - a.a.outerHeight() - 4,
					x = e.pageX - a.a.removeClass("on").fadeTo('fast', 0.6).offset().left,
					y = e.pageY - a.a.offset().top - $w.scrollTop();
				a.a.css("transition","none")
				$d.on({
					mousemove: function(e) {
						var cx = e.clientX - x;
						var cy = e.clientY - y;
						a.a.css({
							left: cx < 4 ? 4 : (cx > w ? w : cx),
							top: cy < 4 ? 4 : cy
						});
						e.preventDefault();
					},
					mouseup: function() {
						a.a.fadeTo('fast', 1);
						a.a.css("transition","all .2s ease-out")
						$d.off('mousemove').off('mouseup');
					}
				});
				return false;
			})
	};
	window.setAMCSS=a.setAMCSS=function(css){
		$("#alertP").css(css)
		if(css.width)
			a.a[0].style.left = ($w.width() - css.width - 48) / 2 + "px";
	}
	a.remove = function() {
		a.a.remove();
		$('#hbg').fadeOut(function() {
			$(this).remove();
			a.o.rf.call(a.a, a.o);
		});
		if (a.amrt) {
			clearTimeout(a.amrt);
			a.amrt = 0;
		}
	}
	a.end = function(u,d,cb){
		a.ended(u,d,function(data){
			if (data.status == "succ") {
				if(typeof(cb) == "function") cb.call(a,data);
				else if(typeof(cb) == "string") setTimeout(function(){window.location.href=cb},1);
				else window.location.reload();
			}
		})
	}
	a.ended=function(u,d,cb){
		a("Loading",{cls:"loading",time:"y"});
		$.ajax({
			url: u,
			data: d
		}).done(function (data) {
			a(data.msg, {cls:data.status,rf:function(){
				cb.call(a,data)
			}});
		});
	}
	return a;
});