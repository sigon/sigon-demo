<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${mrpHandleOrderSplit.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Amount</label>
            <input type="text" id="amount" name="amount" value="${mrpHandleOrderSplit.amount}" data-v="validate[required,maxSize[5]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>OrderNo</label>
            <input type="text" id="orderNo" name="orderNo" value="${mrpHandleOrderSplit.orderNo}" data-v="validate[required,maxSize[10]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>PayOrderNo</label>
            <input type="text" id="payOrderNo" name="payOrderNo" value="${mrpHandleOrderSplit.payOrderNo}" data-v="validate[required,maxSize[10]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>AccountName</label>
            <input type="text" id="accountName" name="accountName" value="${mrpHandleOrderSplit.accountName}" data-v="validate[required,maxSize[25]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BankBranch</label>
            <input type="text" id="bankBranch" name="bankBranch" value="${mrpHandleOrderSplit.bankBranch}" data-v="validate[required,maxSize[50]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>City</label>
            <input type="text" id="city" name="city" value="${mrpHandleOrderSplit.city}" data-v="validate[required,maxSize[50]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Fee</label>
            <input type="text" id="fee" name="fee" value="${mrpHandleOrderSplit.fee}" data-v="validate[required,maxSize[5]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Operator</label>
            <input type="text" id="operator" name="operator" value="${mrpHandleOrderSplit.operator}" data-v="validate[required,maxSize[25]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>SpiltNo</label>
            <input type="text" id="spiltNo" name="spiltNo" value="${mrpHandleOrderSplit.spiltNo}" data-v="validate[required,maxSize[5]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Province</label>
            <input type="text" id="province" name="province" value="${mrpHandleOrderSplit.province}" data-v="validate[required,maxSize[50]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>AccountNo</label>
            <input type="text" id="accountNo" name="accountNo" value="${mrpHandleOrderSplit.accountNo}" data-v="validate[required,maxSize[25]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>GroupNo</label>
            <input type="text" id="groupNo" name="groupNo" value="${mrpHandleOrderSplit.groupNo}" data-v="validate[required,maxSize[5]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>GatewayId</label>
            <input type="text" id="gatewayId" name="gatewayId" value="${mrpHandleOrderSplit.gatewayId}" data-v="validate[required,maxSize[2]]">
        </p>
        <p class="f_1p">
            <label class="f_info">Status</label>
            <input type="text" id="status" name="status" value="${mrpHandleOrderSplit.status}" data-v="validate[maxSize[5]]">
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
