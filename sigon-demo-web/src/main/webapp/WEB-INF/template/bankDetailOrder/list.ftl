<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">BankDetailOrder List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">OrderType</label>
                <input type="text" id="orderType" name="orderType" value="${branch.name}" >
            </p>

            <p class="f_1p">
                <label class="f_info">Amount</label>
                <input type="text" id="amount" name="amount" value="${branch.name}" >
            </p>

            <p class="f_1p">
                <label class="f_info">TradeNo</label>
                <input type="text" id="tradeNo" name="tradeNo" value="${branch.name}" >
            </p>

            <p class="f_1p">
                <label class="f_info">Level</label>
                <input type="text" id="level" name="level" value="${branch.name}" >
            </p>


            <p class="f_1p">
                <label class="f_info">Fee</label>
                <input type="text" id="fee" name="fee" value="${branch.name}" >
            </p>



            <p class="f_1p">
                <label class="f_info">Remark</label>
                <input type="text" id="remark" name="remark" value="${branch.name}" >
            </p>

            <p class="f_1p">
                <label class="f_info">DelFlag</label>
                <input type="text" id="delFlag" name="delFlag" value="${branch.name}" >
            </p>

            <p class="f_1p">
                <label class="f_info">UserId</label>
                <input type="text" id="userId" name="userId" value="${branch.name}" >
            </p>




            <p class="f_1p">
                <label class="f_info">Currency</label>
                <input type="text" id="currency" name="currency" value="${branch.name}" >
            </p>

            <p class="f_1p">
                <label class="f_info">TradeType</label>
                <input type="text" id="tradeType" name="tradeType" value="${branch.name}" >
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
                <th>orderType</th>
                <th>amount</th>
                <th>tradeNo</th>
                <th>level</th>
                <th>feeBankId</th>
                <th>fee</th>
                <th>bankNameId</th>
                <th>feeBankNameId</th>
                <th>remark</th>
                <th>delFlag</th>
                <th>userId</th>
                <th>bankId</th>
                <th>recipientBankNameId</th>
                <th>recipientBankId</th>
                <th>currency</th>
                <th>tradeType</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>

<td> ${item.orderType} </td>
<td> ${item.amount} </td>
<td> ${item.tradeNo} </td>
<td> ${item.level} </td>
<td> ${item.feeBankId} </td>
<td> ${item.fee} </td>
<td> ${item.bankNameId} </td>
<td> ${item.feeBankNameId} </td>
<td> ${item.remark} </td>
<td> ${item.delFlag} </td>
<td> ${item.userId} </td>
<td> ${item.bankId} </td>
<td> ${item.recipientBankNameId} </td>
<td> ${item.recipientBankId} </td>
<td> ${item.currency} </td>
<td> ${item.tradeType} </td>                <td>
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
            var title=$(this).is(".add")?"BankDetailOrder Add":"BankDetailOrder Edit";
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
