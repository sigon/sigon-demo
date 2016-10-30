<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
	<div id="body">
		<div id="l_body">
			<form action="/home/search.action" id="h_search">
				<div>
				<select name="searchType" id="searchType">
			[@showMenu code="0302"]
				   <option value="1">Merchant code</option>
			[/@showMenu]
			[@showMenu code="0902"]
				   <option value="2">MRP payment order no</option>
			[/@showMenu]
			[@showMenu code="0901"]
				   <option value="3">MRP transaction order no</option>
			[/@showMenu]
			[@showMenu code="0901"]
				   <option value="4">Merchant order number</option>
			[/@showMenu]
				</select>
				<input type="text" id="code" name="code">
				<button type="submit" data-icon="s" class="btn_i"></button>
				</div>
			</form>
			<div id="settleDiv" class="l_t on">
				<nav data-icon="2">Real-time exchange rate board <a href="javascript:" class="icon-sync btn_i bg_blue"></a></nav>
				<iframe id="rateIframe" src="showRate.action" frameborder="0" class="l_t_b"></iframe>
			</div>
			[@showMenu code="090301"]
			<div id="settleDiv" class="l_t">
				<nav data-icon="2">Pending accounts payable <a href="javascript:" class="icon-sync btn_i bg_blue"></a></nav>
				<iframe id="settleIframe" src="showSettle.action" frameborder="0" class="l_t_b"></iframe>
			</div>
			[/@showMenu]
			[@showMenu code="0101"]
			<div id="supportDiv" class="l_t">
				<nav data-icon="2">Pending support request <a href="javascript:" class="icon-sync btn_i bg_blue"></a></nav>
				<iframe id="supportIframe" src="showSupport.action" frameborder="0" class="l_t_b"></iframe>
			</div>
			[/@showMenu]
			[@showMenu code="100202"]
			<div id="purchaseDiv" class="l_t">
				<nav data-icon="2">Pending purchase order <a href="javascript:" class="icon-sync btn_i bg_blue"></a></nav>
				<iframe id="purchaseIframe" src="/showPurchase.action" frameborder="0" class="l_t_b"></iframe>
			</div>
			[/@showMenu]
            <div id="cashDiv" class="l_t">
                <nav data-icon="2">Pending cash order <a href="javascript:" class="icon-sync btn_i bg_blue"></a></nav>
                <iframe id="cashIframe" src="/showCash.action" frameborder="0" class="l_t_b"></iframe>
            </div>
		</div>
		<div id="m_body">
			<header>
				<ul>
					<li style="background:#000;float:right;margin:0 0 0 9px"><a href="iframe/index.html" data-icon="&#xe157;" target="_blank">Links</a>
						<div style="left:auto;right:0">
                            <a href="http://www.manula.com/manuals/cfg-global/aml-cft-programme" target="_blank">AML Programme</a>
                            <a href="https://www.world-check.com/frontend/logout/" target="_blank">World-Check</a>
                            <a href="https://latipay.cloudcheck.co.nz/direct/" target="_blank">Cloud-Check</a>
						</div>
					</li>
				</ul>
				<h1>
					<a href="javascript:">user : ${userId}</a><br>
					<a href="/login/logout.action">Log out</a>
				</h1>
				<ul id="nav">
					[#list authList as item]
						[#if item.children]
						<li><a href="${item.url}" data-icon="${item.icon}" title="[#if item.title]${item.title}[#else]${item.name}[/#if]">${item.name}</a>
							<div>
								[#list item.children as c4]
								<a href="${c4.url}?queryint=0">${c4.name}</a>
								[/#list]
							</div>
						</li>
						[/#if]
					[/#list]
				</ul>
			</header>
			<nav id="i_tab"><a href="javascript:" class="on" data-icon="1" data-id="i_f0"><u>c</u><span>Home</span></a></nav>
			<div id="i_page">
				<p id="i_tab_a">
					<a href="javascript:" class="icon-sync btn_i bg_blue"></a>
					<a href="javascript:" class="icon-c2 btn_i bg_red"></a>
				</p>
				<iframe src="/home/index.action" id="i_f0" class="on"></iframe>
			</div>
		</div>
	</div>
	<div id="resize"></div>
	<script>
	seajs.use("alert",function(alertM){
		var $l=$("#l_body")[0],
			$b=$("body"),
			$r=$("#resize").on('mousedown', function(e) {
				$b.addClass("resize")
				$d.on({
					mousemove: function(e) {
						$l_t.width(e.pageX)
						e.preventDefault();
					},
					mouseup: function() {
						$r.css("left",$l_t.width()-4);
						$b.removeClass("resize");
						$d.off('mousemove').off('mouseup');
					}
				});
				return false;
			}),
			$i_tab=$("#i_tab").on("click","a",function(){
				i_p.select(this)
			}).on("click","u",function(){
				i_p.remove(this.parentNode);
				return false;
			}),
			$i_page=$("#i_page"),
			i_f=0,
			$h_search=$("#h_search").on("submit",function(){
				$.ajax({
					url: $h_search.attr("action"),
					data: $h_search.serialize()
				}).done(function (data) {
					if (data.status == "succ") {
						var a=document.createElement("a")
						a.dataset.icon="s";
						a.innerHTML=data.title;
						a.href=data.href;
						i_p.clearOn().add(a)
					}else
						alertM(data.msg, {cls:data.status});
				});
				return false;
			}),
			$l_t=$("#l_body").on("click",".l_t",function(){
				var $t=$(this)
				if(!$t.is(".on")){
					$l_t.find(".on").removeClass("on")
					$t.addClass("on").width("99%")
					setTimeout(function(){
						$t.width("100%")
					},2)
				}
			}),$w = $(window),$d = $(document)

		window.i_p={
			clearOn:function(){
				$i_tab.find(".on").removeClass("on")
				$i_page.find(".on").removeClass("on");
				return i_p;
			},
			addOn:function(a){
				a.className="on";
				var $a=$("#"+a.dataset.id).addClass("on").width("99%")
				setTimeout(function(){
					$a.width("100%")
				},2)
			},
			select:function(a){
				i_p.clearOn().addOn(a);
			},
			add:function(a){
				i_p.clearOn();
				$i_tab.append('<a href="javascript:" title="'+(a.title||a.innerHTML)+'" class="on" data-icon="'+(a.dataset.icon||$(a).parent().prev().data("icon")||"o")+'" data-id="i_f'+(++i_f)+'"><u>c</u><span>'+(a.title||a.innerHTML)+'</span></a>')
				$i_page.append('<iframe src="'+a.href+'" id="i_f'+i_f+'" class="on"></iframe>')
				return i_p;
			},
			remove:function(a){
				if(a.className=="on"){
					i_p.addOn(a.nextSibling||a.previousSibling)
				}
				$("#"+a.dataset.id).remove();
				$(a).remove();
				return i_p;
			},
            cashOrderDelete:function($t,w){
                alertM("Are you sure to delete ?",{
                    time:"y",
                    title:"Confirm",
                    btns:[
                        {
                            txt:"Cancel"
                        },
						{
                            txt:$t.html(),
                            cls:"bg_red",
                            func:function(){
                                alertM.end("/cashOrder/delete.action",{orderNo:$t.data("itemid")},function(){
                                    w.location.reload()
                                })
                            }
                        }
                    ]
                })
            }
		}
		$("#nav").on("click","a",function(){
			i_p.add(this)
			return false;
		})
		$("#l_body a").on("click",function(){
		 $(this).parent().parent().find("iframe")[0].contentWindow.location.reload()
		})
		$("#i_tab_a a").eq(0).on("click",function(){
		 $i_page.find(".on")[0].contentWindow.location.reload()
		}).next().on("click",function(){
		 $i_tab.find("a").not(".on").each(function(){
			 i_p.remove(this)
		 })
		})
		window.refreshIframe1=function (t1){
			if(t1==null||t1==""){
				t1=1;
			}
			$('#settleIframe').attr("src","showSettle.action?pageNumber="+t1+"&random="+Math.random())
		}
		window.refreshIframe2=function (t2){
			if(t2==null||t2==""){
				t2=1;
			}
			$('#supportIframe').attr("src","showSupport.action?pageNumber="+t2+"&random="+Math.random())
		}
        window.refreshIframe3=function (t1){
            if(t1==null||t1==""){
                t1=1;
            }
            $('#cashIframe').attr("src","showCash.action?pageNumber="+t1+"&random="+Math.random())
        }
	});
	</script>
</body>
</html>