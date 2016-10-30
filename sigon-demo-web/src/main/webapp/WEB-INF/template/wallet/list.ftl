<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">Wallet List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Merchant Code</label>
                <input type="text" id="code" name="code" value="${wallet.code}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Amount</label>
                <input type="text" id="amount" name="amount" value="${wallet.amount}" >
            </p>
            <p class="f_1p">
                <label class="f_info">BondAmount</label>
                <input type="text" id="bondAmount" name="bondAmount" value="${wallet.bondAmount}" >
            </p>

            <p class="f_1p">
                <label class="f_info">AvailableAmount</label>
                <input type="text" id="availableAmount" name="availableAmount" value="${wallet.availableAmount}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Currency</label>
                <input type="text" id="currency" name="currency" value="${wallet.currency}" >
            </p>
            <p class="f_1p">
                <label class="f_info">UnavailableAmount</label>
                <input type="text" id="unavailableAmount" name="unavailableAmount" value="${wallet.unavailableAmount}" >
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
                <th>amount</th>
                <th>bondAmount</th>
                <th>code</th>
                <th>availableAmount</th>
                <th>currency</th>
                <th>unavailableAmount</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>

<td> ${item.amount} </td>
<td> ${item.bondAmount} </td>
<td> ${item.code} </td>
<td> ${item.availableAmount} </td>
<td> ${item.currency} </td>
<td> ${item.unavailableAmount} </td>                <td>
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
