<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${tradingOrder.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info">BranchId</label>
            <input type="text" id="branchId" name="branchId" value="${tradingOrder.branchId}" data-v="validate[maxSize[9]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>OrderNo</label>
            <input type="text" id="orderNo" name="orderNo" value="${tradingOrder.orderNo}" data-v="validate[required,maxSize[25]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">Data</label>
            <input type="text" id="data" name="data" value="${tradingOrder.data}" data-v="validate[maxSize[5]]">
        </p>
        <p class="f_1p">
            <label class="f_info">Remark</label>
            <input type="text" id="remark" name="remark" value="${tradingOrder.remark}" data-v="validate[maxSize[25]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">SellCurrency</label>
            <input type="text" id="sellCurrency" name="sellCurrency" value="${tradingOrder.sellCurrency}" data-v="validate[maxSize[2]]">
        </p>
        <p class="f_1p">
            <label class="f_info">PriceLocked</label>
            <input type="text" id="priceLocked" name="priceLocked" value="${tradingOrder.priceLocked}" data-v="validate[maxSize[5]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">IsFinish</label>
            <input type="text" id="isFinish" name="isFinish" value="${tradingOrder.isFinish}" data-v="validate[maxSize[5]]">
        </p>
        <p class="f_1p">
            <label class="f_info">BuyCurrency</label>
            <input type="text" id="buyCurrency" name="buyCurrency" value="${tradingOrder.buyCurrency}" data-v="validate[maxSize[2]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">DelFlag</label>
            <input type="text" id="delFlag" name="delFlag" value="${tradingOrder.delFlag}" data-v="validate[maxSize[5]]">
        </p>
        <p class="f_1p">
            <label class="f_info">Operator</label>
            <input type="text" id="operator" name="operator" value="${tradingOrder.operator}" data-v="validate[maxSize[25]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">DepositOrder</label>
            <input type="text" id="depositOrder" name="depositOrder" value="${tradingOrder.depositOrder}" data-v="validate[maxSize[25]]">
        </p>
        <p class="f_1p">
            <label class="f_info">BuyAmount</label>
            <input type="text" id="buyAmount" name="buyAmount" value="${tradingOrder.buyAmount}" data-v="validate[maxSize[9]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">Rate</label>
            <input type="text" id="rate" name="rate" value="${tradingOrder.rate}" data-v="validate[maxSize[9]]">
        </p>
        <p class="f_1p">
            <label class="f_info">SellAmount</label>
            <input type="text" id="sellAmount" name="sellAmount" value="${tradingOrder.sellAmount}" data-v="validate[maxSize[9]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">IsDeal</label>
            <input type="text" id="isDeal" name="isDeal" value="${tradingOrder.isDeal}" data-v="validate[maxSize[5]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>FinishDate</label>
            <input type="text" id="finishDate" onclick="WdatePicker()" class="Wdate" name="finishDate" value="[#if tradingOrder.finishDate??]${tradingOrder.finishDate?date}[/#if]">
        </p>
        </div>

    <p>
        <Button type="submit" id="sbEdit" class="btn bg_blue"  data-icon="y">Submit</Button>
        <a href="javascript:" id="cancel" class="btn"   data-icon="p">Cancel</a>
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
