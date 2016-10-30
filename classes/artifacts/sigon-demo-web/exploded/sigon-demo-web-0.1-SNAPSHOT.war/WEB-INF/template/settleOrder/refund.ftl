<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body class="iframe">
<form id="addForm" method="post" class="form form_short_info">
    <input type="hidden" name="spiltId" value="${id}">
    <input type="hidden" name="refundId" value="${refundId}">
    <input type="hidden" name="paymentNo" value="${mhos.orderNo}">
    <input type="hidden" name="gatewayId" value="${mhos.gatewayId}">
    <input type="hidden" name="flag" value="spilt">
    <input type="hidden" name="code" id="code" value="${code}">
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S" ></span>Type</label>
            <select id="tradeType" name="tradeType" data-v="validate[required]" >
                [#list typeList as item]
                    [#if item.id==3]
                        <option  value="${item.id}">${item.descEn}</option>
                    [/#if]
                [/#list]
            </select>
        </p>
        </div>
        <div>
        <p>
            <label class="f_info"><span data-icon="S" ></span>Amount</label>
            <input type="text" id="currency" name="currency" value="CNY" readonly class="f_short">

            <input style="width:203px" type="text" id="amountDouble" name="amountDouble" readonly value="[@number num=mhos.amount formatStr="##0.00"][/@number]">
        </p>
        [#--<p>--]
            [#--<label class="f_info" id="avaAmount">(Avaliable Amount :&nbsp;${defaultCurrency}&nbsp;[@number num=avaliableAmount][/@number])</label>--]
        [#--</p>--]

        <p id="bank">
            <label class="f_info">Bank</label>
            <select id="refundBankId" name="refundBankId" >
                <option value="${vo.gatewayId}-${bankNameId}">${vo.bankName}丨${vo.gatewayName}-${vo.gatewayCode}丨${vo.currency}丨${vo.accountNo}</option>
            </select>
        </p>

        <p id="fee">
            <label class="f_info">

                <span class="b_tip">
                    Bank Charge
                        <span class="h_tip">
                        [@wrap value="POSITIVE or NEGATIVE：decrease or increase the bank account balance" labelMsg="" length=50][/@wrap]
                     </span>
                </span>
            </label>
            <input type="text" id="amountDoubleFee"  pattern="^-?(\d*)(\.\d\d)?$" name="amountDoubleFee" data-v="validate[min[-10000000],max[10000000]]" />
        </p>
        <p>
            <label class="f_info">Merchant</label>
            <input type="text" value="${code}-${name}" readonly >
        </p>
        </div>
        <div>
        <p>
            <label class="f_info"><span data-icon="S" ></span>Comment</label>
            Merchant language is ([#if language?if_exists] ${language}[#else ]EN[/#if]),please wirtten by ([#if language?if_exists]${language}[#else ]EN[/#if])
            <textarea id="reference" data-v="validate[required,maxSize[100]]"  name="reference">${bank.comment}</textarea>
            <br/><span id="referenceMsg" class="red"></span>
        </p>
        <p >
            <a href="javascript:" id="cancel" class="btn" data-icon="p">Cancel</a>
            <button id="searchForm" type="submit" class="btn bg_blue" data-icon="y">Submit</button>
        </p>
        </div>
</form>
<script>
    seajs.use(["alert","role","validation"], function (alertM) {
        window.parent.setAMCSS({"height":$("body").height()+32});
        showLength("#reference","#referenceMsg",100);

        $("#addForm").validationEngine().on("submit",function(){
            alertM.end("/merchantWallet/save.action",$("#addForm").serialize(),function(){
                window.parent.refresh(1)
            })
            return false;

        });

//        $("#amountDoubleFee").on("blur",function(){
//            var t = $("#amountDoubleFee");
//            if($.trim(t.val()).length) {
//                t.val((!t.val() || isNaN(t.val())) ? "0.00" : (Math.ceil(Math.floor(parseFloat(t.val()) * 1000000) / 10000) / 100).toFixed(2));
//            }
//        });

//        $("#currency").on("change",function(){
//            var tradeType = $("#tradeType").val();
//            var $t=$(this).val();
//            $.ajax({
//                type: "POST",
//                url: "amountChange.action",
//                dataType:"json",
//                data: {
//                    code:$("#code").val(),
//                    currency:$t,
//                    tradeType:tradeType
//                }
//            }).done(function(data){
//                var avaAmount=data.data.availableAmount;
//                var amount = fixMoney(avaAmount);
//                $("#avaAmount").html("(Avaliable Amount :&nbsp;"+ $("#currency").val()+"&nbsp;"+amount+")");
//
//                if(tradeType == "3") {
//                    var bankList = data.data.bankList;
//                    var html = '<option value="" >Please Select</option>';
//                    if (bankList != null) {
//                        for (var i = 0; i < bankList.length; i++) {
//                            html += '<option value="' + bankList[i].id + '" >' + bankList[i].name + '</option>';
//                        }
//                    }
//                    $("#refundBankId").html(html);
//                }
//            })
//            return false;
//        });

//        $("#tradeType").on("change",function(){
//            var tradeType = $("#tradeType").val();
//            $.ajax({
//                type: "POST",
//                url: "amountChange.action",
//                dataType:"json",
//                data: {
//                    code:$("#code").val(),
//                    currency:$("#currency").val(),
//                    tradeType:tradeType
//                }
//            }).done(function(data){
//                if(tradeType == "3") {
//                    var bankList = data.data.bankList;
//                    var html = '<option value="" >Please Select</option>';
//                    if (bankList != null) {
//                        for (var i = 0; i < bankList.length; i++) {
//                            html += '<option value="' + bankList[i].id + '" >' + bankList[i].name + '</option>';
//                        }
//                    }
//                    $("#refundBankId").html(html);
//                    $("#bank").show();
//                    $("#fee").show();
//                } else {
//                    $("#amountDoubleFee").val("");
//                    $("#bank").hide();
//                    $("#fee").hide();
//                }
//            })
//            return false;
//        });

        $("#cancel").on("click",function(){
            window.parent.refresh()
        })

    })
</script>
</body>
</html>