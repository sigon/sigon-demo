<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
[#assign menu="Basic"]
[#include "/basicInfo/menu.ftl"]
<h2>Merchant Basic Info</h2>
[#assign isEdit=true]
[#assign action="update.action"]
[#include "/merchant/addContent.ftl"]
<script>
    function callback(data){

    }
</script>
</body>
</html>
