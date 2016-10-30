define(function(require, exports, module) {
	require('jquery');
	var alertM = require('alert'),md=[31,31,28,31,30,31,30,31,31,30,31,30],$d = $(document),add0=function(n){return n>9?n:("0"+n)},
	today=new Date(),y=today.getFullYear(),m=today.getMonth()+1,d=today.getDate(),ty=today.getTime(),py=today.setFullYear(y-1),length=ty-py>31536000000?366:365,
	html='<div style="width:'+length*2+'px"><a href="javascript:" style="left:'+length*2+'px"><u>'+add0(m)+'-'+add0(d)+'</u></a><a href="javascript:" style="left:'+length*2+'px"><u>'+add0(m)+'-'+add0(d)+'</u></a><i><s style="width:0;left:'+length*2+'px"></s></i>';
	length>365&&(md[2]=29);
	for (var i = 0,j=-d,k=0,l=md.length; i<l; i++) {
		k=m+i;
		k=k>11?k-12:k;
		j+=md[k];
		!k&&(html+='<span class="dd_year" style="left:'+j*2+'px"><b></b>'+y+'</span>')
		html+='<span style="left:'+j*2+'px"><b></b>'+(k+1)+'</span>'
	};
	return {
		init:function(t){
			var mod = module.exports,
				done=function(){},
				setP=function(f1,f2){
					$s.css({
						left:f1,
						width:f2-f1
					})
					$a.eq(0).css("left",f1);
					$a.eq(1).css("left",f2);
				},
				setT=function(f1,f2){
					$a.eq(0).find("u").html(mod.toMStr(f1));
					$a.eq(1).find("u").html(mod.toMStr(f2));
					$t.data("range",{start:mod.toStr(f1),end:mod.toStr(f2)})
				},
				day={
					set:function(f1,f2){
						if(f1&&f2){
							if(f1.toString().indexOf("-")>-1)
								f1=mod.toTime(f1);
							if(f2.toString().indexOf("-")>-1)
								f2=mod.toTime(f2);
							f2=(f2=f2-f1)>0?f2+f1:(f1=f2+f1)-f2;
							if(f1<py||f2>ty)
								alertM("Time out of range",{cls:"error"})
							else{
								setT(f1,f2);
								setP((f1-py)/43200000,(f2-py)/43200000);
							}
						}
						done.call($t,$t.data("range"))
						return this;
					},
					done:function(f){
						if($.isFunction(f))
							done=f;
						return this;
					}
				},
				$t=$(t).addClass("day_drag").html(html+"</div>").on("mousedown","a",function(e){
					var $a0=$(this),
						x= e.pageX - $a0.position().left,f1,f2;
					$d.on({
						mousemove: function(e) {
							var cx = e.clientX - x;
							cx=cx < 0 ? 0 : (cx > length*2 ? length*2 : cx);
							$a0.css({
								left: cx
							});
							f1=$a.eq(0).position().left;
							f2=$a.eq(1).position().left;
							f2=(f2=f2-f1)>0?f2+f1:(f1=f2+f1)-f2;
							$s.css({
								left:f1,
								width:f2-f1
							})
							$a0.find("u").html(mod.toMStr(py+cx*43200000));
							e.preventDefault();
						},
						mouseup: function() {
							if(f1&&f2){
								$t.data("range",{start:mod.toStr(py+f1*43200000),end:mod.toStr(py+f2*43200000)})
								done.call($t,$t.data("range"));
							}
							$d.off('mousemove').off('mouseup');
						}
					})
				}).on("click","span",function(){
					var t=$(this).position().left,
						f1=$a.eq(0).position().left,
						f2=$a.eq(1).position().left;
					f2=(f2=f2-f1)>0?f2+f1:(f1=f2+f1)-f2;
					Math.abs(f1-t)>Math.abs(f2-t)?f2=t:f1=t+2;
					setP(f1,f2);
					setT(f1*43200000+py,f2*43200000+py);
					done.call($t,$t.data("range"))
				}).data("range",{start:mod.toStr(ty),end:mod.toStr(ty)}),
				$a=$t.find("a"),
				$s=$t.find("s");
			return day;
		},
		toTime:function(v){
			v=v.split("-");
			today.setFullYear(v[0]);
			today.setDate(1);
			today.setMonth(v[1]-1);
			today.setDate(v[2]);
			return today.getTime();
		},
		toStr:function(s){
			today.setTime(s);
			return today.getFullYear()+"-"+add0(today.getMonth()+1)+"-"+add0(today.getDate());
		},
		toMStr:function(s){
			today.setTime(s);
			return add0(today.getMonth()+1)+"-"+add0(today.getDate());
		}
	}
});