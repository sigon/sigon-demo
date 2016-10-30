<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body class="iframe">
<form id="editForm" method="post" class="form form_short_info" action="/merchant/activeDone.action">
    <input type="hidden" id="code" name="code" value="${code}">
    [#if !list??]
        <p>
            Once the merchant information required for activation has been completed, the system will automatically email the account log in details to ${email}
            [#--用户资料已填写完成，通过后，将自动给用户邮箱：${email} 发邮件，告知登录名和密码--]
        </p>
        <p>
            <a href="javascript:" id="cancel" class="btn" data-icon="p" >Cancel</a>
            <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Activate!</Button>
        </p>
    [#else]
        [#if list??]
            <p>
                The merchant has not completed the following information, can not active<br/>
                [#list list as item]
                    ${item.name} <a href="[#if item.bean == "base"]/basicInfo/edit.action?code=${code}[#elseif item.bean="gateway"]/basicInfo/gateway.action?code=${code}[/#if]" class="goto">Complete now</a> <br/>
                [/#list]
            </p>
        [/#if]
        <p>
            <a href="javascript:" id="cancel" class="btn" data-icon="p" >Cancel</a>
        </p>
    [/#if]
</form>
<script>
    seajs.use(["alert","role","validation"], function (alertM, role) {
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($(this).attr("action"),$("#editForm").serialize(),function(){
                window.parent.refresh(1);
            });
            return false

        }).on("click", ".delete_d", function(){
            $(this).parent().parent().remove();
        });

        var $add_d=$("#add_d").on("click",function(){
            $('<div >' + $("#ad1").html() + '</div>').insertBefore($add_d)
        }).parent();
        $("#cancel").on("click",function(){
            window.parent.refresh()
        });
        $(".goto").on("click", function(){
            window.parent.location.href=$(this).attr("href");
            return false;
        });
        role("#role");
        window.parent.setAMCSS({"height":$("body").height()+32})
    })
</script>
</body>
</html>
