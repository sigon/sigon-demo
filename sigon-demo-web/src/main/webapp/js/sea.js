/*! Sea.js 2.2.1 | seajs.org/LICENSE.md */
!function(a,b){function c(a){return function(b){return{}.toString.call(b)=="[object "+a+"]"}}function d(){return A++}function e(a){return a.match(D)[0]}function f(a){for(a=a.replace(E,"/");a.match(F);)a=a.replace(F,"/");return a=a.replace(G,"$1/")}function g(a){var b=a.length-1,c=a.charAt(b);return"#"===c?a.substring(0,b):".js"===a.substring(b-2)||a.indexOf("?")>0||".css"===a.substring(b-3)||"/"===c?a:a+".js"}function h(a){var b=v.alias;return b&&x(b[a])?b[a]:a}function i(a){var b=v.paths,c;return b&&(c=a.match(H))&&x(b[c[1]])&&(a=b[c[1]]+c[2]),a}function j(a){var b=v.vars;return b&&a.indexOf("{")>-1&&(a=a.replace(I,function(a,c){return x(b[c])?b[c]:a})),a}function k(a){var b=v.map,c=a;if(b)for(var d=0,e=b.length;e>d;d++){var f=b[d];if(c=z(f)?f(a)||a:a.replace(f[0],f[1]),c!==a)break}return c}function l(a,b){var c,d=a.charAt(0);if(J.test(a))c=a;else if("."===d)c=f((b?e(b):v.cwd)+a);else if("/"===d){var g=v.cwd.match(K);c=g?g[0]+a.substring(1):a}else c=v.base+a;return 0===c.indexOf("//")&&(c=location.protocol+c),c}function m(a,b){if(!a)return"";a=h(a),a=i(a),a=j(a),a=g(a)+"?123c7";var c=l(a,b);return c=k(c)}function n(a){return a.hasAttribute?a.src:a.getAttribute("src",4)}function o(a,b,c){var d=S.test(a),e=L.createElement(d?"link":"script");if(c){var f=z(c)?c(a):c;f&&(e.charset=f)}p(e,b,d,a),d?(e.rel="stylesheet",e.href=a):(e.async=!0,e.src=a),T=e,R?Q.insertBefore(e,R):Q.appendChild(e),T=null}function p(a,c,d,e){function f(){a.onload=a.onerror=a.onreadystatechange=null,d||v.debug||Q.removeChild(a),a=null,c()}var g="onload"in a;return!d||!V&&g?(g?(a.onload=f,a.onerror=function(){C("error",{uri:e,node:a}),f()}):a.onreadystatechange=function(){/loaded|complete/.test(a.readyState)&&f()},b):(setTimeout(function(){q(a,c)},1),b)}function q(a,b){var c=a.sheet,d;if(V)c&&(d=!0);else if(c)try{c.cssRules&&(d=!0)}catch(e){"NS_ERROR_DOM_SECURITY_ERR"===e.name&&(d=!0)}setTimeout(function(){d?b():q(a,b)},20)}function r(){if(T)return T;if(U&&"interactive"===U.readyState)return U;for(var a=Q.getElementsByTagName("script"),b=a.length-1;b>=0;b--){var c=a[b];if("interactive"===c.readyState)return U=c}}function s(a){var b=[];return a.replace(X,"").replace(W,function(a,c,d){d&&b.push(d)}),b}function t(a,b){this.uri=a,this.dependencies=b||[],this.exports=null,this.status=0,this._waitings={},this._remain=0}if(!a.seajs){var u=a.seajs={version:"2.2.1"},v=u.data={},w=c("Object"),x=c("String"),y=Array.isArray||c("Array"),z=c("Function"),A=0,B=v.events={};u.on=function(a,b){var c=B[a]||(B[a]=[]);return c.push(b),u},u.off=function(a,b){if(!a&&!b)return B=v.events={},u;var c=B[a];if(c)if(b)for(var d=c.length-1;d>=0;d--)c[d]===b&&c.splice(d,1);else delete B[a];return u};var C=u.emit=function(a,b){var c=B[a],d;if(c)for(c=c.slice();d=c.shift();)d(b);return u},D=/[^?#]*\//,E=/\/\.\//g,F=/\/[^/]+\/\.\.\//,G=/([^:/])\/\//g,H=/^([^/:]+)(\/.+)$/,I=/{([^{]+)}/g,J=/^\/\/.|:\//,K=/^.*?\/\/.*?\//,L=document,M=e(L.URL),N=L.scripts,O=L.getElementById("seajsnode")||N[N.length-1],P=e(n(O)||M);u.resolve=m;var Q=L.head||L.getElementsByTagName("head")[0]||L.documentElement,R=Q.getElementsByTagName("base")[0],S=/\.css(?:\?|$)/i,T,U,V=+navigator.userAgent.replace(/.*(?:AppleWebKit|AndroidWebKit)\/(\d+).*/,"$1")<536;u.request=o;var W=/"(?:\\"|[^"])*"|'(?:\\'|[^'])*'|\/\*[\S\s]*?\*\/|\/(?:\\\/|[^\/\r\n])+\/(?=[^\/])|\/\/.*|\.\s*require|(?:^|[^$])\brequire\s*\(\s*(["'])(.+?)\1\s*\)/g,X=/\\\\/g,Y=u.cache={},Z,$={},_={},ab={},bb=t.STATUS={FETCHING:1,SAVED:2,LOADING:3,LOADED:4,EXECUTING:5,EXECUTED:6};t.prototype.resolve=function(){for(var a=this,b=a.dependencies,c=[],d=0,e=b.length;e>d;d++)c[d]=t.resolve(b[d],a.uri);return c},t.prototype.load=function(){var a=this;if(!(a.status>=bb.LOADING)){a.status=bb.LOADING;var c=a.resolve();C("load",c);for(var d=a._remain=c.length,e,f=0;d>f;f++)e=t.get(c[f]),e.status<bb.LOADED?e._waitings[a.uri]=(e._waitings[a.uri]||0)+1:a._remain--;if(0===a._remain)return a.onload(),b;var g={};for(f=0;d>f;f++)e=Y[c[f]],e.status<bb.FETCHING?e.fetch(g):e.status===bb.SAVED&&e.load();for(var h in g)g.hasOwnProperty(h)&&g[h]()}},t.prototype.onload=function(){var a=this;a.status=bb.LOADED,a.callback&&a.callback();var b=a._waitings,c,d;for(c in b)b.hasOwnProperty(c)&&(d=Y[c],d._remain-=b[c],0===d._remain&&d.onload());delete a._waitings,delete a._remain},t.prototype.fetch=function(a){function c(){u.request(g.requestUri,g.onRequest,g.charset)}function d(){delete $[h],_[h]=!0,Z&&(t.save(f,Z),Z=null);var a,b=ab[h];for(delete ab[h];a=b.shift();)a.load()}var e=this,f=e.uri;e.status=bb.FETCHING;var g={uri:f};C("fetch",g);var h=g.requestUri||f;return!h||_[h]?(e.load(),b):$[h]?(ab[h].push(e),b):($[h]=!0,ab[h]=[e],C("request",g={uri:f,requestUri:h,onRequest:d,charset:v.charset}),g.requested||(a?a[g.requestUri]=c:c()),b)},t.prototype.exec=function(){function a(b){return t.get(a.resolve(b)).exec()}var c=this;if(c.status>=bb.EXECUTING)return c.exports;c.status=bb.EXECUTING;var e=c.uri;a.resolve=function(a){return t.resolve(a,e)},a.async=function(b,c){return t.use(b,c,e+"_async_"+d()),a};var f=c.factory,g=z(f)?f(a,c.exports={},c):f;return g===b&&(g=c.exports),delete c.factory,c.exports=g,c.status=bb.EXECUTED,C("exec",c),g},t.resolve=function(a,b){var c={id:a,refUri:b};return C("resolve",c),c.uri||u.resolve(c.id,b)},t.define=function(a,c,d){var e=arguments.length;1===e?(d=a,a=b):2===e&&(d=c,y(a)?(c=a,a=b):c=b),!y(c)&&z(d)&&(c=s(""+d));var f={id:a,uri:t.resolve(a),deps:c,factory:d};if(!f.uri&&L.attachEvent){var g=r();g&&(f.uri=g.src)}C("define",f),f.uri?t.save(f.uri,f):Z=f},t.save=function(a,b){var c=t.get(a);c.status<bb.SAVED&&(c.id=b.id||a,c.dependencies=b.deps||[],c.factory=b.factory,c.status=bb.SAVED)},t.get=function(a,b){return Y[a]||(Y[a]=new t(a,b))},t.use=function(b,c,d){var e=t.get(d,y(b)?b:[b]);e.callback=function(){for(var b=[],d=e.resolve(),f=0,g=d.length;g>f;f++)b[f]=Y[d[f]].exec();c&&c.apply(a,b),delete e.callback},e.load()},t.preload=function(a){var b=v.preload,c=b.length;c?t.use(b,function(){b.splice(0,c),t.preload(a)},v.cwd+"_preload_"+d()):a()},u.use=function(a,b){return t.preload(function(){t.use(a,b,v.cwd+"_use_"+d())}),u},t.define.cmd={},a.define=t.define,u.Module=t,v.fetchedList=_,v.cid=d,u.require=function(a){var b=t.get(t.resolve(a));return b.status<bb.EXECUTING&&(b.onload(),b.exec()),b.exports};var cb=/^(.+?\/)(\?\?)?(seajs\/)+/;v.base=(P.match(cb)||["",P])[1],v.dir=P,v.cwd=M,v.charset="utf-8",v.preload=function(){var a=[],b=location.search.replace(/(seajs-\w+)(&|$)/g,"$1=1$2");return b+=" "+L.cookie,b.replace(/(seajs-\w+)=1/g,function(b,c){a.push(c)}),a}(),u.config=function(a){for(var b in a){var c=a[b],d=v[b];if(d&&w(d))for(var e in c)d[e]=c[e];else y(d)?c=d.concat(c):"base"===b&&("/"!==c.slice(-1)&&(c+="/"),c=l(c)),v[b]=c}return C("config",a),u}}}(this);
function toMoney(v) {
	return (!v || isNaN(v)) ? "0.00" : Math.abs(Math.ceil(Math.floor(parseFloat(v) * 1000000) / 10000) / 100).toFixed(2)
};
function toRate(v) {
	return (!v || isNaN(v)) ? "0.0000" : Math.abs(parseFloat(v)).toFixed(4)
};
function blurToMoney(t) {
	if($.trim(t.value).length)
	t.value=toMoney(t.value)
};
function blurToRate(t) {
	if($.trim(t.value).length)
		t.value=toRate(t.value)
};
function fixMoney(t){
	t=t.toString().slice("");
	var s="";
	if(t.length<3){
		s="0."+(t.length==1?"0":"")+t
	}else{
		for (var l=t.length,i=0; i<l; i++) {
			s+=t[i];
			if(l-i==3) s+=".";
			if(l-i>5 && (l-i-2)%3==1) s+=","
		}
	}
	return s
}
function showMax(t,l){
	var $t=$(t).next();
	if(!$t.is(".formError"))
		if(t.value.length==l)
			$t.html("Max "+l+" characters")
		else
			$t.html("")
}
function BankCodeFormat(val,l){
	val = $.trim(val).split("-").join("")
	var i=l.split("-"),
		j=0,
		k=i.length,
		vl=i[j]-0,
		r=val.substring(0, vl);
	for(j++;j<k;j++){
		if(val.length>vl){
			vl+=i[j]-0;
			r+="-"+val.substring(vl-i[j],vl);
		}else
			break;
	}
	return r||val;
}
function resetForm(t){
	$(t).find("input").not(".no_rst").each(function(){
		this.type=="text"&&(this.value="");
		this.type=="checkbox"&&(this.checked=false);
	}).end().end().find("select").not(".no_rst").not(":last").val("")
}
function showLength(t,p,max){
	var $t=$(t).on("keyup",function(){
		var l=$.trim(this.value.length),s=max-l;
		if(l>max){
			$p.addClass("red").html("You have entered more than "+max+" characters");
		}else{
			$p.removeClass("red").html("You have entered <span class='red'>" + l + "</span> characters," + "<span class='red'>" + s + "</span> spaces left.");
		}
	}),$p=$(p);
	$t.trigger("keyup")
}
function accSub(arg1,arg2) {
	var r1,r2,m,n;
	try {
		r1=arg1.toString().split(".")[1].length;
	} catch (e) {
		r1=0;
	}
	try {
		r2=arg2.toString().split(".")[1].length;
	} catch (e) {
		r2=0;
	}
	m=Math.pow(10,Math.max(r1,r2));
	n=(r1 >= r2) ? r1 : r2;
	return ((arg1 * m - arg2 * m) / m).toFixed(n) - 0;
};
Number.prototype.sub=function(arg) {
	return accSub(this,arg);
};
function accDiv(arg1,arg2) {
	var t1=0,
		t2=0,
		r1,r2;
	try {
		t1=arg1.toString().split(".")[1].length;
	} catch (e) {}
	try {
		t2=arg2.toString().split(".")[1].length;
	} catch (e) {}
	with(Math) {
		r1=Number(arg1.toString().replace(".",""));
		r2=Number(arg2.toString().replace(".",""));
		return (r1 / r2) * pow(10,t2 - t1);
	}
};
Number.prototype.div=function(arg) {
	return accDiv(this,arg);
};
function accMul(arg1,arg2) {
	var m=0,
		s1=arg1.toString(),
		s2=arg2.toString();
	try {
		m += s1.split(".")[1].length;
	} catch (e) {}
	try {
		m += s2.split(".")[1].length;
	} catch (e) {}
	return Number(s1.replace(".","")) * Number(s2.replace(".","")) / Math.pow(10,m);
};
Number.prototype.mul=function(arg) {
	return accMul(arg,this);
};
function accAdd(arg1,arg2) {
	var r1,r2,m;
	try {
		r1=arg1.toString().split(".")[1].length
	} catch (e) {
		r1=0
	}
	try {
		r2=arg2.toString().split(".")[1].length
	} catch (e) {
		r2=0
	}
	m=Math.pow(10,Math.max(r1,r2));
	arg1=arg1 - 0;
	arg2=arg2 - 0;
	return (parseInt(arg1.mul(m)) + parseInt(arg2.mul(m))).div(m);
};
Number.prototype.add=function(arg) {
	return accAdd(arg,this);
};
//[#if language="zh"]
// window.alertip="提示";
// window.swftip=['文件错误，请重新选择','文件太大了，换张小的吧','最多上传','个文件','','每次','限定文件类型为：','未知错误，请重新选择','文件查找失败，请重新上传','连接断开，请重新上传','最多允许上传','文件上传失败，请检查网络连接是否已断开','点击上传','文件未上传完成，确认离开当前页面吗？','正在上传','您没有安装flash，无法上传文件，请安装完毕后刷新或重新打开当前页面以使上传功能启用。<br/>点击链接跳转官网下载：']
// window.vdntip=[" 此处不可空白", " 请选择一个项目", " 该选项为必选", " 日期范围不可空白", " 无效的 ", " 日期范围", " 时间范围", " 最少 ", " 最多 ", " 个字符", " 至少填写其中一项", " 最小值为 ", " 最大值为 ", " 日期需在 ", " 日期需在 ", " 之前", " 之后", " 最多选择 ", " 最少选择 ", " 个项目", " 两次输入的密码不一致", " 无效的信用卡号码", " 无效的电话号码", " 无效的邮件地址", " 无效的整数", " 无效的数值", " 无效的日期，格式必需为 ", " 无效的 IP 地址", " 无效的网址", " 只能填写数字", " 只能填写英文字母", " 只能填写数字与英文字母", " 无效的日期格式", " 无效的日期或时间格式", " 可接受的格式： ", ' 或 ', " 只能填写中文汉字", " 无效的身份证号码", " 无效的身份证号码", " 无效的邮政编码", " 无效的 QQ 号码"," 只能填写中文，英文字母，数字和空格"," 只能填写中文，英文字母和空格"]
// window.banktip=["选择银行","请选择银行","请选择省份","请选择城市","选择区县","保存","取消"];
// [#else]
window.alertip="Notice";
window.swftip=['File format error,please reselect','Please uplaod a smaller size image','Max ',' file','s',' at a time','Only type is ','Unknown error,please reselect','Document uplaod fail,please re-upload','Connection error,please re-upload','You can choose up to ','File upload fail,please check your internet connection','Click to upload','The documents selected have not fully uploaded yet. Are you sure you want to leave the current page？','Uploading','Document cannot be uploaded without adobe flash player installed. Please refresh to upload after flash installed. Click to download now:']
window.vdntip=[" This field cannot be left blank"," Please select at least one item"," This field is mandatory"," Please select the date range"," Invalid "," Date range"," Time frame"," Min "," Max "," characters"," Please fill out at least one field"," Minimum value "," Maximum value "," The date you select must be before "," The date you select must be after ","",""," You can select up to "," You should select at least "," items at a time"," The two passwords you entered did not match"," Invalid credit card number"," Invalid mobile number"," Invalid email address"," Invalid integer","Invalid number"," Invalid data. Format must be number"," Invalid IP address"," Invalid URL"," Numbers only"," Letters only"," Letters or numbers only"," Invalid data format"," Invalid date or time format","Acceptable format： "," or "," Must be chinese characters"," Invalid ID number"," 无效的身份证号码"," 无效的邮政编码"," 无效的 QQ 号码","  Chinese, letters or numbers only","  Chinese or letters only"]
window.banktip=["Select Bank","Select bank","Select province","Select city","Select counties","Submit","Cancel"];
// [/#if]
seajs.use("jquery",function(){
	$(function(){
		$(".blurToMoney").on("blur",function(){
			blurToMoney(this)
		})
		$(".BankCodeFormat").on({
			focus:function(){
				var $t=$(this);
				$("body").append('<b id="b_bcf"></b>')
				$("#b_bcf").html($t.val()?BankCodeFormat($t.val(),$t.data("bfl")):"银行卡号").css({
					left:$t.offset().left,
					top:$t.offset().top-40
				}).show();
			},
			keyup:function(){
				var $t=$(this);
				$("#b_bcf").html($t.val()?BankCodeFormat($t.val(),$t.data("bfl")):"银行卡号")
			},
			blur:function(){
				var $b_bcf=$("#b_bcf"),
					bh=$b_bcf.html()
				$(this).val(bh=="银行卡号"?"":bh)
				$b_bcf.remove()
			}
		})
		$(".btn,.btn_i").not(":contains(eset)").on("click",function(){
			var $t=$(this);
			if(!$t.is(".disabled")){
				$t.addClass("loading");
				setTimeout(function(){
					$t.removeClass("loading").prop("disabled",false);
				},999)
			}
		})
		$("form").on("submit",function(){
			var $t=$(this).find("button").filter('[type="submit"]').prop("disabled",true);
		})
		$(".slide").on("click",function(){
			$(this).toggleClass("hide_next")
		})
	})
});