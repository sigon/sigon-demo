<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${cashDetail.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info">Amount</label>
            <input type="text" id="amount" name="amount" value="${cashDetail.amount}" data-v="validate[maxSize[9]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>OrderNo</label>
            <input type="text" id="orderNo" name="orderNo" value="${cashDetail.orderNo}" data-v="validate[required,maxSize[25]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">CashholdId</label>
            <input type="text" id="cashholdId" name="cashholdId" value="${cashDetail.cashholdId}" data-v="validate[maxSize[9]]">
        </p>
        <p class="f_1p">
            <label class="f_info">Currency</label>
            <input type="text" id="currency" name="currency" value="${cashDetail.currency}" data-v="validate[maxSize[2]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">UserId</label>
            <input type="text" id="userId" name="userId" value="${cashDetail.userId}" data-v="validate[maxSize[10]]">
        </p>
        <p class="f_1p">
            <label class="f_info">TradeType</label>
            <input type="text" id="tradeType" name="tradeType" value="${cashDetail.tradeType}" data-v="validate[maxSize[5]]">
        </p>
        </div>

    <p>
        <Button type="submit" id="sbEdit" class="btn bg_blue">Submit</Button>
        <a href="javascript:" id="cancel" class="btn"  >Cancel</a>
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
        $("#cancel").on("click",function(){
            window.parent.refresh()
        })
    })
</script>
</body>
</html>
