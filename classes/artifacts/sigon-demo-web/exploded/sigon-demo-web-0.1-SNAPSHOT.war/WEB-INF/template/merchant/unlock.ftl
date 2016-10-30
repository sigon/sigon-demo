<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body class="iframe">
<form id="editForm" method="post" class="form" action="/merchant/doLock.action">
    <input type="hidden" name="lockState" value="2">
    <input type="hidden" id="code" name="code" value="${code}">
    <p class="">
        <label class="f_info"><span data-icon="S"  ></span>Lock For Trader</label>
        ${info.lockForTrader}
    </p>
    <p class="">
        <label class="f_info"><span data-icon="S"  ></span>Lock For Merchant</label>
        ${info.lockForMerchant}
    </p>
    <p>
        <a href="javascript:" id="cancel" class="btn" data-icon="p" >Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">UnLock</Button>
    </p>
</form>
<script>
    seajs.use(["alert", "validation"], function (alertM) {
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($(this).attr("action"),$("#editForm").serialize(),function(){
                window.parent.refresh(1);
            });
            return false
        });
        $("#cancel").on("click",function(){
            window.parent.refresh()
        });
        window.parent.setAMCSS({"height":$("body").height()+32})
    })
</script>
</body>
</html>
