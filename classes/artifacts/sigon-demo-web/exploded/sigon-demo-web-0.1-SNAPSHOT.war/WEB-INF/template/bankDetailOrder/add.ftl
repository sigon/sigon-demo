<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
<form id="editForm" method="post" class="form form_short_info">
    <input type="hidden" name="id"  id="id" value="${bankDetailOrder.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>OrderType</label>
            <input type="text" id="orderType" name="orderType" value="${bankDetailOrder.orderType}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Amount</label>
            <input type="text" id="amount" name="amount" value="${bankDetailOrder.amount}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>TradeNo</label>
            <input type="text" id="tradeNo" name="tradeNo" value="${bankDetailOrder.tradeNo}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Level</label>
            <input type="text" id="level" name="level" value="${bankDetailOrder.level}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>FeeBankId</label>
            <input type="text" id="feeBankId" name="feeBankId" value="${bankDetailOrder.feeBankId}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Fee</label>
            <input type="text" id="fee" name="fee" value="${bankDetailOrder.fee}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BankNameId</label>
            <input type="text" id="bankNameId" name="bankNameId" value="${bankDetailOrder.bankNameId}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>FeeBankNameId</label>
            <input type="text" id="feeBankNameId" name="feeBankNameId" value="${bankDetailOrder.feeBankNameId}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Remark</label>
            <input type="text" id="remark" name="remark" value="${bankDetailOrder.remark}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>DelFlag</label>
            <input type="text" id="delFlag" name="delFlag" value="${bankDetailOrder.delFlag}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>UserId</label>
            <input type="text" id="userId" name="userId" value="${bankDetailOrder.userId}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BankId</label>
            <input type="text" id="bankId" name="bankId" value="${bankDetailOrder.bankId}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>RecipientBankNameId</label>
            <input type="text" id="recipientBankNameId" name="recipientBankNameId" value="${bankDetailOrder.recipientBankNameId}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>RecipientBankId</label>
            <input type="text" id="recipientBankId" name="recipientBankId" value="${bankDetailOrder.recipientBankId}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Currency</label>
            <input type="text" id="currency" name="currency" value="${bankDetailOrder.currency}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>TradeType</label>
            <input type="text" id="tradeType" name="tradeType" value="${bankDetailOrder.tradeType}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>

    <p>
        <Button type="submit" id="sbEdit" class="btn bg_blue">Submit</Button>
        <a href="javascript:" id="cancel" class="btn">Cancel</a>
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
