<!DOCTYPE html>
<html>
<head>
    [#include "/include/head.ftl"]
        <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<header>
    <h1>
        <a href="javascript:" target="m_body">user : ${Session['loginStaff'].realName}</a>
        <a href="/login/logout.action">Log out</a>
    </h1>
    <ul id="nav">
        [#--<li><a target="m_body" href="/merchantInfo/list.action?flag=1&status=0&queryint=0&validChildren=true" data-icon="E" title="Monitor">Monitor</a>--]
            [#--<div>--]
                [#--<a href="/merchantInfo/list.action?flag=1&status=0&queryint=0" target="m_body">User Info</a>--]
            [#--</div>--]
        [#--</li>--]
[@showMenu url="/home/index.action?flag=1&validChildren=true" hasChildren="true" urlResourceCode="11"]
        <li class="on"><a target="m_body" href="/home/index.action?flag=1&validChildren=true" data-icon="E" title="Home">Home</a>
            <div>
                [@showMenu url="/home/index.action?flag=1"]
                 <a href="/home/index.action?flag=1" target="m_body">home</a>
                [/@showMenu]
            </div>
        </li>
[/@showMenu]

        [#--[#if Session['loginStaff'].id == '00']--]
[@showMenu url="/configuration/list.action?queryint=0&validChildren=true" hasChildren="true" urlResourceCode="12"]
        <li><a target="m_body" href="/configuration/list.action?queryint=0" data-icon="5" title="Developer">Developer</a>
            <div>
                [@showMenu url="/configuration/list.action?queryint=0"]
                    <a href="/configuration/list.action?queryint=0" target="m_body">Configuration</a>
                [/@showMenu]
                [@showMenu url="/holidayNz/config.action"]
                    <a href="/holidayNz/config.action" target="m_body">Config Holiday(NZ)</a>
                [/@showMenu]
                [@showMenu url="/sendLog/monitor.action?queryint=0&isPostBack=false"]
                    <a href="/sendLog/monitor.action?queryint=0&isPostBack=false" target="m_body">Send Log Monitor</a>
                [/@showMenu]
                [@showMenu url="/rpcLog/list.action?queryint=0&isPostBack=false"]
                    <a href="/rpcLog/list.action?queryint=0&isPostBack=false" target="m_body">Rpc Log</a>
                [/@showMenu]
                [@showMenu url="/warnNotice/list.action?queryint=0"]
                    <a href="/warnNotice/list.action?queryint=0" target="m_body">Warn Notice List</a>
                [/@showMenu]
                [#--<a href="/configuration/configMerchantOperate.action" target="m_body">Config Merchant Operate</a>--]
                [#--<a href="/configuration/configPaymentType.action" target="m_body">Config Payment Type</a>--]
                [#--<a href="/holidayNz/config.action" target="m_body">Config Holiday(NZ)</a>--]
                [#--<a href="/sendLog/monitor.action?queryint=0&isPostBack=false" target="m_body">Send Log Monitor</a>--]
                [#--<a href="/rpcLog/list.action?queryint=0&isPostBack=false" target="m_body">Rpc Log</a>--]
                [#--<a href="/exchangeRate/exchangeRateList.action?queryint=0&isPostBack=false" target="m_body">ExchangeRate List</a>--]
                [#--<a href="/configuration/rateComparedChar.action?queryint=0&isPostBack=false" target="m_body">ExchangeRate Chart</a>--]
                [#--<a href="/warnNotice/list.action?queryint=0&isPostBack=false" target="m_body">Warn Notice List</a>--]
            </div>
        </li>
[/@showMenu]
    [#--[/#if]--]
    </ul>
    <script>
        seajs.use("jquery",function(){
            $("#nav li").each(function(){
                if($(this).find("a").length<2)
                    this.style.display="none"
            })
        })
    </script>
</header>
[#--<div id="l_body" data-mid="">--]
    [#--<div class="l_page">--]
        [#--<div class="l_info">--]
            [#--<p class="no_data">No Data</p>--]
        [#--</div>--]
        [#--<div class="l_form">--]
            [#--<form action="">--]
                [#--<input type="text" id="Wdate1" required name="startCreateDate" onClick="WdatePicker()" onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'Wdate2\')}'})" class="Wdate"><input id="Wdate2" required type="text" name="endCreateDate" onClick="WdatePicker()" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'Wdate1\')}'})" class="Wdate">--]
                [#--<button class="btn_i bg_blue" type="submit">s</button>--]
            [#--</form>--]
            [#--<form action="">--]
                [#--<textarea name="remark" required></textarea>--]
                [#--<input name="code" type="text" required>--]
                [#--<button class="btn_i bg_blue" type="submit">m</button>--]
            [#--</form>--]
        [#--</div>--]
    [#--</div>--]
    [#--<div class="l_page">--]
        [#--<div class="l_info">--]
            [#--<p class="no_data">No Data</p>--]
        [#--</div>--]
        [#--<div class="l_form">--]
            [#--<form action="">--]
                [#--<input type="text" id="Wdate3" required name="startCreateDate" onClick="WdatePicker()" onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'Wdate4\')}'})" class="Wdate"><input id="Wdate4" required type="text" name="endCreateDate" onClick="WdatePicker()" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'Wdate3\')}'})" class="Wdate">--]
                [#--<button class="btn_i bg_blue" type="submit">s</button>--]
            [#--</form>--]
            [#--<form action="">--]
                [#--<textarea name="remark" required></textarea>--]
                [#--<input name="code" type="text" required>--]
                [#--<button class="btn_i bg_blue" type="submit">m</button>--]
            [#--</form>--]
        [#--</div>--]
    [#--</div>--]
    [#--<div class="l_page" id="l_task">--]
        [#--<div class="l_info">--]
            [#--<p class="no_data">No Data</p>--]
        [#--</div>--]
        [#--<div class="l_form">--]
            [#--<form action="">--]
                [#--<input type="text" id="Wdate3" name="startCreateDate" onClick="WdatePicker()" onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'Wdate4\')}'})" class="Wdate"><input id="Wdate4" type="text" name="endCreateDate" onClick="WdatePicker()" onFocus="WdatePicker({minDate:'#F{$dp.$D(\'Wdate3\')}'})" class="Wdate">--]
                [#--<button class="btn_i bg_blue" type="submit">s</button>--]
            [#--</form>--]
        [#--</div>--]
    [#--</div>--]
    [#--<div id="l_nav">--]
        [#--<a href="javascript:">Business</a><a href="javascript:">User</a><a class="on" href="javascript:">Task</a>--]
    [#--</div>--]
[#--</div>--]
[#--<a href="javascript:" class="btn_i bg_red" id="l_btn"></a>--]
<a href="javascript:" class="btn_i bg_red" id="r_btn"></a>
<a href="javascript:" class="btn_i bg_red" id="r_h_btn"></a>
<a href="javascript:" class="btn_i bg_red" target="r_body" id="r_t_btn">1</a>
<iframe id="m_body" name="m_body"  [#if fromUrl!=""]src="${fromUrl}"[#else]src="/home/index.action"[/#if]></iframe>
<iframe id="r_body" name="r_body" src="r_index.html"></iframe>
<script>
    seajs.use(["message","lbody"],function(message,lbody){
        window.re_title={
            time:0,
            title:"",
            go:function(){
                if(!document.title.indexOf("*"))
                    document.title=re_title.title;
                else{
                    re_title.title=document.title;
                    document.title="*!*New Task*!*";
                }
                re_title.time=setTimeout(re_title.go,999)
            },
            clear:function(){
                clearTimeout(re_title.time);
                if(re_title.title)
                    document.title=re_title.title;
                return re_title;
            }
        }

//        lbody({
//            u_add:"/merchant/addremark.action",
//            u_get:"/merchant/listremark.action",
//            b_add:"/business/findRemark.action",
//            b_get:"/business/findRemark.action",
//            t_get:"/traderNote/listjson.action?queryint=0"
//        })

        var $b=$("body"),
            $l=$("#l_body").on("click","[target='r_body']",function(){
                cis(2,this.href)
            }),
            $m=$("#m_body"),
            $r=$("#r_body"),
            $n=$("#nav").on("click","a",function(){
                $n.find(".on").removeClass("on")
                $(this).addClass("on").closest("li").addClass("on");
                $b.removeClass("r_opend")
            }),
            $l_btn=$("#l_btn").on("click",function(){
                $b.toggleClass("l_opend")
            }),
            $r_btn=$("#r_btn").on("click",function(){
                $b.toggleClass("r_opend").removeClass("r_h_opend")
            }),
            $r_h_btn=$("#r_h_btn").on("click",function(){
                $b.toggleClass("r_h_opend")
            }),
            $r_t_btn=$("#r_t_btn"),
            url=window.location.href.split("#");
        window.his=function(a){
            var b=$m[0].contentWindow.location.pathname,c=$r[0].contentWindow.location,d=$l.data("mid")||"";
            document.title=a;
            if($r_t_btn.attr("href")==c)
                $r_t_btn.removeClass("on")
            else
                $r_t_btn.addClass("on")
            history.replaceState({time:new Date().getTime()},a,url[0]+"#"+b+"#"+c.pathname+"#"+d)
        }
        window.cis=function(a,v){
            switch (a) {
                case 0:
                    $b.addClass("l_opend")
                    lbody.set(v.sendcode,v.sendtype)
                    break;
                case 1:
                    $b.removeClass("r_opend")
                    break;
                case 2:
                    $b.addClass("r_opend")
                    $r_t_btn.attr("href",v)
                    return false;
            }
        }
        if(url.length>1)
            $m.attr("src",url[1])
            //$r.attr("src",url[2])
        if(url.length>3)
            $l.data("mid",url[3])

    });
</script>
</body>
</html>