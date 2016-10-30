<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
<h2>Refund Order Details</h2>
    <form action="" id="form1" class="form form_short_info">

        <h4>Order Detail</h4>
    <div class="cf">
        <p class="f_1p"><label class="f_info">Create Date:</label><span>${reVO.createDate?datetime}</span></p>
        <p class="f_1p"><label class="f_info">Order No:</label><span>${reVO.paymentOrderNo?split("<br/>")[0]}</span></p>
    </div>
        <div>
            <p class="f_1p"><label class="f_info">Payment No:</label><span>[#if reVO.paymentOrderNo?index_of("P")!=-1]${reVO.paymentOrderNo?split("<br/>")[1]}[#else]N/A[/#if]</span></p>
        </div>

        <h4>To Merchant</h4>
    <div class="cf">
        <p class="f_1p"><label class="f_info">Merchant Code:</label><span>${reVO.code}</span></p>
        <p class="f_1p">
            <label class="f_info">Customer Name:</label>
            <span>${reVO.customerName}</span>
        </p>
    </div>
    <div class="cf">
        <p class="f_1p"><label class="f_info">To Account:</label><span>${reVO.account}</span></p>
        <p class="f_1p">
            <label class="f_info">Refund Amount:</label>
            <span>${reVO.currency}:[@number num = reVO.amount][/@number]</span>
        </p>
    </div>
        <div class="cf">
            <p class="f_1p"><label class="f_info">Bank Charge:</label><span>${reVO.currency}:[@number num = reVO.fee][/@number][#if reVO.fee?length==0]0.00[/#if]</span></p>
            <p class="f_1p">
                <label class="f_info">Comment:</label>
                <span>[@showValue value=reVO.comment][/@showValue]</span>
            </p>
        </div>
        <a href="javascript:history.go(-1);" class="btn" data-icon="p" >Back</a>
        </form>
<script>
    seajs.use(["alert","upload","piczoom", "validation"], function (alertM, upload,piczoom) {

    })
</script>
</body>
</html>
</html>
