<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${mrpHandleRefundOrder.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Amount</label>
            <input type="text" id="amount" name="amount" value="${mrpHandleRefundOrder.amount}" data-v="validate[required,maxSize[5]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>OrderNo</label>
            <input type="text" id="orderNo" name="orderNo" value="${mrpHandleRefundOrder.orderNo}" data-v="validate[required,maxSize[10]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>AccountName</label>
            <input type="text" id="accountName" name="accountName" value="${mrpHandleRefundOrder.accountName}" data-v="validate[required,maxSize[25]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BankBranch</label>
            <input type="text" id="bankBranch" name="bankBranch" value="${mrpHandleRefundOrder.bankBranch}" data-v="validate[required,maxSize[50]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>City</label>
            <input type="text" id="city" name="city" value="${mrpHandleRefundOrder.city}" data-v="validate[required,maxSize[50]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Fee</label>
            <input type="text" id="fee" name="fee" value="${mrpHandleRefundOrder.fee}" data-v="validate[required,maxSize[5]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BankName</label>
            <input type="text" id="bankName" name="bankName" value="${mrpHandleRefundOrder.bankName}" data-v="validate[required,maxSize[25]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Operator</label>
            <input type="text" id="operator" name="operator" value="${mrpHandleRefundOrder.operator}" data-v="validate[required,maxSize[25]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">UnionCode</label>
            <input type="text" id="unionCode" name="unionCode" value="${mrpHandleRefundOrder.unionCode}" data-v="validate[maxSize[10]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Province</label>
            <input type="text" id="province" name="province" value="${mrpHandleRefundOrder.province}" data-v="validate[required,maxSize[50]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>AccountNo</label>
            <input type="text" id="accountNo" name="accountNo" value="${mrpHandleRefundOrder.accountNo}" data-v="validate[required,maxSize[25]]">
        </p>
        <p class="f_1p">
            <label class="f_info">ShortNameEng</label>
            <input type="text" id="shortNameEng" name="shortNameEng" value="${mrpHandleRefundOrder.shortNameEng}" data-v="validate[maxSize[10]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>GatewayId</label>
            <input type="text" id="gatewayId" name="gatewayId" value="${mrpHandleRefundOrder.gatewayId}" data-v="validate[required,maxSize[2]]">
        </p>
        <p class="f_1p">
            <label class="f_info">Status</label>
            <input type="text" id="status" name="status" value="${mrpHandleRefundOrder.status}" data-v="validate[maxSize[5]]">
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
