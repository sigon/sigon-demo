<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body class="iframe">
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${merchantSupport.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Code</label>
            <input type="text" id="code" name="code" value="${merchantSupport.code}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Comments</label>
            <input type="text" id="comments" name="comments" value="${merchantSupport.comments}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Issue</label>
            <input type="text" id="issue" name="issue" value="${merchantSupport.issue}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>ReplyTypes</label>
            <input type="text" id="replyTypes" name="replyTypes" value="${merchantSupport.replyTypes}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>EmailReply</label>
            <input type="text" id="emailReply" name="emailReply" value="${merchantSupport.emailReply}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Trader</label>
            <input type="text" id="trader" name="trader" value="${merchantSupport.trader}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>SystemReply</label>
            <input type="text" id="systemReply" name="systemReply" value="${merchantSupport.systemReply}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Department</label>
            <input type="text" id="department" name="department" value="${merchantSupport.department}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Status</label>
            <input type="text" id="status" name="status" value="${merchantSupport.status}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>SmsReply</label>
            <input type="text" id="smsReply" name="smsReply" value="${merchantSupport.smsReply}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>

    <p>
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
