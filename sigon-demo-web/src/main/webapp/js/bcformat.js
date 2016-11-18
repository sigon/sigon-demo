define(function(require, exports, module) {
	require('jquery');
	$("body").append('<span id="bcf_s"></span>');
	var $bc=$("#bcf_s"),
		str=function(t,l){
			return  t+(t.length<l?(new Array(l-t.length+1)).join("X"):"");
		},
		key=[8,9,13,35,36,37,39,46,48,49,50,51,52,53,54,55,56,57,96,97,98,99,100,101,102,103,104,105,108,144],
		key1=[48,49,50,51,52,53,54,55,56,57,96,97,98,99,100,101,102,103,104,105]
	return{
		init:function(elm,text) {
			var $t=$(elm).find("input").on({
				focus:function(){
					$bc.html(text($t)).css({
						left:$t.eq(0).offset().left,
						top:$t.eq(0).offset().top-40
					}).show();
				},
				keydown:function(e){
					for(var i=0,l=key.length;i<l;i++){
						if(e.which==key[i])
							return true;
					}
					return false;
				},
				keyup:function(){
					$bc.html(text($t))
				},
				blur:function(){
					$(this).val(function(i,v){
						return v.replace(/[^0-9-]+/,'');
					})
					$bc.hide()
				}
			})
			return $t;
		},
		initNZD:function(elm){
			var $t=module.exports.init(elm,function(){
					return	"NO: "+str($t.eq(0).val(),2)+" - "+str($t.eq(1).val(),4)+" - "+str($t.eq(2).val(),8)+" - "+str($t.eq(3).val(),3)
				}),
				$t0=$t.eq(0).on({
					keyup:function(e){
						if($t0.val().length>1)
							for(var i=0,l=key1.length;i<l;i++){
								if(e.which==key1[i]){
									$t1.trigger("select")
									return;
								}
							}
					},
					keydown:function(e){
						if($t0.val().length>1)
							for(var i=0,l=key1.length;i<l;i++){
								if(e.which==key1[i]){
									return false;
								}
							}
					}
				}),
				$t1=$t.eq(1).on({
					keyup:function(e){
						if($t1.val().length>3)
							for(var i=0,l=key1.length;i<l;i++){
								if(e.which==key1[i]){
									$t2.trigger("select")
									return;
								}
							}
					},
					keydown:function(e){
						var t=$t1.val();
						if(t.length>3)
							for(var i=0,l=key1.length;i<l;i++){
								if(e.which==key1[i]){
									return false;
								}
							}
						else if(!t.length&&e.which==8)
							$t0.trigger("focus")
					}
				}),
				$t2=$t.eq(2).on({
					keyup:function(e){
						if($t2.val().length>7)
							for(var i=0,l=key1.length;i<l;i++){
								if(e.which==key1[i]){
									$t3.trigger("select")
									return;
								}
							}
					},
					keydown:function(e){
						var t=$t2.val();
						if(t.length>7)
							for(var i=0,l=key1.length;i<l;i++){
								if(e.which==key1[i]){
									return false;
								}
							}
						else if(!t.length&&e.which==8)
							$t1.trigger("focus")
					},
					blur:function(){
						$t2.val(function(i,v){
							return v.length==7?"0"+v:v
						})
					}
				}),
				$t3=$t.eq(3).on({
					keydown:function(e){
						var t=$t3.val();
						if(t.length>2)
							for(var i=0,l=key1.length;i<l;i++){
								if(e.which==key1[i]){
									return false;
								}
							}
						else if(!t.length&&e.which==8)
							$t2.trigger("focus")
					},
					blur:function(){
						$t3.val(function(i,v){
							return v.length==2?"0"+v:v
						})
					}
				})
			return module.exports;
		},
		initCNY:function(elm){
			var $t=module.exports.init(elm,function(){
					return	"NO: "+str($t.eq(0).val(),4)+" - "+str($t.eq(1).val(),4)+" - "+str($t.eq(2).val(),4)+" - "+str($t.eq(3).val(),7)
				}),
				$t0=$t.eq(0).on({
					keyup:function(e){
						if($t0.val().length>3)
							for(var i=0,l=key1.length;i<l;i++){
								if(e.which==key1[i]){
									$t1.trigger("select")
									return;
								}
							}
					},
					keydown:function(e){
						if($t0.val().length>3)
							for(var i=0,l=key1.length;i<l;i++){
								if(e.which==key1[i]){
									return false;
								}
							}
					}
				}),
				$t1=$t.eq(1).on({
					keyup:function(e){
						if($t1.val().length>3)
							for(var i=0,l=key1.length;i<l;i++){
								if(e.which==key1[i]){
									$t2.trigger("select")
									return;
								}
							}
					},
					keydown:function(e){
						var t=$t1.val();
						if(t.length>3)
							for(var i=0,l=key1.length;i<l;i++){
								if(e.which==key1[i]){
									return false;
								}
							}
						else if(!t.length&&e.which==8)
							$t0.trigger("focus")
					}
				}),
				$t2=$t.eq(2).on({
					keyup:function(e){
						if($t2.val().length>3)
							for(var i=0,l=key1.length;i<l;i++){
								if(e.which==key1[i]){
									$t3.trigger("select")
									return;
								}
							}
					},
					keydown:function(e){
						var t=$t2.val();
						if(t.length>3)
							for(var i=0,l=key1.length;i<l;i++){
								if(e.which==key1[i]){
									return false;
								}
							}
						else if(!t.length&&e.which==8)
							$t1.trigger("focus")
					}
				}),
				$t3=$t.eq(3).on({
					keydown:function(e){
						if(!$t3.val().length&&e.which==8)
							$t2.trigger("focus")
					}
				})
			return module.exports;
		}
	}
});