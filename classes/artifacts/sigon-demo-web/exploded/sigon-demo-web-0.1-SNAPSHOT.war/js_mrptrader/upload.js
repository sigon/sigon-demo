define(function(require, exports, module) {
	require('jquery');
	var alertM = require('alert'),
		btn_id=246,
		upload=function(files,opt,$t){
			var fileData=new FormData(),
				xhr=new XMLHttpRequest(),
				fileLenth=0,
				$s=$t.find("span");
			for (var i = files.length - 1; i >-1; i--) {
				var file=files[i]
				if(!opt.type.test(file.name)){
					alertM("File type is mismatch",{cls:"error"});
					return false;
				}
				if(file.size>opt.size*1024*1024){
					alertM("File size need less than "+opt.size+"M",{cls:"error"});
					return false;
				}
				fileLenth++;
				fileData.append(opt.fileName,file)
			};
			if(fileLenth){
				xhr.open("post",opt.url);
				xhr.upload.onprogress=function(e){
					if (e.lengthComputable) {
						$s.html('<b>u</b>Uploading<br/>'+(e.loaded / e.total * 100 | 0)+"%")
					}
				};
				xhr.onload=function(){
					$s.html('<b>u</b>Drag files<br/>to here')
					if(this.status==200){
						opt.succ.call($t,$.parseJSON(this.response))
					}else
						alert("Error Code: "+this.status)
				}
				xhr.send(fileData);
			}
		};
	return function(opt) {
		opt = $.extend({
			bind:"",
			url:"",
			size:10,
			fileName:"images",
			multiple:1,
			type:/(.*)+\.(jpg|jpeg|gif|png|txt|doc|xls|pdf|docx|xlsx)$/i,
			succ:function(){}
		}, opt || {});
		$(opt.bind).each(function(){
			$(this).replaceWith('<label class="upload_btn" for="upload_input'+(++btn_id)+'"><input type="file" '+(opt.multiple?"multiple ":"")+'id="upload_input'+btn_id+'"><span><b>u</b>Drag files<br/>to here</span></label>')
			var $btn=$("#upload_input"+btn_id).on("change",function(){
					upload(this.files,opt,$btn);
					this.value="";
				}).parent().on("dragenter",function(){
					return false;
				}).on("dragover",function(){
					return false;
				})
				$btn[0].addEventListener("drop",function(e){
					upload(e.dataTransfer.files,opt,$btn)
					e.stopPropagation();
					e.preventDefault();
				},0)
		})
	}
});