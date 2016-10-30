<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
[#assign menu="Authorise"]
[#include "/basicInfo/menu.ftl"]
<h2>Daily Limit Amount Setting</h2>
    <form id="editForm" method="post" class="form form_short_info" action="/dailyPaymentMoney/merchantDailyUpdate.action">
        <input type="hidden" name="code" value="${code}">
        <div class="fl" style="width: 600px;">
            <table id="priceTable" class="gray_table">
            [#list currencyList as item]
                <tr>
                    <td>${item.descEng}
                    </td>
                    <td><input type="text" data-v="validate[custom[integer]]" class="money" id="currency${item.descEng}" name="amount${item.descEng}" value="${merchantDailyMap.get(item.descEng).amount}"/></td>
                    <td>[#if dailyMap.get(item.descEng)??]
                        System default: [@number num=dailyMap.get(item.descEng).amount m=1 formatStr="0.00"/]
                        [#else]
                        System default: unspecified
                    [/#if]</td>
                </tr>
            [/#list]
                [#if lastModify??]
                <tr>
                    <td>The last person modified</td>
                    <td>${lastModify}</td>
                    <td></td>
                </tr>
                [/#if]
                <tr>
                    <td colspan="3">Tips: You can leave it blank, leave it blank represent no upper limit today, the amount enter here will be the upper limit amount when Merchant make payments.</td>
                </tr>
            </table>
            <button type="submit" id="submit" style="margin:32px 0 0 0;width: 66px;" class="btn bg_blue fr" data-icon="y">Save</button>
        </div>
    </form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        $(".money").on("blur", function(){
            //var amount = fixMoney($(this).val());
            //$(this).val(amount);
        });
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
