<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/html">
<head>
[#include "/include/head.ftl"]
</head>
<body>
<h2 class="page_title">Detail</h2>
    <form id="inputForm" method="post" class="form form_short_info" >
        <input type="hidden" name="type" id="type" value="${type}">
        <div>
            <p class="f_1p">
                <label class="f_info">Paid by</label>
            ${apiOrder.idCardName}
            </p>

            <p class="f_1p" id="tradeType">
                <label class="f_info">National ID number</label>
            ${apiOrder.idCard}
            </p>
        </div>
        <div>
            <p class="f_1p" >
                <label class="f_info">Merchant order number</label>
            ${apiOrder.receiveOrderId}
            </p>
            <p class="f_1p" >
                <label class="f_info">MRP order</label>${apiOrder.orderId}
            </p>
        </div>
        <div>
            <p class="f_1p" >
                <label class="f_info">Order amount</label>
            ${apiOrder.currencyReceive} [@number num = apiOrder.tradeAmount][/@number]
            </p>
            <p class="f_1p" >
                <label class="f_info">CNY amount</label>
            CNY [@number num = apiOrder.wholeAmount][/@number]
            </p>

        </div>
        <div>
        <p class="f_1p" >
                <label class="f_info">Rate</label>
        [@number num = apiOrder.rate m=100000 formatStr=",##0.0000"][/@number]
            </p>
            <p class="f_1p" >
                <label class="f_info">Payment method</label>
            ${gatewayTypeMap.get(apiOrder.gatewayType).paymentType}
            </p>
        </div>
        <div>
            <p class="f_1p" id="serviceAmount">
                <label class="f_info">Fee amount</label>
            ${apiOrder.currencyReceive} [@number num = apiOrder.feeAmtSys][/@number]
            </p>

            <p class="f_1p" id="toAccount">
                <label class="f_info">Order status</label>
            ${tradeStateMap.get(apiOrder.tradeState)}
            </p>
        </div>
       <p>
           [#if type]
               <a href="${type}" class="btn" data-icon="p">Back</a>
           [#else ]
               <a href="javascript:history.go(-1)" class="btn" data-icon="p">Back</a>
           [/#if]
        </p>


        </form>
        <script>
            seajs.use("alert", function (alertM) {
                window.refresh=function(t){
                    if(t)
                        window.location.reload()
                    alertM.remove()
                }
            });
        </script>
</body>
</html>