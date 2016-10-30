<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">PaymentOrderAccount List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Reference</label>
                <input type="text" id="reference" name="reference" value="${paymentOrderAccount.reference}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Country</label>
                <input type="text" id="country" name="country" value="${paymentOrderAccount.country}" >
            </p>
            <p class="f_1p">
                <label class="f_info">UnionCode</label>
                <input type="text" id="unionCode" name="unionCode" value="${paymentOrderAccount.unionCode}" >
            </p>
            <p class="f_1p">
                <label class="f_info">OrderNo</label>
                <input type="text" id="orderNo" name="orderNo" value="${paymentOrderAccount.orderNo}" >
            </p>
            <p class="f_1p">
                <label class="f_info">IdName</label>
                <input type="text" id="idName" name="idName" value="${paymentOrderAccount.idName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">AccountName</label>
                <input type="text" id="accountName" name="accountName" value="${paymentOrderAccount.accountName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">BankBranch</label>
                <input type="text" id="bankBranch" name="bankBranch" value="${paymentOrderAccount.bankBranch}" >
            </p>
            <p class="f_1p">
                <label class="f_info">BranchAddress</label>
                <input type="text" id="branchAddress" name="branchAddress" value="${paymentOrderAccount.branchAddress}" >
            </p>
            <p class="f_1p">
                <label class="f_info">BankName</label>
                <input type="text" id="bankName" name="bankName" value="${paymentOrderAccount.bankName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">AccountNumber</label>
                <input type="text" id="accountNumber" name="accountNumber" value="${paymentOrderAccount.accountNumber}" >
            </p>
            <p class="f_1p">
                <label class="f_info">IdNumber</label>
                <input type="text" id="idNumber" name="idNumber" value="${paymentOrderAccount.idNumber}" >
            </p>
            <p class="f_1p">
                <label class="f_info">BeneficiaryAddress</label>
                <input type="text" id="beneficiaryAddress" name="beneficiaryAddress" value="${paymentOrderAccount.beneficiaryAddress}" >
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
                <th>reference</th>
                <th>country</th>
                <th>unionCode</th>
                <th>orderNo</th>
                <th>idName</th>
                <th>accountName</th>
                <th>bankBranch</th>
                <th>branchAddress</th>
                <th>bankName</th>
                <th>accountNumber</th>
                <th>idNumber</th>
                <th>beneficiaryAddress</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>

<td> ${item.reference} </td>
<td> ${item.country} </td>
<td> ${item.unionCode} </td>
<td> ${item.orderNo} </td>
<td> ${item.idName} </td>
<td> ${item.accountName} </td>
<td> ${item.bankBranch} </td>
<td> ${item.branchAddress} </td>
<td> ${item.bankName} </td>
<td> ${item.accountNumber} </td>
<td> ${item.idNumber} </td>
<td> ${item.beneficiaryAddress} </td>                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                         <a href="edit.action?id=${item.id}" class="edit" data-icon="e">Edit</a>

                            <a href="delete.action?id=${item.id}" class="delete" data-icon="e">Delete</a>
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
        $(".edit,.add").on("click",function(){
            var title=$(this).is(".add")?"PaymentOrderAccount Add":"PaymentOrderAccount Edit";
            alertM(this.href,{
                title:title,
                time:"y",
                width:660,
                height:400,
                iframe:1
            })
            return false;
        });
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
