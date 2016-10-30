<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${purchaseOrderAccount.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>SettlementNo</label>
            <input type="text" id="settlementNo" name="settlementNo" value="${purchaseOrderAccount.settlementNo}" data-v="validate[required,]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>FromAccountNumber</label>
            <input type="text" id="fromAccountNumber" name="fromAccountNumber" value="${purchaseOrderAccount.fromAccountNumber}" data-v="validate[required,maxSize[25]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Amount</label>
            <input type="text" id="amount" name="amount" value="${purchaseOrderAccount.amount}" data-v="validate[required,maxSize[5]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>FromCountry</label>
            <input type="text" id="fromCountry" name="fromCountry" value="${purchaseOrderAccount.fromCountry}" data-v="validate[required,maxSize[25]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>FromBankBranch</label>
            <input type="text" id="fromBankBranch" name="fromBankBranch" value="${purchaseOrderAccount.fromBankBranch}" data-v="validate[required,maxSize[50]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>FromAccountName</label>
            <input type="text" id="fromAccountName" name="fromAccountName" value="${purchaseOrderAccount.fromAccountName}" data-v="validate[required,maxSize[25]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Fee</label>
            <input type="text" id="fee" name="fee" value="${purchaseOrderAccount.fee}" data-v="validate[required,maxSize[5]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Remark</label>
            <input type="text" id="remark" name="remark" value="${purchaseOrderAccount.remark}" data-v="validate[required,maxSize[100]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">ToBankBranch</label>
            <input type="text" id="toBankBranch" name="toBankBranch" value="${purchaseOrderAccount.toBankBranch}" data-v="validate[maxSize[50]]">
        </p>
        <p class="f_1p">
            <label class="f_info">FromUnionCode</label>
            <input type="text" id="fromUnionCode" name="fromUnionCode" value="${purchaseOrderAccount.fromUnionCode}" data-v="validate[maxSize[10]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">ToCountry</label>
            <input type="text" id="toCountry" name="toCountry" value="${purchaseOrderAccount.toCountry}" data-v="validate[maxSize[25]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>ToAccountName</label>
            <input type="text" id="toAccountName" name="toAccountName" value="${purchaseOrderAccount.toAccountName}" data-v="validate[required,maxSize[25]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>FromBankName</label>
            <input type="text" id="fromBankName" name="fromBankName" value="${purchaseOrderAccount.fromBankName}" data-v="validate[required,maxSize[25]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>ToAccountNumber</label>
            <input type="text" id="toAccountNumber" name="toAccountNumber" value="${purchaseOrderAccount.toAccountNumber}" data-v="validate[required,maxSize[25]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>FromBankNameId</label>
            <input type="text" id="fromBankNameId" name="fromBankNameId" value="${purchaseOrderAccount.fromBankNameId}" data-v="validate[required,maxSize[9]]">
        </p>
        <p class="f_1p">
            <label class="f_info">ToBankNameId</label>
            <input type="text" id="toBankNameId" name="toBankNameId" value="${purchaseOrderAccount.toBankNameId}" data-v="validate[maxSize[9]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">ToUnionCode</label>
            <input type="text" id="toUnionCode" name="toUnionCode" value="${purchaseOrderAccount.toUnionCode}" data-v="validate[maxSize[10]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>PurchaseNo</label>
            <input type="text" id="purchaseNo" name="purchaseNo" value="${purchaseOrderAccount.purchaseNo}" data-v="validate[required,maxSize[25]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>ToBankName</label>
            <input type="text" id="toBankName" name="toBankName" value="${purchaseOrderAccount.toBankName}" data-v="validate[required,maxSize[25]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Currency</label>
            <input type="text" id="currency" name="currency" value="${purchaseOrderAccount.currency}" data-v="validate[required,maxSize[2]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>User</label>
            <input type="text" id="user" name="user" value="${purchaseOrderAccount.user}" data-v="validate[required,maxSize[10]]">
        </p>
        <p class="f_1p">
            <label class="f_info">ProviderName</label>
            <input type="text" id="providerName" name="providerName" value="${purchaseOrderAccount.providerName}" data-v="validate[maxSize[25]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">Direction</label>
            <input type="text" id="direction" name="direction" value="${purchaseOrderAccount.direction}" data-v="validate[maxSize[5]]">
        </p>

    <p>
        <a href="javascript:" id="cancel" class="btn"  >Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue">Submit</Button>
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
