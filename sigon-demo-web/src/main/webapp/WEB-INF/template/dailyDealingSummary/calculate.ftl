<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<h2 >Cal Profit</h2>
<body>
<form id="listForm" method="post" class="form form_short_info" action="cal.action">
    <input  type="hidden" name="action"  id="action" value="${action}"/>
    <input  type="hidden" name="currencyPair" value="${dealingSummary.currencyPair}"/>
    <input  type="hidden" name="level" value="${dealingSummary.level}"/>
    <div>
        <p class="f_1p" style="width:40%">
            <label class="f_info">Start Date</label>
            <input type="text" value="${dealingSummary.createDateStart}" name="createDateStart" id="createDateStart" class="Wdate " data-v="validate[custom[date],past[${pastDate}]]" onclick="WdatePicker()">
        </p>
        <p class="f_1p" style="width:40%">
            <label class="f_info"><span data-icon="S"  ></span>End Date</label>
            <input type="text" value="${dealingSummary.createDateEnd}" name="createDateEnd" id="createDateEnd" class="Wdate " data-v="validate[required,custom[date],past[${pastDate}]]" onclick="WdatePicker()">
        </p>
        <p class="f_1p" style="width:20%">
            <label class="f_info">Search</label>
            <Button type="submit" id="search" class="btn bg_blue" data-icon="y">Search</Button>
        </p>
    </div>
</form>

