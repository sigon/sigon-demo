<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">MrpHandleOrderSplit List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Amount</label>
                <input type="text" id="amount" name="amount" value="${mrpHandleOrderSplit.amount}" >
            </p>
            <p class="f_1p">
                <label class="f_info">OrderNo</label>
                <input type="text" id="orderNo" name="orderNo" value="${mrpHandleOrderSplit.orderNo}" >
            </p>
            <p class="f_1p">
                <label class="f_info">PayOrderNo</label>
                <input type="text" id="payOrderNo" name="payOrderNo" value="${mrpHandleOrderSplit.payOrderNo}" >
            </p>
            <p class="f_1p">
                <label class="f_info">AccountName</label>
                <input type="text" id="accountName" name="accountName" value="${mrpHandleOrderSplit.accountName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">BankBranch</label>
                <input type="text" id="bankBranch" name="bankBranch" value="${mrpHandleOrderSplit.bankBranch}" >
            </p>
            <p class="f_1p">
                <label class="f_info">City</label>
                <input type="text" id="city" name="city" value="${mrpHandleOrderSplit.city}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Fee</label>
                <input type="text" id="fee" name="fee" value="${mrpHandleOrderSplit.fee}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Operator</label>
                <input type="text" id="operator" name="operator" value="${mrpHandleOrderSplit.operator}" >
            </p>
            <p class="f_1p">
                <label class="f_info">SpiltNo</label>
                <input type="text" id="spiltNo" name="spiltNo" value="${mrpHandleOrderSplit.spiltNo}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Province</label>
                <input type="text" id="province" name="province" value="${mrpHandleOrderSplit.province}" >
            </p>
            <p class="f_1p">
                <label class="f_info">AccountNo</label>
                <input type="text" id="accountNo" name="accountNo" value="${mrpHandleOrderSplit.accountNo}" >
            </p>
            <p class="f_1p">
                <label class="f_info">GroupNo</label>
                <input type="text" id="groupNo" name="groupNo" value="${mrpHandleOrderSplit.groupNo}" >
            </p>
            <p class="f_1p">
                <label class="f_info">GatewayId</label>
                <input type="text" id="gatewayId" name="gatewayId" value="${mrpHandleOrderSplit.gatewayId}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Status</label>
                <input type="text" id="status" name="status" value="${mrpHandleOrderSplit.status}" >
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table">
            <a href="add.action" class="btn add" data-icon="a">Add</a>
            <hr>
        <table>
            <tr>
                <th>amount</th>
                <th>orderNo</th>
                <th>payOrderNo</th>
                <th>accountName</th>
                <th>bankBranch</th>
                <th>city</th>
                <th>fee</th>
                <th>operator</th>
                <th>spiltNo</th>
                <th>province</th>
                <th>accountNo</th>
                <th>groupNo</th>
                <th>gatewayId</th>
                <th>status</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>

<td> ${item.amount} </td>
<td> ${item.orderNo} </td>
<td> ${item.payOrderNo} </td>
<td> ${item.accountName} </td>
<td> ${item.bankBranch} </td>
<td> ${item.city} </td>
<td> ${item.fee} </td>
<td> ${item.operator} </td>
<td> ${item.spiltNo} </td>
<td> ${item.province} </td>
<td> ${item.accountNo} </td>
<td> ${item.groupNo} </td>
<td> ${item.gatewayId} </td>
<td> ${item.status} </td>                <td>
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
            var title=$(this).is(".add")?"MrpHandleOrderSplit Add":"MrpHandleOrderSplit Edit";
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
