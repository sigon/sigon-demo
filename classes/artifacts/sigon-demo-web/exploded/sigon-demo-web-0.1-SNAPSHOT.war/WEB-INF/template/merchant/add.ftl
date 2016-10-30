<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2>Merchant Add</h2>

[#assign hasStep=true]
[#assign isEdit=false]
[#assign action="infoSave.action"]
[#include "/merchant/addContent.ftl"]
<script>
    function callback(data){
        [#if nextAuth]
        window.location.href="authoriseList.action?code=" + data.data;
        [#else]
            window.location.href = "/merchantView/list.action";
        [/#if]
    }
</script>
</body>
</html>
