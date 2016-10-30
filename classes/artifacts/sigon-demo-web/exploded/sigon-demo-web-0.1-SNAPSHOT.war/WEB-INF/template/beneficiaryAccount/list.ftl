<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">BeneficiaryAccount List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Country</label>
                <input type="text" id="country" name="country" value="${beneficiaryAccount.country}" >
            </p>
            <p class="f_1p">
                <label class="f_info">AccountName</label>
                <input type="text" id="accountName" name="accountName" value="${beneficiaryAccount.accountName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">BankBranch</label>
                <input type="text" id="bankBranch" name="bankBranch" value="${beneficiaryAccount.bankBranch}" >
            </p>
            <p class="f_1p">
                <label class="f_info">BranchAddress</label>
                <input type="text" id="branchAddress" name="branchAddress" value="${beneficiaryAccount.branchAddress}" >
            </p>
            <p class="f_1p">
                <label class="f_info">BankName</label>
                <input type="text" id="bankName" name="bankName" value="${beneficiaryAccount.bankName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">AccountNumber</label>
                <input type="text" id="accountNumber" name="accountNumber" value="${beneficiaryAccount.accountNumber}" >
            </p>
            <p class="f_1p">
                <label class="f_info">IdNumber</label>
                <input type="text" id="idNumber" name="idNumber" value="${beneficiaryAccount.idNumber}" >
            </p>
            <p class="f_1p">
                <label class="f_info">BeneficiaryAddress</label>
                <input type="text" id="beneficiaryAddress" name="beneficiaryAddress" value="${beneficiaryAccount.beneficiaryAddress}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Reference</label>
                <input type="text" id="reference" name="reference" value="${beneficiaryAccount.reference}" >
            </p>
            <p class="f_1p">
                <label class="f_info">UnionCode</label>
                <input type="text" id="unionCode" name="unionCode" value="${beneficiaryAccount.unionCode}" >
            </p>
            <p class="f_1p">
                <label class="f_info">IdName</label>
                <input type="text" id="idName" name="idName" value="${beneficiaryAccount.idName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">IsPrimary</label>
                <input type="text" id="isPrimary" name="isPrimary" value="${beneficiaryAccount.isPrimary}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Currency</label>
                <input type="text" id="currency" name="currency" value="${beneficiaryAccount.currency}" >
            </p>
            <p class="f_1p">
                <label class="f_info">IsIdverify</label>
                <input type="text" id="isIdverify" name="isIdverify" value="${beneficiaryAccount.isIdverify}" >
            </p>
            <p class="f_1p">
                <label class="f_info">BeneficiaryId</label>
                <input type="text" id="beneficiaryId" name="beneficiaryId" value="${beneficiaryAccount.beneficiaryId}" >
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>
        <a href="add.action" class="btn add" data-icon="a">Add</a>
    </menu>
    <div class="table">
        <table>
            <tr>
                <th>country</th>
                <th>accountName</th>
                <th>bankBranch</th>
                <th>branchAddress</th>
                <th>bankName</th>
                <th>accountNumber</th>
                <th>idNumber</th>
                <th>beneficiaryAddress</th>
                <th>reference</th>
                <th>unionCode</th>
                <th>idName</th>
                <th>isPrimary</th>
                <th>currency</th>
                <th>isIdverify</th>
                <th>beneficiaryId</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>

<td> ${item.country} </td>
<td> ${item.accountName} </td>
<td> ${item.bankBranch} </td>
<td> ${item.branchAddress} </td>
<td> ${item.bankName} </td>
<td> ${item.accountNumber} </td>
<td> ${item.idNumber} </td>
<td> ${item.beneficiaryAddress} </td>
<td> ${item.reference} </td>
<td> ${item.unionCode} </td>
<td> ${item.idName} </td>
<td> ${item.isPrimary} </td>
<td> ${item.currency} </td>
<td> ${item.isIdverify} </td>
<td> ${item.beneficiaryId} </td>                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                         <a href="edit.action?id=${item.id}" class="edit" data-icon="e">Edit</a>
                    </span>
                </td>
            </tr>
        [/#list]
        </table>
    [@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
        [#include "/include/pagination.ftl"]
    [/@pagination]
    </div>
</form>

<script>

    seajs.use(["alert","validation"], function (alertM) {
        $("#reset").on("click",function(){
            $("#status").val("1");
        })

        window.refresh=function(t){
            if(t)
                window.location.reload()
            alertM.remove()
        }
    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>
