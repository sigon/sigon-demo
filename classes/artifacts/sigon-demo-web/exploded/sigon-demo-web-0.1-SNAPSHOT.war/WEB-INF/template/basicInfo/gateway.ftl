<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
[#assign menu="Gateway"]
[#include "/basicInfo/menu.ftl"]
<h2>Gateway Update</h2>
[#if !gateway.apiCurrency??]
    [#assign init = "true"]
[#else]
    [#assign init="false"/]
[/#if]
[#include "/merchant/gatewayContent.ftl"]
<script>
    function callback(data){
        window.location.reload();
    }
</script>
</body>
</html>
