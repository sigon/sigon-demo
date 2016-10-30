<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2 id="h2"> </h2>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${walletSumDetail.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Amount</label>
            <input type="text" id="amount" name="amount" value="${walletSumDetail.amount}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Code</label>
            <input type="text" id="code" name="code" value="${walletSumDetail.code}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>OrderNo</label>
            <input type="text" id="orderNo" name="orderNo" value="${walletSumDetail.orderNo}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Balance</label>
            <input type="text" id="balance" name="balance" value="${walletSumDetail.balance}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>WalletType</label>
            <input type="text" id="walletType" name="walletType" value="${walletSumDetail.walletType}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Currency</label>
            <input type="text" id="currency" name="currency" value="${walletSumDetail.currency}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Remark</label>
            <input type="text" id="remark" name="remark" value="${walletSumDetail.remark}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>

    <p>
        <Button type="submit" id="sbEdit" class="btn bg_blue">Submit</Button>
        <a href="javascript:" id="cancel" class="btn" onclick="go(-1)" >Cancel</a>
    </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                window.location.href="list.action";
            })
            return false

        })
        $("#h2").html("WalletSumDetail " + $("#action").val() == "save"?"Add":"Edit");
    })
</script>
</body>
</html>
