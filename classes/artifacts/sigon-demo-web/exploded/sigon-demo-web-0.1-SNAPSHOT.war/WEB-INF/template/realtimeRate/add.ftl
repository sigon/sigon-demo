<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body class="iframe">
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Symbol</label>
            <input type="text" id="symbol" name="symbol" [#if action="update"]disabled[/#if] value="${realtimeRate.symbol}" data-v="validate[required,maxSize[10]]">
            <input type="hidden" id="symbolVal" name="symbolVal" value="${realtimeRate.symbol}">
        </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>XhBuy</label>
                <input type="text" id="buy" name="buy" value="[@number num=realtimeRate.xhBuy m=100000 formatStr="0.00###" ][/@number]" data-v="validate[required,custom[number],maxSize[20]]">
            </p>
        </div>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S" ></span>XhSell</label>
                <input type="text" id="sell" name="sell" value="[@number num=realtimeRate.xhSell m=100000 formatStr="0.00###"][/@number]" data-v="validate[required,custom[number],maxSize[20]]">
            </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S" ></span>Source</label>
            <input type="text" id="source" name="source" value="${realtimeRate.source}" data-v="validate[required,maxSize[10]]">
        </p>

        </div>

    <p>
        <a href="javascript:" id="cancl" class="btn" data-icon="p">Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>
    </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                window.parent.refresh(1)
            })
            return false

        })
        $("#cancl").on("click",function(){
            window.parent.refresh()
        })
    })
</script>
</body>
</html>
