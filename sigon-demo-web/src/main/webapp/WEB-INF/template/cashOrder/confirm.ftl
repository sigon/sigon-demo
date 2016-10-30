<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2 >[#if confirm]Confirm[#else]Reject[/#if] Cash [#if cashOrder.tradeType == 1]Borrowing[#else]Repayment[/#if]</h2>
<form id="editForm" method="post" class="form form_short_info" action="confirm.action">
    <input type="hidden" name="orderNo"  id="orderNo" value="${cashOrder.orderNo}"/>
    <input  type="hidden" name="action"  id="action" value="confirm"/>
    <input  type="hidden" name="confirm"  id="confirm" value="[#if confirm]true[#else]false[/#if]"/>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"></span>From CashHolder</label>
            [#list cashholdList as item]
                [#if cashOrder.fromUserId==item.userId]
                    ${item.name}-${item.userId}
                [/#if]
            [/#list]
        </p>

        <p class="f_1p">
            <label class="f_info"><span data-icon="S"></span>To CashHolder</label>
            [#list cashholdList as item]
                [#if cashOrder.toUserId==item.userId]
                ${item.name}-${item.userId}
                [/#if]
            [/#list]
        </p>
    </div>
    <div>
        <p class="f_2p">
            <label class="f_info">Comment</label>
            <textarea id="comment" name="comment" data-v="validate[maxSize[50]]" maxlength="50" disabled>${cashOrder.comment}</textarea> <br>
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
                <td> ${item.currency} </td>
                <td> [@number num=item.balance][/@number] </td>
                <td> [@number num=item.amount][/@number] </td>
            </tr>
        [/#list]
        </table>
    </div>
    <div>
        <p class="f_2p">
            <label class="f_info">[#if confirm]Confirm[#else]Reject[/#if] Comment</label>
            <textarea id="confirmComment" name="confirmComment" data-v="validate[maxSize[100]]" maxlength="100">${cashOrder.confirmComment}</textarea> <br>
            <span id="confirmCommentMsg" class="red"></span>
        </p>
    </div>
    <p>
        <a href="javascript:" id="cancel" class="btn"  data-icon="p">Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Save</Button>
    </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        showLength("#comment", "#commentMsg", 50);
        showLength("#confirmComment", "#confirmCommentMsg", 50);
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                window.parent.refreshIframe3();
                window.location.href="/cash/list.action"
            })
            return false
        })
        $("#cancel").on("click",function(){
            window.location.href="/cash/list.action"
        })
    })
</script>
</body>
</html>
