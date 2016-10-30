<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body class="iframe">
<form id="form1" method="post" class="form " action="replySave.action">
    <input type="hidden" name="id" value="${id}">
    <div>
        [#if Email??]
            <p class="f_2p">
                <label class="f_info"><span data-icon="S"></span>Reply Email</label>
                <textarea name="emailReply" data-v="validate[required,maxSize[200]]"></textarea>
            </p>
        [/#if]
        [#if System??]
            <p class="f_2p">
                <label class="f_info"><span data-icon="S"></span>Reply System</label>
                <textarea name="systemReply" data-v="validate[required,maxSize[50]]"></textarea>
            </p>
        [/#if]
    </div>
    <p>
        <a href="javascript:" id="cancel" class="btn" data-icon="p" >Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Save</Button>
    </p>
</form>
<script>
    seajs.use(["alert","validation"],function(alertM,addp) {
        $("#form1").validationEngine().on("submit", function () {
            alertM.end("replySave.action", $("#form1").serialize(), function () {
                window.parent.refresh(1)
            });
            return false;
        });
        $("#cancel").on("click",function(){
            window.parent.refresh()
        })
        window.parent.setAH($("body").height()+32);
    })
</script>
</body>
</html>