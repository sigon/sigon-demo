[#assign title="Error"]
<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
<div class="alert_page">
    <h2>${exception.message}</h2>
    <p>${exception.toString()}</p>
</div>
[#include "/include/footer.ftl"]
</body>
</html>