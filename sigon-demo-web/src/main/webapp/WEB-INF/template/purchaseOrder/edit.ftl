<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2 >${title}</h2>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${purchaseOrder.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info">Provider</label>
            <input type="text" readonly  id="providerId" value="${pro.name}">

            [#--<select name="providerId" id="providerId" data-v="validate[required]">--]
                [#--<option value="">Select...</option>--]
                [#--[#list listPro as item]--]
                    [#--<option value="${item.id}" [#if purchaseOrder.providerId==item.id ]selected[/#if]>${item.name}</option>--]
                [#--[/#list]--]
            [#--</select>--]
        </p>
        <p class="f_1p">
            <label class="f_info">Purchase Type</label>
                    <input type="text" readonly  id="purchaseType" value="${purchaseTypeMap.get(purchaseOrder.purchaseType).desc}">

            [#--<select name="purchaseType" id="purchaseType" data-v="validate[required]">--]
                [#--<option value="">Select...</option>--]
            [#--[#list purchaseTypeList as item]--]
                [#--<option value="${item.code}" [#if purchaseOrder.purchaseType==item.code]selected[/#if]>${item.desc}</option>--]
            [#--[/#list]--]
            [#--</select>--]
        </p>
        </div>

        <div>
            <p class="f_1p" style="width: 40%">
            <label class="f_info">Buy currency&amount</label>
                <input type="text" readonly id="s1" class="f_short" value="${purchaseOrder.buyCurrency}">
            [#--<select name="buyCurrency" id="s1" class="f_short">--]
                [#--[#list currencyList as item]--]
                    [#--<option value="${item.descEng}" [#if purchaseOrder.buyCurrency==item.descEng]selected[/#if]>${item.descEng}</option>--]
                [#--[/#list]--]
            [#--</select>--]
            <input type="text" id="amt1" readonly style="width: 240px;" value="[@number num = purchaseOrder.buyAmount formatStr="##0.00"][/@number]" >
                *<span></span>
            <p class="f_1p" style="width: 20%">

            <label class="f_info">Rate</label>
            <input type="text" id="rateDouble" readonly value="[#if purchaseOrder.purchaseType==2][@number num = purchaseOrder.midRate formatStr="##0.0000" m=100000][/@number][#else][@number num = purchaseOrder.rate formatStr="##0.0000" m=100000][/@number][/#if]" >
            </p>
            <p class="f_1p" style="width: 40%">
            <label class="f_info">Sell currency&amount[#if purchaseOrder.purchaseType==2](intermediary)[/#if]</label>
                =
                <input type="text" readonly id="s2" class="f_short" value="[#if purchaseOrder.purchaseType==2]${purchaseOrder.midCurrency}[#else]${purchaseOrder.sellCurrency}[/#if]">
            [#--<select name="sellCurrency" id="s2" class="f_short">--]
            [#--[#list currencyList as item]--]
                [#--<option value="${item.descEng}" [#if purchaseOrder.sellCurrency==item.descEng]selected[#elseif item.descEng=="USD"]selected[/#if]>${item.descEng}</option>--]
            [#--[/#list]--]
            [#--</select>--]
            <input type="text" style="width: 240px;" id="amt2" readonly value="[#if purchaseOrder.purchaseType==2][@number num = purchaseOrder.midAmount formatStr="##0.00"][/@number][#else][@number num = purchaseOrder.sellAmount formatStr="##0.00"][/@number][/#if]">
        </p>
        </div>

        <div id="d1" [#if purchaseOrder.purchaseType==1]style="display: none;"[/#if]>
            <p class="f_1p" style="width: 40%">
                <label class="f_info">Buy currency&amount(intermediary)</label>
                <input type="text" readonly class="f_short" id="midCurr" value="${purchaseOrder.midCurrency}">
                <input type="text" style="width: 240px;" readonly id="midAmt" value="[@number num = purchaseOrder.midAmount formatStr="##0.00"][/@number]">
                *
            <p class="f_1p" style="width: 20%">
                <label class="f_info">Rate</label>
                <input type="text" id="midRateDouble" readonly value="[@number num = purchaseOrder.rate formatStr="##0.0000" m=100000][/@number]">
            </p>
            <p  class="f_1p" style="width: 40%">
            <label class="f_info">Sell currency&amount</label>
            =
                <input type="text" readonly  id="s3" class="f_short" value="${purchaseOrder.sellCurrency}">
            [#--<select name="midCurrency" id="s3" class="f_short">--]
            [#--[#list currencyList as item]--]
                [#--<option value="${item.descEng}" [#if purchaseOrder.midsellCurrency==item.descEng]selected[/#if]>${item.descEng}</option>--]
            [#--[/#list]--]
            [#--</select>--]
            <input type="text" style="width: 240px;" id="amt3" readonly value="[@number num = purchaseOrder.sellAmount formatStr="##0.00"][/@number]">
            </p>
        </div>
        <div>
            <p>
                <label class="f_info"><span data-icon="S"  ></span>Settle Date</label>
                <input type="text" style="width: 200px;" [#if action=="update"&&purchaseOrder.receivable!=2||purchaseOrder.payable!=2]readonly [#else]onclick="WdatePicker()"[/#if] data-v="validate[required]" id="settleDate"  class="Wdate" name="settleDateStr" value="[#if purchaseOrder.settleDate??]${purchaseOrder.settleDate?string("yyyy-MM-dd")}[/#if]">
            </p>

        </div>
        <div>
            <p>
                <label class="f_info">Comment</label>
                <input type="text" id="comment" [#if action=="update"&&purchaseOrder.receivable!=2||purchaseOrder.payable!=2]readonly[/#if] name="comment" value="${purchaseOrder.comment}" data-v="validate[maxSize[100]]">
            </p>
        </div>

        <p>
            <a href="javascript:" id="cancel" class="btn" data-icon="p" >Cancel</a>
            [#if purchaseOrder.payable==2&&purchaseOrder.receivable==2&&purchaseOrder.delFlag!=1]
                <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>
            [/#if]

        </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        [#if msg??]
            alertM("当前订单没有编辑权限",{cls:"${msg}",rf:function(){
                window.location.href="/purchaseOrder/list.action";
        }})
        [/#if]

        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                window.location.href="/purchaseOrder/list.action"
            })
            return false

        })

        $("#cancel").on("click",function() {
            var fromUrl = "${fromUrl}";
            if (fromUrl != "") {
                window.location.href = fromUrl;
            } else {
                window.location.href = "/purchaseOrder/list.action?queryint=0";
            }
        })
    })
</script>
</body>
</html>
