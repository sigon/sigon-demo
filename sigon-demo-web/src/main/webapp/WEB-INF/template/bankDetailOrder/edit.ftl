<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body class="iframe">
<form id="editForm" method="post" class="form form_short_info">
    <div>
        <input type="hidden" name="id"  id="id" value="${bankDetailOrder.id}"/>
        <input type="hidden"  name="action"  id="action" value="${action}"/>
        <input type="hidden" value="${remark}" />

    <p><label class="f_info">Comment</label>
        <textarea id="remark" maxlength="100" name="remark" >${remark}</textarea>
        <br/><span id="msg"></span>
    </p>
    <p>
        <a href="javascript:" id="cancel" class="btn" data-icon="p">Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>
    </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        showLength("#remark", "#msg", 100);
        $("#editForm").validationEngine().on("submit",function(){
                    alertM.end("/bankDetailOrder/"+$("#action").val()+".action",$("#editForm").serialize(),function(){
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