<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2>Daily Payment Limit Setting</h2>
    <form id="editForm" method="post" class="form form_short_info" action="/dailyPaymentMoney/update.action">
        <div class="fl" style="width: 600px;">
            <table id="priceTable" class="gray_table">
                <tr>
                    <th></th>
                </tr>
            [#list currencyList as item]
                <tr>
                    <td>${item.descEng}
                    </td>
                    <td><input type="text" data-v="validate[custom[integer]]" id="currency${item.descEng}" name="amount${item.descEng}" value="${dailyMap.get(item.descEng).amount}"/></td>
                </tr>
            [/#list]
                [#if lastModify??]
                <tr>
                    <td>The last person modified</td>
                    <td>${lastModify}</td>
                </tr>
                [/#if]
                <tr>
                    <td colspan="2">Tips: You can leave it blank, leave it blank represent no upper limit today, the amount enter here will be the upper limit amount when Merchant make payments.</td>
                </tr>
            </table>
            <button type="submit" id="submit" style="margin:32px 0 0 0;width: 66px;" class="btn bg_blue fr" data-icon="y">Save</button>
        </div>
    </form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($(this).attr("action"),$("#editForm").serialize(),callback);
            return false
        });
        var callback=function(){
            window.location.reload();
        }
    })
</script>
</body>
</html>
