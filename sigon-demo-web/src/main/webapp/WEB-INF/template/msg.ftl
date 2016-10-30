[#assign title="ALERT"]
<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
<script>
    seajs.use("alert",function(alertM){
        alertM("${msg}");
    });
    function gogo(){
        window.location.href="${link}";
    }
    setTimeout(gogo, 2000);
</script>
</body>
</html>