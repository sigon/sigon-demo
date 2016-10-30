<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body class="iframe">
<form id="editForm" method="post" class="form form_short_info">
    <input type="hidden" name="code" id="merchantCode" value="${merchantCode}"/>
            <p>
                <label class="f_info"><span data-icon="S"></span>Remark</label>
                <textarea id="remark" name="remark" data-v="validate[required,maxSize[200]]"></textarea>
            </p>
        <p>

            <a href="javascript:" id="cancel" class="btn"  data-icon="p" >Cancel</a>
            <Button type="submit" id="sbEdit" class="btn bg_blue"  data-icon="y" >Submit</Button>
        </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end("addLog.action",$("#editForm").serialize(),function(){
                window.parent.location.reload();
            })
            return false

        })
//        $("#h2").html("Add");
        window.parent.setAH($("body").height()+32)
        $("#cancel").on("click",function(){
            window.parent.location.reload();
        })
    })
</script>
</body>
</html>
