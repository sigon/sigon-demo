<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body class="iframe">
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${currencyPair.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>

            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>BaseCurrency</label>
                <select name="baseCurrency" id="baseCurrency">
                [#list currencyList as item]
                    [#if item.descEng!="CNY"&&item.descEng!="NZD"]
                        <option value="${item.descEng}" >${item.descEng}</option>
                    [/#if]
                [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>TradeCurrency</label>
                <select name="tradeCurrency" id="tradeCurrency">
                [#list currencyList as item]
                    [#if item.descEng!="CNY"&&item.descEng!="NZD"]
                        <option value="${item.descEng}" >${item.descEng}</option>
                    [/#if]
                [/#list]
                </select>
            </p>
        </div>
    <p>
        <a href="javascript:" id="cancel" class="btn" data-icon="p" >Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>

    </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {

        $("#baseCurrency").on("change",function(){
            var c1=$("#baseCurrency").val(),c2=$("#tradeCurrency").val();
            var $t=$(this),html="";
            [#list currencyList as item]
                [#if item.descEng!="CNY"&&item.descEng!="NZD"]
                if("${item.descEng}"!=$t.val()){
                    html+= '<option '+($("#tradeCurrency").val()=='${item.descEng}'?'selected':'')+' value="${item.descEng}" >${item.descEng}</option>';
                }
                [/#if]
            [/#list]
            $("#tradeCurrency").html(html)
        }).trigger("change");
        $("#tradeCurrency").on("change",function(){
            var c1=$("#baseCurrency").val(),c2=$("#tradeCurrency").val();
            var $t=$(this),html="";
        [#list currencyList as item]
            [#if item.descEng!="CNY"&&item.descEng!="NZD"]
                if("${item.descEng}"!=$t.val()){
                    html+= '<option '+($("#baseCurrency").val()=='${item.descEng}'?'selected':'')+' value="${item.descEng}" >${item.descEng}</option>';
                }
            [/#if]
        [/#list]
            $("#baseCurrency").html(html)
        })

        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                window.parent.refresh(1)
            })
            return false

        })
        $("#cancel").on("click",function(){
            window.parent.refresh()
        })
    })
</script>
</body>
</html>
