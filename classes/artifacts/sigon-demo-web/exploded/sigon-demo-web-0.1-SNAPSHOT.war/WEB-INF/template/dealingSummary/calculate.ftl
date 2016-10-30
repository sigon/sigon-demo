<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body class="iframe">
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${dealingSummary.id}"/>
    <input type="hidden" name="currencyPair"  id="currencyPair" value="${currencyPair}"/>
    <div class="table">

        <table>
            <tr>
                <th id="buyCurrency1">Buy XXX</th>
                <th>Rate</th>
                <th id="sellCurrency1">Sell XXX</th>
                <th id="buyCurrency2">Buy XXX</th>
                <th>Rate</th>
                <th id="sellCurrency2">Sell XXX</th>

            </tr>

        [#list  sumList as item]

                <tr>
                    <td> [@number num = item.buyCurrBefore][/@number]</td>
                    <td> ${item.rateBTA}</td>
                    <td> [@number num = item.sellCurrAfter][/@number]</td>
                    <td>[#if item.buyCurrAfter??][@number num = item.buyCurrAfter][/@number][/#if]</td>
                    <td>[#if item.rateATB??]${item.rateATB}[/#if]</td>
                    <td>[#if item.sellCurrBefore??][@number num = item.sellCurrBefore][/@number][/#if]</td>
                </tr>
        [/#list]
        </table>

    </div>

    <div id="cal">
        <p class="f_1p" style="width:33%">
            <label class="f_info">Origin Amount</label>
            <input type="text" style="width:85%" id="amount" name="amount" onblur="blurToMoney(this)"  pattern="^(\d*)(\.\d\d)?$" data-v="validate[custom[number]]">
            *
        </p>

        <p class="f_1p" style="width:33%">
            <label class="f_info">Rate</label>
            <input type="text" style="width:85%" id="rate" name="rate"  onblur="blurToRate(this)"  pattern="^(\d*)(\.\d\d\d\d)?$" data-v="validate[custom[number]]">
            =
        </p>

        <p class="f_1p" style="width:33%">
            <label class="f_info">Dest Amount</label>
            <span > <b id="res">0.00</b></span></p>
        </p>

    </div>


</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {

        $(document).ready(function() {
            var currencyPair = $("#currencyPair").val();
            if (currencyPair) {
                var currencyPairArray = currencyPair.split('@@');
                $("#buyCurrency1").html("Buy " + currencyPairArray[0]);
                $("#sellCurrency1").html("Sell " + currencyPairArray[1]);
                $("#buyCurrency2").html("Buy " + currencyPairArray[1]);
                $("#sellCurrency2").html("Sell " + currencyPairArray[0]);
            }
        });

        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                window.parent.refresh(1)
            })
            return false

        })
        $("#cancel").on("click",function(){
            window.parent.refresh()
        })
        $("#amount,#rate").on("blur",function(){
            $.ajax({
                url:"/dealingSummary/profit.action",
                dateType:"json",
                method:"post",
                data:{
                    amount:$("#amount").val(),
                    rate:$("#rate").val()
                }
            }).done(function(data){
                if (data.status=="succ"){
                    $("#res").html(data.res)
                }
            })
        })

    })
</script>
</body>
</html>
