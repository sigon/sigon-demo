<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">My Cash List</h2>
<form id="listForm" action="list.action" method="post">
    <div class="table">
        <table>
            <tr>
                <th>Employee</th>
                <th>Balance</th>
                <th>Currency</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td> ${item.userId} </td>
                <td> <a href="/cashDetail/list.action?cashholdId=${item.cashholdId}&currency=${item.currency}&title=My Cash Transaction Details" onclick="window.top.i_p.add(this);return false" title="My Cash Transaction Details">[@number num=item.balance][/@number]</a> </td>
                <td> ${item.currency} </td>
                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                        [@showMenu code="110201"]
                         <a href="/cashOrder/borrow.action?userId=${item.userId}&toUserId=${item.userId}&tradeType=1&toCashholdId=${cashhold.id}" class="edit" data-icon="e">Borrow</a>
                        [/@showMenu]
                        [@showMenu code="110202"]
                         <a href="/cashOrder/repay.action?userId=${item.userId}&fromUserId=${item.userId}&tradeType=2&toCashholdId=${cashhold.id}" class="edit" data-icon="e">Repay</a>
                        [/@showMenu]
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
