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

        <p class="f_1p">
            <label class="f_info"><span data-icon="S"></span>From CashHolder</label>
        [#if action == "repay"]
            [#list cashholdList as item]
                [#if cashOrder.fromUserId==item.userId]
                    ${item.name}-${item.userId}<input type="hidden" name="fromId" value="${item.id}-${item.userId}">
                [/#if]
            [/#list]
        [#else]
            <select name="fromId" id="fromId" data-v="validate[required]">
                <option value="">Please Select</option>
                [#list cashholdList as item]
                    [#if cashOrder.toUserId!=item.userId]
                        <option value="${item.id}-${item.userId}" [#if cashOrder.fromUserId==item.userId]selected[/#if]>${item.name}-${item.userId}</option>
                    [/#if]
                [/#list]
            </select>
        [/#if]
        </p>

        <p class="f_1p">
            <label class="f_info"><span data-icon="S"></span>To CashHolder</label>
        [#if action == "borrow"]
            [#list cashholdList as item]
                [#if cashOrder.toUserId==item.userId]
                ${item.name}-${item.userId}<input type="hidden" name="toId" value="${item.id}-${item.userId}">
                [/#if]
            [/#list]
        [#else]
            <select name="toId" id="toId" data-v="validate[required]">
                <option value="">Please Select</option>
            [#list cashholdList as item]
                [#if cashOrder.fromUserId!=item.userId]
                <option value="${item.id}-${item.userId}" [#if cashOrder.toUserId==item.userId]selected[/#if]>${item.name}-${item.userId}</option>
                [/#if]
            [/#list]
            </select>
        [/#if]
        </p>
    </div>
    <div>
        <p class="f_2p">
            <label class="f_info">Comment</label>
            <textarea id="comment" name="comment" data-v="validate[maxSize[50]]" maxlength="50">${cashOrder.comment}</textarea> <br>
            <span id="commentMsg" class="red"></span>
        </p>
    </div>
    <div class="table">
        <table>
            <tr>
                <th>Currency</th>
                <th>Balance</th>
                <th width="100">[#if action == "borrow"]Borrowing Amount[#else]Repayment Amount[/#if]</th>
            </tr>
        [#list cashViewList as item]
            <tr>
                <td> ${item.currency}<input type="hidden" name="currencys" value="${item.currency}"> </td>
                <td> [@number num=item.balance][/@number] </td>
                <td> <input type="text" name="amounts" value="" onblur="blurToMoney(this)" data-v="validate[min[0.01],custom[number]]"> </td>
            </tr>
        [/#list]
        </table>
    </div>
    <p>
        <a href="javascript:" id="cancel" class="btn" data-icon="p" >Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>
    </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        showLength("#comment", "#commentMsg", 50);
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
