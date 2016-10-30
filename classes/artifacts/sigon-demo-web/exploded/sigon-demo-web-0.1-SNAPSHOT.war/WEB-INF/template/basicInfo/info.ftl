<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
[#include "/basicInfo/menu.ftl"]
<div id="msg"></div>
<script>
    seajs.use(["alert"], function (alertM) {
        var back= function (){
            //history.go(-1);
            window.close();
        }
        var c = $("#rightNav a:first");
        if(c.attr("href")) {
            window.location.href = c.attr("href");
        }else{
            $("#msg").html("没有可用的权限");
//            alertM("没有可用的权限", {time:"y",rf:back,btns:[{txt:"返回", back}]});
        }


    })
</script>
</body>
</html>