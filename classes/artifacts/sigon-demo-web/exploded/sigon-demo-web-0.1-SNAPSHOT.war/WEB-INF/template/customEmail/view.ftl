<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]

</head>
<body>
<h2 class="page_title">${title}</h2>
<form id="listForm" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <menu>
        <div class="form cf">
            <p class="f_1p">
                <label class="f_info">Subject：</label>
                ${mail.subject}
            </p>
            <p class="f_1p">
                <label class="f_info">Send To：</label>
                ${mail.sendTo}
            </p>
            <p class="f_1p">
                <label class="f_info">from:</label>
                ${mail.from}
            </p>
            <p class="f_1p">
                <label class="f_info">Host:</label>
                ${mail.host}
            </p>
            <p class="f_1p">
                <label class="f_info">Port:</label>
            ${mail.port}
            </p>
            <p class="f_1p">
                <label class="f_info">Username:</label>
            ${mail.username}
            </p>

            <p class="f_1p">
                <label class="f_info">Password:</label>
                [#if own]
            ${mail.password}
                [#else]
                ******
                [/#if]
            </p>
        [#if mail.msg??]
            <p class="f_2p">
                <label class="f_info">MSG:</label>
                ${mail.msg}
            </p>
        [/#if]
    </div>
    </menu>
    <div >
        <iframe src="content.action?id=${mail.id}" width="100%" height="800"></iframe>
    </div>
</form>
<script>
    seajs.use("alert",function(alertM){

    })
</script>
</body>
</html>