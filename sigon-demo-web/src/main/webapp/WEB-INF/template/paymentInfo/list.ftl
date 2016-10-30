<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">PaymentInfo List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Amount</label>
                <input type="text" id="amount" name="amount" value="${paymentInfo.amount}" >
            </p>
            <p class="f_1p">
                <label class="f_info">OrderNo</label>
                <input type="text" id="orderNo" name="orderNo" value="${paymentInfo.orderNo}" >
            </p>
                    [@inputRegion id="paidDate" type="date" start=paymentInfo.paidDateStart end=paymentInfo.paymentInfoEnd]
                    [#include "/include/inputregion.ftl"]
                    [/@inputRegion]
            <p class="f_1p">
                <label class="f_info">Fee</label>
                <input type="text" id="fee" name="fee" value="${paymentInfo.fee}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Paid</label>
                <input type="text" id="paid" name="paid" value="${paymentInfo.paid}" >
            </p>
            <p class="f_1p">
                <label class="f_info">PaymentMethod</label>
                <input type="text" id="paymentMethod" name="paymentMethod" value="${paymentInfo.paymentMethod}" >
            </p>
            <p class="f_1p">
                <label class="f_info">FeeCurrency</label>
                <input type="text" id="feeCurrency" name="feeCurrency" value="${paymentInfo.feeCurrency}" >
            </p>
            <p class="f_1p">
                <label class="f_info">BeneficiaryAccountId</label>
                <input type="text" id="beneficiaryAccountId" name="beneficiaryAccountId" value="${paymentInfo.beneficiaryAccountId}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Currency</label>
                <input type="text" id="currency" name="currency" value="${paymentInfo.currency}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Comment</label>
                <input type="text" id="comment" name="comment" value="${paymentInfo.comment}" >
            </p>
            <p class="f_1p">
                <label class="f_info">BeneficiaryId</label>
                <input type="text" id="beneficiaryId" name="beneficiaryId" value="${paymentInfo.beneficiaryId}" >
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm bg_blue" class="btn" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table">
            <a href="add.action" class="btn add bg_green" data-icon="a">Add</a>
            <hr>
        <table>
            <tr>
                <th>amount</th>
                <th>orderNo</th>
                <th>paidDate</th>
                <th>fee</th>
                <th>paid</th>
                <th>paymentMethod</th>
                <th>feeCurrency</th>
                <th>beneficiaryAccountId</th>
                <th>currency</th>
                <th>comment</th>
                <th>beneficiaryId</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>

<td> ${item.amount} </td>
<td> ${item.orderNo} </td>
<td> ${item.paidDate?datetime} </td>
<td> ${item.fee} </td>
<td> ${item.paid} </td>
<td> ${item.paymentMethod} </td>
<td> ${item.feeCurrency} </td>
<td> ${item.beneficiaryAccountId} </td>
<td> ${item.currency} </td>
<td> ${item.comment} </td>
<td> ${item.beneficiaryId} </td>                <td>
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
            var title=$(this).is(".add")?"PaymentInfo Add":"PaymentInfo Edit";
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
