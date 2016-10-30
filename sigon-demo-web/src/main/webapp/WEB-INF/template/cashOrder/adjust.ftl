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
    <input  type="hidden" name="fromUrl"  id="fromUrl" value="${fromUrl}"/>
    <input type="hidden" name="isDetail" id="isDetail" value="${isDetail}">

    [#list cashholdList as item]
        [#if cashOrder.toCashholdId==item.id]
        ${item.name}-${item.userId}<input type="hidden" name="toId" value="${item.id}-${item.userId}">
        [/#if]
    [/#list]
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
                [#if isDetail==1]
                <th>Live Balance</th>
                [#else ]
                <th>Balance</th>
                [/#if]
                <th width="100">Adjust Amount</th>
            </tr>
            [#if isDetail==1]
                [#list cashOrderItemVOList as item]
                    <tr>
                        <td> ${item.currency}<input type="hidden" name="currencys" value="${item.currency}"> </td>
                        <td> [@number num=item.balance][/@number] </td>
                        <td> [@number num=item.amount][/@number]</td>
                    </tr>
                [/#list]
            [#else]
        [#list cashViewList as item]
            <tr>
                <td> ${item.currency}<input type="hidden" name="currencys" value="${item.currency}"> </td>
                <td> [@number num=item.balance][/@number] </td>
                <td> <input type="text" name="amounts" data-v="validate[custom[number]]" value="" > </td>
            </tr>
        [/#list]
            [/#if]
        </table>
    </div>


    <p>
[#if isDetail!=1]
        <a href="javascript:" id="cancel" class="btn" data-icon="p" >Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Adjust</Button>
[/#if]
    </p>

</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        showLength("#comment", "#commentMsg", 50);
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                window.location.href="${fromUrl}"
            })
            return false
        })
        if ($("#isDetail").val()==1) {
            $("#comment").prop("disabled", true);
        }


        $("#cancel").on("click",function(){
           window.history.back()
        })
    })
</script>
</body>
</html>
