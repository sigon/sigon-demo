<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body class="iframe">
<form id="editForm" method="post" class="form form_short_info" action="/merchant/verifyDone.action">
    <input type="hidden" id="code" name="code" value="${code}">
    [#if !list??&&!docMsg??&&!otherDocMsg??]
        <p>
            The merchant checklist has been done, whether to verify?[#--后，将自动给用户邮箱：${email} 发邮件，告知登录名和密码--]
        </p>
        <p>
            <a href="javascript:" id="cancel" class="btn" data-icon="p" >Cancel</a>
            <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Verify!</Button>

        </p>
    [#else]
        [#if list??]
            <p>
                The merchant has not completed the following information, can not verify<br/>
                [#list list as item]
                    [#if item.name=="Risk Assessment"]
                        The merchant ${item.name} not completed <a href="/questionShow/edit.action?code=${code}" class="goto">Complete now</a> <br/>
                    [#else]
                        ${item.name} <a href="[#if item.bean == "base"]/basicInfo/edit.action?code=${code}[#elseif item.bean="gateway"]/basicInfo/gateway.action?code=${code}[/#if]" class="goto">Complete now</a> <br/>
                    [/#if]
                [/#list]
            </p>
        [/#if]
        [#if docMsg??]
            <p>
                <span>${docMsg}</span><a href="/merchantDoc/add.action?merchantCode=${code}" class="goto">Complete now</a>
            </p>
        [/#if]
        [#if otherDocMsg??]
            <p>
                <span>${otherDocMsg}</span><a href="/merchantOtherDoc/add.action?code=${code}" class="goto">Complete now</a>
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
