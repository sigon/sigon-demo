<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
[#include "/include/head.ftl"]
</head>
<body>
<h2 class="page_title">Detail</h2>
<form>
<div class="form form_short_info" >
    <input type="hidden" name="type" id="type" value="${type}">
    <h4>Order Detail</h4>
    <div>
        <p class="f_1p">
            <label class="f_info">Create Date</label>
        ${paymentOrder.createDate?date}
        </p>
        <p class="f_1p">
            <label class="f_info">Order no</label>
        ${paymentOrder.orderNo}
        </p>

        <p class="f_1p" id="tradeType">
            <label class="f_info">Amount</label>
        ${paymentOrder.currencyAfter} [@number num = paymentOrder.amountAfter ][/@number]
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info">Fee</label>
        ${paymentOrder.currencyBefore} [@number num = paymentOrder.fee ][/@number]
        </p>
    [#if paymentOrder.currencyAfter!=paymentOrder.currencyBefore]
        <p class="f_1p">
            <label class="f_info">Rate</label>
            [@number num = paymentOrder.rate m=100000 formatStr=",##0.0000"][/@number]
        </p>
        <p class="f_1p">
            <label class="f_info">Deducted amount</label>
        ${paymentOrder.currencyBefore} [@number num = paymentOrder.amountBefore ][/@number]
        </p>
    [/#if]
        <p class="f_1p">
            <label class="f_info">Status</label>
        ${paymentOrderStatusMap.get(paymentOrder.status)}
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info">Purpose of payment</label>
        [@showValue value=paymentOrder.remark][/@showValue]
        </p>
        <p class="f_1p">
            <label class="f_info">Outstanding amount</label>
        ${paymentOrder.currencyAfter} [@number num = outStandingAmount ][/@number]
        </p>

    </div>
    <h4>Receiver Detail</h4>

[#if paymentOrder.currencyAfter=="CNY"]
    <div>
        <p class="f_1p">
            <label class="f_info">National ID name</label>
        ${paymentOrderAccount.idName}<span data-icon="y" class="green"></span>
        </p>

        <p class="f_1p">
            <label class="f_info">National ID number</label>
        ${paymentOrderAccount.idNumber}
        </p>
    </div>
[/#if]
    <div>
        <p class="f_1p">
            <label class="f_info">Bank name</label>
        ${paymentOrderAccount.bankName}
        </p>
        <p class="f_1p">
            <label class="f_info">Bank branch</label>
        ${paymentOrderAccount.bankBranch}
        </p>
    </div>
    <div>
        <p class="f_1p" id="serviceAmount">
            <label class="f_info">Account name</label>
        ${paymentOrderAccount.accountName}
        </p>

        <p class="f_1p" id="toAccount">
            <label class="f_info">Account number</label>
        ${paymentOrderAccount.accountNumber}
        </p>
    </div>
<div>
    <p class="f_1p">
        <label class="f_info">Reference</label>
    [@showValue value=paymentOrderAccount.reference][/@showValue]
    </p>
[#if paymentOrder.currencyAfter=="CNY"]
    <p class="f_1p">
        <label class="f_info">CNAPS code</label>
    ${paymentOrderAccount.unionCode}
    </p>
[/#if]
[#if paymentOrder.currencyAfter!="CNY"]
    <p class="f_1p">
        <label class="f_info">Swift code</label>
    ${paymentOrderAccount.unionCode}
    </p>
</div>
<div>
    <p class="f_1p">
        <label class="f_info">Bank address</label>
    ${paymentOrderAccount.branchAddress}
    </p>
    <p class="f_1p">
        <label class="f_info">Beneficiary address</label>
    ${paymentOrderAccount.beneficiaryAddress}
    </p>
[/#if]
</div>

    <h4>Pay Detail</h4>
    <p class="f_1p">
        <label class="f_info">Paid amount</label>
    ${paymentOrder.currencyAfter} [@number num = paymentOrder.paidAmount][/@number]
    </p>
[#if paymentOrder.status==3]
    <p class="f_1p">
        <label class="f_info">Reject Reason:</label>
    ${settleOrder.rejectRemark}
    </p>
[/#if]
[#if historyList?size==0]
    <p class="f_2p">
        [#if type]
            <a href="${type}" class="btn " data-icon="p">Back</a>
        [#else]
            <a href="javascript:history.go(-1)" class="btn " data-icon="p">Back</a>
        [/#if]
    </p>
[/#if]
</div>
[#include "/settleOrder/settleOrderAccount.ftl"/]
</form>
<script>
    seajs.use("alert", function (alertM) {
        window.refresh = function (t) {
            if (t)
                window.location.reload()
            alertM.remove()
        }
        $("#table_1").on("click",".td_down",function(){
            $(this).parent().parent().toggleClass("tr_next_show")
        })
    });
</script>
</body>
</html>