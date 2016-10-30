<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${paymentOrderAccount.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Reference</label>
            <input type="text" id="reference" name="reference" value="${paymentOrderAccount.reference}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Country</label>
            <input type="text" id="country" name="country" value="${paymentOrderAccount.country}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>UnionCode</label>
            <input type="text" id="unionCode" name="unionCode" value="${paymentOrderAccount.unionCode}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>OrderNo</label>
            <input type="text" id="orderNo" name="orderNo" value="${paymentOrderAccount.orderNo}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>IdName</label>
            <input type="text" id="idName" name="idName" value="${paymentOrderAccount.idName}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>AccountName</label>
            <input type="text" id="accountName" name="accountName" value="${paymentOrderAccount.accountName}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BankBranch</label>
            <input type="text" id="bankBranch" name="bankBranch" value="${paymentOrderAccount.bankBranch}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BranchAddress</label>
            <input type="text" id="branchAddress" name="branchAddress" value="${paymentOrderAccount.branchAddress}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BankName</label>
            <input type="text" id="bankName" name="bankName" value="${paymentOrderAccount.bankName}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>AccountNumber</label>
            <input type="text" id="accountNumber" name="accountNumber" value="${paymentOrderAccount.accountNumber}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>IdNumber</label>
            <input type="text" id="idNumber" name="idNumber" value="${paymentOrderAccount.idNumber}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BeneficiaryAddress</label>
            <input type="text" id="beneficiaryAddress" name="beneficiaryAddress" value="${paymentOrderAccount.beneficiaryAddress}" data-v="validate[required,maxSize[20]]">
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
