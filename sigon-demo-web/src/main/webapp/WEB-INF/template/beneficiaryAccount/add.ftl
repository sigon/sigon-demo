<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2 id="h2"> </h2>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${beneficiaryAccount.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Country</label>
            <input type="text" id="country" name="country" value="${beneficiaryAccount.country}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>AccountName</label>
            <input type="text" id="accountName" name="accountName" value="${beneficiaryAccount.accountName}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BankBranch</label>
            <input type="text" id="bankBranch" name="bankBranch" value="${beneficiaryAccount.bankBranch}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BranchAddress</label>
            <input type="text" id="branchAddress" name="branchAddress" value="${beneficiaryAccount.branchAddress}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BankName</label>
            <input type="text" id="bankName" name="bankName" value="${beneficiaryAccount.bankName}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>AccountNumber</label>
            <input type="text" id="accountNumber" name="accountNumber" value="${beneficiaryAccount.accountNumber}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>IdNumber</label>
            <input type="text" id="idNumber" name="idNumber" value="${beneficiaryAccount.idNumber}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BeneficiaryAddress</label>
            <input type="text" id="beneficiaryAddress" name="beneficiaryAddress" value="${beneficiaryAccount.beneficiaryAddress}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Reference</label>
            <input type="text" id="reference" name="reference" value="${beneficiaryAccount.reference}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>UnionCode</label>
            <input type="text" id="unionCode" name="unionCode" value="${beneficiaryAccount.unionCode}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>IdName</label>
            <input type="text" id="idName" name="idName" value="${beneficiaryAccount.idName}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>IsPrimary</label>
            <input type="text" id="isPrimary" name="isPrimary" value="${beneficiaryAccount.isPrimary}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Currency</label>
            <input type="text" id="currency" name="currency" value="${beneficiaryAccount.currency}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>IsIdverify</label>
            <input type="text" id="isIdverify" name="isIdverify" value="${beneficiaryAccount.isIdverify}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BeneficiaryId</label>
            <input type="text" id="beneficiaryId" name="beneficiaryId" value="${beneficiaryAccount.beneficiaryId}" data-v="validate[required,maxSize[20]]">
        </p>

    <p>
        <Button type="submit" id="sbEdit" class="btn bg_blue">Submit</Button>
        <a href="javascript:" id="cancel" class="btn" onclick="go(-1)" >Cancel</a>
    </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                window.location.href="list.action";
            })
            return false

        })
        $("#h2").html("BeneficiaryAccount " + $("#action").val() == "save"?"Add":"Edit");
    })
</script>
</body>
</html>
