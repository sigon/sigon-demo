<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
[#assign menu="Authorise"]
[#include "/basicInfo/menu.ftl"]
<h2>Authorise List</h2>
[#assign isEdit=true]
[#include "/merchant/authoriseListContent.ftl"]
[#include "/include/footer.ftl"]
<script>
    function callback(){
        window.location.href = "/merchantView/list.action";
    }
</script>
</body>
</html>
