<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body class="iframe">
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${paymentReason.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>ReasonCn</label>
            <input type="text" id="reasonCn" name="reasonCn" value="${paymentReason.reasonCn}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>ReasonEn</label>
            <input type="text" id="reasonEn" name="reasonEn" value="${paymentReason.reasonEn}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>

    <p>
        <a href="javascript:" id="cancel" class="btn" data-icon="p" >Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>
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
