<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${paymentInfo.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Amount</label>
            <input type="text" id="amount" name="amount" value="${paymentInfo.amount}" data-v="validate[required,maxSize[9]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>OrderNo</label>
            <input type="text" id="orderNo" name="orderNo" value="${paymentInfo.orderNo}" data-v="validate[required,maxSize[10]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>PaidDate</label>
            <input type="text" id="paidDate" onclick="WdatePicker()" class="Wdate" name="paidDate" value="[#if paymentInfo.paidDate??]${paymentInfo.paidDate?date}[/#if]">
        </p>
        <p class="f_1p">
            <label class="f_info">Fee</label>
            <input type="text" id="fee" name="fee" value="${paymentInfo.fee}" data-v="validate[maxSize[9]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">Paid</label>
            <input type="text" id="paid" name="paid" value="${paymentInfo.paid}" data-v="validate[maxSize[9]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>PaymentMethod</label>
            <input type="text" id="paymentMethod" name="paymentMethod" value="${paymentInfo.paymentMethod}" data-v="validate[required,maxSize[5]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">FeeCurrency</label>
            <input type="text" id="feeCurrency" name="feeCurrency" value="${paymentInfo.feeCurrency}" data-v="validate[maxSize[2]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BeneficiaryAccountId</label>
            <input type="text" id="beneficiaryAccountId" name="beneficiaryAccountId" value="${paymentInfo.beneficiaryAccountId}" data-v="validate[required,maxSize[9]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Currency</label>
            <input type="text" id="currency" name="currency" value="${paymentInfo.currency}" data-v="validate[required,maxSize[2]]">
        </p>
        <p class="f_1p">
            <label class="f_info">Comment</label>
            <input type="text" id="comment" name="comment" value="${paymentInfo.comment}" data-v="validate[maxSize[50]]">
        </p>
        </div>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>BeneficiaryId</label>
                <input type="text" id="beneficiaryId" name="beneficiaryId" value="${paymentInfo.beneficiaryId}" data-v="validate[required,maxSize[9]]">
            </p>
        </div>

    <p class="f_1p">
        <Button type="submit" id="sbEdit" class="btn bg_blue">Submit</Button>
        <a href="javascript:" id="cancel" class="btn"  >Cancel</a>
    </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                window.parent.refresh(1)
            })
            return false

        })
        $("#cancel").on("click",function(){
            window.parent.refresh()
        })
    })
</script>
</body>
</html>
