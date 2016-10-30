<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body class="iframe">
<form id="editForm" method="post" class="form form_short_info">
    <input type="hidden" name="merchantCode" id="merchantCode" value="${merchantCode}"/>

            <p>
                <label class="f_info"><span data-icon="S"></span>转出商户编号</label>
                <input id="transferCode" name="transferCode" class="f_long" data-v="validate[required,maxSize[10]]"/>
            </p>
        <p>
            <a href="javascript:" id="cancel" class="btn" data-icon="p">Cancel</a>
            <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>

        </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        $("#editForm").validationEngine().on("submit",function(){
            if("${merchantCode}"==$("#transferCode").val()||"${merchantCode}".toLowerCase()==$("#transferCode").val()){
                alertM("不能转出给自己！",{cls:"error"});
                return false;
            }
            alertM.end("save.action",$("#editForm").serialize(),function(){
                window.parent.location.reload();
            })
            return false

        })
//        $("#h2").html("Add");
        window.parent.setAH($("body").height()+32)
        $("#cancel").on("click",function(){
            window.parent.location.reload();
        })
        window.parent.setAMCSS({"width":$("body").width()})
    })
</script>
</body>
</html>
