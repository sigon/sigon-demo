[#assign title="Login"]
<!DOCTYPE html>
<html>
<head>
    <script>
        var elm = document.createElement('input');
        if(!('required' in elm)){
            window.location.href="/download.html"
        }
    </script>
    <meta charset="utf-8"/>
    <link href="${base}/favicon.ico" rel="shortcut icon" type="image/x-icon"/>
    <link href="${base}/css/mrptrader.css" rel="stylesheet" type="text/css" />
    <title>${title!"HOME"}</title>
</head>
<body id="login">
    <div></div>
    <form action="/login/login.action" method="post" autocomplete="off" class="form form_short_info">
        <h2>Login</h2>
        [#if Request['LoginFailDesc']??]<p class="red">${LoginFailDesc}</p>[/#if]
        <input type="text" name="userName" placeholder="User Name" value="${Request['userName']}" required autofocus>
        <input type="password" name="password" placeholder="Password" required>
        <button type="submit" class="btn bg_blue">Login</button>
    </form>
[#include "/include/footer.ftl"]
</body>
</html>