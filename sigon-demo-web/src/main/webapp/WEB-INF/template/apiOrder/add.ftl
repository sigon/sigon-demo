<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body class="iframe">
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="orderId"  id="orderId" value="${apiOrder.orderId}"/>
    <p  style=" margin: 0; ">
        Your command require access to PayEase interface, it may take some time, thus it is asynchronous manipulation. Once you complete re-submitting the order, please re-query the order payment status after few minutes.
    </p>
    <p>
        <a href="javascript:" id="cancel" class="btn" data-icon="p" >Close</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Add to order re-submit list</Button>
    </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end('${action}'+".action",$("#editForm").serialize(),function(){
                window.parent.location.href = "/apiOrder/list.action";
            });
            return false
        });
        $("#cancel").on("click",function(){
            window.parent.refresh()
        })
    })
</script>
</body>
</html>