<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input  type="hidden" name="currencyPair"  id="currencyPair" value="${dealingSummary.currencyPair}"/>
    <input  type="hidden" name="direction"  id="direction" value="${dealingSummary.direction}"/>
    <input  type="hidden" name="createDateStart"  id="createDateStartCopy" value="${dealingSummary.createDateStart}"/>
    <input  type="hidden" name="createDateEnd"  id="createDateEndCopy" value="${dealingSummary.createDateEnd}"/>
    <div class="table">
        <table>
            <tr>
                <th id="leftBuy">Buy XXX</th>
                <th>Rate</th>
                <th id="leftSell">Sell XXX</th>
                <th id="rightBuy">Buy XXX</th>
                <th>Rate</th>
                <th id="rightSell">Sell XXX</th>
            </tr>
        [#list  sumList as item]
                <tr>
                    <td> [@number num = item.leftAmountPay][/@number]</td>
                    <td> ${item.leftRate}</td>
                    <td> [@number num = item.leftAmountReceive][/@number]</td>
                    <td>[@number num = item.rightAmountPay][/@number]</td>
                    <td>${item.rightRate}</td>
                    <td>[@number num = item.rightAmountReceive][/@number]</td>
                </tr>
        [/#list]
        </table>
    </div>

    <div id="cal">
        <p class="f_1p" style="width:33%">
            <label id="buy" class="f_info"><span data-icon="S"  ></span>Sell XXX</label>
            <input type="text" style="width:85%" id="[#if dealingSummary.direction == 1][#if dealingSummary.currencyPair?contains("CNY") || dealingSummary.currencyPair?contains("NZD")]amountPay[#else]amountReceive[/#if][#else][#if dealingSummary.currencyPair?contains("CNY") || dealingSummary.currencyPair?contains("NZD")]amountReceive[#else]amountPay[/#if][/#if]" name="amountPayDouble" onblur="blurToMoney(this)"  pattern="^(\d*)(\.\d\d)?$" data-v="validate[required,custom[number],min[0.01]]">
        [#if dealingSummary.direction == 1][#if dealingSummary.currencyPair?contains("CNY") || dealingSummary.currencyPair?contains("NZD")]*[#else]/[/#if][#else][#if dealingSummary.currencyPair?contains("CNY") || dealingSummary.currencyPair?contains("NZD")]/[#else]*[/#if][/#if]<span></span>
        </p>

        <p class="f_1p" style="width:33%">
            <label class="f_info"><span data-icon="S"  ></span>Rate</label>
            <input type="text" style="width:85%" id="rate" name="rateDouble"  onblur="blurToRate(this)"  pattern="^(\d*)(\.\d\d\d\d)?$" data-v="validate[required,custom[number],min[0.0001],max[100]]">

        </p>

        <p class="f_1p" style="width:33%">
            <label id="sell" class="f_info"><span data-icon="S"  ></span>Buy XXX</label>
            =
            <input type="text" style="width:85%" id="[#if dealingSummary.direction == 1][#if dealingSummary.currencyPair?contains("CNY") || dealingSummary.currencyPair?contains("NZD")]amountReceive[#else]amountPay[/#if][#else][#if dealingSummary.currencyPair?contains("CNY") || dealingSummary.currencyPair?contains("NZD")]amountPay[#else]amountReceive[/#if][/#if]" name="amountReceiveDouble" onblur="blurToMoney(this)"  pattern="^(\d*)(\.\d\d)?$" data-v="validate[required,custom[number],min[0.01]]">
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Profit</label>
            <select name="profitStyle" id="buyOrSell" class="f_short">
                <option value="1" >Buy</option>
                <option value="2" >Sell</option>
            </select>
            <select name="profitCurrency" id="currency" class="f_short">
            [#list currencyList as item]
                <option value="${item}" >${item}</option>
            [/#list]
            </select>
            <input type="text" style="width:50%" id="profit" name="profitDouble" pattern="^-?(\d*)(\.\d\d)?$" data-v="validate[required,custom[number],min[-100000000],max[100000000]]">
        </p>
    </div>
    <div>
        <p class="f_2p">
            <label class="f_info">Comment</label>
            <textarea id="comment" name="comment" data-v="validate[maxSize[100]]" maxlength="100"></textarea> <br>
            <span id="commentMsg" class="red"></span>
        </p>
    </div>

    <div>
        <p>
            <a href="javascript:" id="cancel" class="btn" data-icon="p">Cancel</a>
            <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Deal</Button>
        </p>
    </div>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {

        $(document).ready(function() {
            var currencyPair = $("#currencyPair").val();
            if (currencyPair) {
                var currencyPairArray = currencyPair.split('@@');
                $("#leftBuy").html("Buy " + currencyPairArray[0]);
                $("#leftSell").html("Sell " + currencyPairArray[1]);
                $("#rightBuy").html("Buy " + currencyPairArray[1]);
                $("#rightSell").html("Sell " + currencyPairArray[0]);

                if ($("#direction").val() == 1) {
                    $("#buy").html('<span data-icon="S"  ></span>Buy ' + currencyPairArray[0]);
                    $("#sell").html('<span data-icon="S"  ></span>Sell ' + currencyPairArray[1]);
                } else {
                    $("#buy").html('<span data-icon="S"  ></span>Buy ' + currencyPairArray[1]);
                    $("#sell").html('<span data-icon="S"  ></span>Sell ' + currencyPairArray[0]);
                }
            }
        });

        showLength("#comment", "#commentMsg", 100);
        $("#profit").on("blur",function(){
            var t = $("#profit");
            if($.trim(t.val()).length) {
                t.val((!t.val() || isNaN(t.val())) ? "0.00" : (Math.ceil(Math.floor(parseFloat(t.val()) * 1000000) / 10000) / 100).toFixed(2));
            }
        });
        $("#amountReceive").on("focus",function(){
            var $t=$(this), $rate=$("#rate"), $amountPay=$("#amountPay");
            if($amountPay.val().length&&$rate.val().length){
                $t.val(accMul($amountPay.val(),$rate.val()).toFixed(2))
            }
        });
        $("#rate").on("focus",function(){
            var $t=$(this), $amountReceive=$("#amountReceive"), $amountPay=$("#amountPay");
            if($amountPay.val().length&&$amountReceive.val().length){
                if($amountPay.val() > 0) {
                    $t.val(accDiv($amountReceive.val(),$amountPay.val()).toFixed(4))
                } else {
                    $t.val(0.00);
                }
            }
        });
        $("#amountPay").on("focus",function(){
            var $t=$(this), $rate=$("#rate"), $amountReceive=$("#amountReceive");
            if($rate.val().length&&$amountReceive.val().length){
                if($rate.val() > 0) {
                    $t.val(accDiv($amountReceive.val(),$rate.val()).toFixed(2))
                } else {
                    $t.val(0.00);
                }
            }
        });

        $("#listForm").validationEngine().on("submit",function(){
        })
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                window.location.href = "/dailyDealingSummary/list.action?queryint=1&currencyPair=" + $("#currencyPair").val();
            })
            return false

        })
        $("#cancel").on("click",function(){
            window.location.href = "/dailyDealingSummary/list.action?queryint=1&currencyPair=" + $("#currencyPair").val();
        })

    })
</script>
</body>
</html>
