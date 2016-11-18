define(function(require, exports, module) {
	require('jquery');
	var alertM = require('alert'),piczoom = require('piczoom'),btn_id=246,$w=$(window)
	return function(opt) {
		opt = $.extend({
			form:"",
			submit:function(){},
			done:function(){}
		}, opt || {});
		var $form=$(opt.form).on("reset",function(){
				$form.find(".upload_con").removeClass("on").find("span").remove()
			}).on("submit",function(){
				if(!(opt.submit.call($form) === false)){
					var formData=new FormData($form[0]),
						xhr=new XMLHttpRequest(),
						required=1;
					$form.find(".upload_con").each(function(){
						var $t=$(this),
							name=$t.data("iname");
						if($t.find("span").length<$t.data("required")){
							required=0;
							alertM($t.prev().html()+' need more than '+$t.data("required"),{cls:"error"})
							return false;
						}
						$t.find(".upload_file").each(function(){
							formData.append(name,$(this).data("file"))
						})
					})
					if(required){
						alertM('loading... <span class="green" id="up_percent">0%</span>',{cls:"loading",time:"y"});
						xhr.open("post",$form.attr("action"));
						xhr.upload.onprogress=function(e){
							if (e.lengthComputable) {
								$("#up_percent").html((e.loaded / e.total * 100 | 0)+"%")
							}
						};
						xhr.onload=function(){
							if(this.status==200){
								var response=typeof this.response=='string'?$.parseJSON(this.response):this.response;
								if(!(opt.done.call($form,response) === false))
									alertM.remove();
							}else
								alertM("Error",{cls:"error"})
						}
						xhr.send(formData);
					}
				}
				return false;
			});
		$.each(opt.input,function(i,eopt){
			eopt=$.extend({
				elm:"",
				length:3,
				required:0,
				type:/(.*)+\.(jpg|jpeg|gif|png)$/i,
				src:[],
				size:5,
				selectUrl:""
			}, eopt || {});
			var length=eopt.src.length>eopt.length?eopt.length:eopt.src.length,
				iname=$(eopt.elm).hide().attr("name"),
				$t=$('<span data-required="'+eopt.required+'" data-iname="'+iname+'" class="upload_con"></span>').insertAfter(eopt.elm),
				fileCreat=function(files){
					for (var i = files.length - 1; i >-1; i--) {
						var file=files[i]
						if(eopt.type.test(file.name)){
							if(file.size>eopt.size*1024*1024){
								alertM("File size need less than "+eopt.size+"M",{cls:"error"});
								return false;
							}
							(function(file){
								var reader=new FileReader();
								reader.onload=function(e){
									$('<span class="upload_file"><img data-title="'+file.name+'" data-src="'+e.target.result+'" src="'+e.target.result+'"/><a href="javascript:">c</a></span>').data({
										file:file
									}).prependTo($t);
								}
								reader.readAsDataURL(file);
							})(file)
							if(++length>=eopt.length){
								$t.addClass("on")
								return false;
							}
						}
					};
				},
				html='';
			for(var i=length-1;i>-1;i--){
				html+='<span><img data-title="'+eopt.src[i].big+'" data-src="'+eopt.src[i].big+'" src="'+eopt.src[i].smail+'"/><input type="text" name="'+iname+'_src" value="'+eopt.src[i].big+'"/><a href="javascript:">c</a></span>'
			}
			if(length>=eopt.length){
				$t.addClass("on")
			}
			$t.on("click","a",function(){
				$(this).parent().remove();
				length--;
				$t.removeClass("on");
				return false;
			}).html(html+'<input type="file" id="upload_input'+(++btn_id)+'"><label class="upload_btn" for="upload_input'+btn_id+'"><b>u</b>Drag files<br/>to here</label>');
			var $up=$("#upload_input"+btn_id).on("change",function(){
				fileCreat(this.files,eopt,$t);
				$up.val("");
			}),
			$upbtn=$up.next().on("dragenter",function(){
				return false;
			}).on("dragover",function(){
				return false;
			})
			$upbtn[0].addEventListener("drop",function(e){
				fileCreat(e.dataTransfer.files,eopt,$t)
				e.stopPropagation();
				e.preventDefault();
			},0)
			if(eopt.selectUrl)
				$upbtn.after('<label class="upload_btn"><b>P</b>Click to<br/>select files</label>').next().on("click",function(){
					alertM("loading",{time:"y",cls:"loading"})
					$.ajax({
						url:eopt.selectUrl,
						dataType:'json'
					}).done(function(data) {
						if(data.status=="succ"){
							html='<div id="select_files">'
							for (var i = data.files.length - 1; i >= 0; i--) {
								html+='<b class="piczoom" data-checked="0"><img src="'+data.files[i]+'"></b>'
							};
							alertM(html+'</div><div id="select_tip">已经选择 <b class="red">'+length+'</b> 个文件，还可选择 <b class="red">'+(eopt.length-length)+'</b> 个</div>',{
								title:"Select Files",
								time:"y",
								width:"800",
								of:function(){
									var $sf=$("#select_files").on("click",".piczoom",function(){
											if(!$(this).is(".check_hide")){
												$(this).toggleClass("checked")
												$st.eq(0).html(length+$sf.find(".checked").length)
												var sl=eopt.length-(length+$sf.find(".checked").length)
												$st.eq(1).html(sl)
												if(sl>0)
													$sf.find(".check_hide").removeClass("check_hide")
												else
													$sf.find("b").not(".checked").addClass("check_hide")
											}
										}),
										$st=$("#select_tip b")
								},
								btns:[{
									txt:"Select",
									cls:"bg_blue",
									func:function(){
										var $sb=$("#select_files").find(".checked"),sbsrc=""
										length+=$sb.length
										if(length>=eopt.length){
											$t.addClass("on")
										}
										html=""
										for (var i = $sb.length - 1; i >= 0; i--) {
											sbsrc=$sb.eq(i).find("img").attr("src");
											html+='<span><img data-title="'+sbsrc+'" data-src="'+sbsrc+'" src="'+sbsrc+'"/><input type="text" name="'+iname+'_src" value="'+sbsrc+'"/><a href="javascript:">c</a></span>'
										};
										$t.prepend(html)
									}
								},{
									txt:"Cancl"
								}]
							})
						}else
							alertM(data.msg,{cls:data.status});
					}).fail(function() {
						alertM("连接失败，请检查网络连接是否已断开",{cls:"error"})
					});
				})
			$(eopt.elm).remove();
		})
		piczoom($form,".upload_con span")
	}
});