<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2 id="h2"></h2>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${bankCode.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>Code</label>
                <input type="text" id="code" name="code" onblur="this.value=$.trim(this.value)" value="${bankCode.code}" [#if action!="update"] data-v="validate[required,maxSize[4],custom[integer],ajax[check.action]]"[#else] readonly [/#if]>
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>Name</label>
                <input type="text" id="name" name="name" value="${bankCode.name}" data-v="validate[required,maxSize[50]]">
            </p>
        </div>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>Forshort</label>
                <input type="text" id="forshort" name="forshort" value="${bankCode.forshort}" data-v="validate[required,maxSize[10]]">
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>IconName</label>
                <input type="text" id="iconName" name="iconName" value="${bankCode.iconName}" data-v="validate[required,maxSize[50]]">
            </p>
        </div>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>IsAble</label>
                [#list whetherEnum as item]
                    <input id="isAble_${item.descEng}" type="radio" name="isAble" value="${item.index}" [#if bankCode.isAble==item.index||(action=="save"&&item.index==1)]checked[/#if]>
                    <label for="isAble_${item.descEng}" class="f_for" >${item.descEng}</label>
                [/#list]
            </p>
        </div>
        <p>
            <a href="javascript:history.go(-1)" id="cancel" class="btn" data-icon="p" >Cancel</a>
            <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>
        </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                window.location.href="list.action";
            })
            return false

        })
        $("#h2").html("BankCode " + ($("#action").val() == "save"?"Add":"Edit"));
    })
</script>
</body>
</html>
