<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2>Merchant Add</h2>


[#assign hasStep=true]
[#assign init="true"]
[#include "/merchant/gatewayContent.ftl"]
<script>
    function callback(data){
        window.location.href="/merchantView/list.action";
    }
</script>
</body>
</html>
