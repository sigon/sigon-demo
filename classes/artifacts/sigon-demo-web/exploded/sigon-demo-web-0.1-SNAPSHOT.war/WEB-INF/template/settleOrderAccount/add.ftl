<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${settleOrderAccount.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Country</label>
            <input type="text" id="country" name="country" value="${settleOrderAccount.country}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>UnionCode</label>
            <input type="text" id="unionCode" name="unionCode" value="${settleOrderAccount.unionCode}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Amount</label>
            <input type="text" id="amount" name="amount" value="${settleOrderAccount.amount}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>OrderNo</label>
            <input type="text" id="orderNo" name="orderNo" value="${settleOrderAccount.orderNo}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>AccountName</label>
            <input type="text" id="accountName" name="accountName" value="${settleOrderAccount.accountName}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BankBranch</label>
            <input type="text" id="bankBranch" name="bankBranch" value="${settleOrderAccount.bankBranch}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Fee</label>
            <input type="text" id="fee" name="fee" value="${settleOrderAccount.fee}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BankNameId</label>
            <input type="text" id="bankNameId" name="bankNameId" value="${settleOrderAccount.bankNameId}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Currency</label>
            <input type="text" id="currency" name="currency" value="${settleOrderAccount.currency}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Remark</label>
            <input type="text" id="remark" name="remark" value="${settleOrderAccount.remark}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>AccountNumber</label>
            <input type="text" id="accountNumber" name="accountNumber" value="${settleOrderAccount.accountNumber}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>User</label>
            <input type="text" id="user" name="user" value="${settleOrderAccount.user}" data-v="validate[required,maxSize[20]]">
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
