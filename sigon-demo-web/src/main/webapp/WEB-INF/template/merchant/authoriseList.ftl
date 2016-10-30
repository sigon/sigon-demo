<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
<h2>Merchant Add</h2>

[#assign isEdit=false]
[#assign hasStep = true]
[#include "/merchant/authoriseListContent.ftl"]
<script>
    function callback(){

        window.location.href = "gatewayAdd.action?code=${code}";
    }
</script>
[#include "/include/footer.ftl"]
</body>
</html>
