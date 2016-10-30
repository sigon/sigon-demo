[#assign title="Error"]
<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
<div class="alert_page">
    <h2 style="text-align: center">正在跳转页面......</h2>
</div>
[#include "/include/footer.ftl"]
</body>
<script>
    [#--alert('${login}?systemList=${systemList}&fromUrl=${fromUrl}');--]
    [#if noAuth!=null]
    window.location.href ='/home/index.action';
    [/#if]

</script>
</html>