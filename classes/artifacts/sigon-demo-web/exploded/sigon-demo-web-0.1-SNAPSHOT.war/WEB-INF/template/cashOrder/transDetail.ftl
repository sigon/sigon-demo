<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2 >${title}</h2>
<form id="editForm" method="post" class="form form_short_info" action="save.action">
    <input type="hidden" name="tradeType"  id="tradeType" value="${cashOrder.tradeType}"/>
    <input  type="hidden" name="action"  id="action" value="save"/>
    <input  type="hidden" name="userId"  id="userId" value="${cashOrder.userId}"/>
    <div>
        <p class="f_info">
        ${cashOrder.fromUserId} had [#if cashOrder.status==reject]rejected[#else]confirmed[/#if] my cashhold order @${cashOrder.modifyDate?datetime}
            <br>
            [#if cashOrder.status==reject]
            reject comment:${cashOrder.confirmComment}
            [#else ]
            confirm comment:[@showValue value = cashOrder.confirmComment][/@showValue]
            [/#if]
        </p>
        <p class="f_1p">
            <label class="f_info"  id="fromId" data-v="validate[required]"><span data-icon="S"></span>From CashHolder</label>
            ${cashOrder.fromUserId}-${cashholdMap.get(cashOrder.fromCashholdId)}
        </p>

        <p class="f_1p">
            <label class="f_info" id="toId" data-v="validate[required]"><span data-icon="S"></span>To CashHolder</label>
        ${cashOrder.toUserId}-${cashholdMap.get(cashOrder.toCashholdId)}
        </p>
    </div>
    <div>
        <p class="f_2p">
            <label class="f_info">Comment</label>
            <textarea id="comment" name="comment" data-v="validate[maxSize[100]]" maxlength="100" disabled>${cashOrder.comment}</textarea> <br>
            <span id="commentMsg" class="red"></span>
        </p>
    </div>
    <div class="table">
        <table>
            <tr>
                <th>Currency</th>
                <th>Live Balance</th>
                <th width="100">[#if cashOrder.tradeType == 1]Borrowing Amount[#else]Repayment Amount[/#if]</th>
            </tr>
        [#list cashOrderItemVOList as item]
            <tr>
                <td> ${item.currency}<input type="hidden" name="currencys" value="${item.currency}"> </td>
                <td> [@number num=item.balance][/@number] </td>
                <td> [@number num=item.amount][/@number]</td>
            </tr>
        [/#list]
        </table>
    </div>
<p></p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        showLength("#comment", "#commentMsg", 100);
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                window.location.href="/cash/list.action"
            })
            return false
        })
        $("#cancel").on("click",function(){
            window.history.back();
        })
    })
</script>
</body>
</html>
