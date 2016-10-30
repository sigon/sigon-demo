<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2>Payment Info</h2>
<form id="editForm" method="post" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${paymentInfo.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div class="step">
            <a href="#">Step 1 Merchant Info</a>
            <a href="#">Step 2 Trading Info</a>
            <a href="#">Step 3 Dealing Info</a>
            <a href="#" class="on">Step 4 Payment Info</a>
        </div>
    <div class="table">
    [#--[@showMenu code="030224"]--]
        <a href="/paymentInfo/add.action?orderNo=${orderNo}" class="btn add bg_green" data-icon="a">Add</a>
        <hr>
    [#--[/@showMenu]--]
        <table>
            <tr>
                <th>Payment</th>
                <th>Currency</th>
                <th>Amount</th>
                <th>Paid</th>
                <th>Paid Date</th>
                <th>Create Date</th>
                <th>Actions</th>
            </tr>

        [#list list as item]
            <tr>

                <td>${item.paymentMethod}</td>
                <td>${item.currency}</td>
                <td>[@number num = item.amount][/@number]</td>
                <td>[@number num = item.paid][/@number]</td>
                <td>${item.paidDate?string("yyyy-MM-dd")}</td>
                <td>${item.createDte?string("yyyy-MM-dd")}</td>
                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                        [#--[@showMenu code="030226"]--]
                            <a href="#" class="delete" data-icon="d" >Delete</a>
                        [#--[/@showMenu]--]
                        [#--[@showMenu code="030225"]--]
                            <a href="#" data-icon="e" class="edit">Edit</a>
                        [#--[/@showMenu]--]
                        </span>
                    </span>
                </td>
            </tr>
        [/#list]
        </table>
    [#--[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]--]
        [#--[#include "/include/pagination.ftl"]--]
    [#--[/@pagination]--]
        <p>
            <Button type="button" id="finish" class="btn bg_blue">Add Finsh</Button>
        </p>
    </div>
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
