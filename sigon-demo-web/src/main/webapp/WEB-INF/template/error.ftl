[#assign title="Error"]
<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
<h1 data-icon="i">alert[#include "/include/user.ftl"]</h1>
<header>
</header>
<div class="alert_page">
    <h2>${Request['ErrorTitle']}</h2>
    <p>${Request['ErrorMsg']}</p>
</div>
[#include "/include/footer.ftl"]
</body>
</html>