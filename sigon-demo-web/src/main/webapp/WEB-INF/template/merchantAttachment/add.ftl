<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2 id="h2"> </h2>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${merchantAttachment.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>AttachmentType</label>
            <input type="text" id="attachmentType" name="attachmentType" value="${merchantAttachment.attachmentType}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Name</label>
            <input type="text" id="name" name="name" value="${merchantAttachment.name}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>ModuleId</label>
            <input type="text" id="moduleId" name="moduleId" value="${merchantAttachment.moduleId}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>FileType</label>
            <input type="text" id="fileType" name="fileType" value="${merchantAttachment.fileType}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Url</label>
            <input type="text" id="url" name="url" value="${merchantAttachment.url}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>

    <p>
        <Button type="submit" id="sbEdit" class="btn bg_blue">Submit</Button>
        <a href="javascript:" id="cancel" class="btn" onclick="go(-1)" >Cancel</a>
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
        $("#h2").html("MerchantAttachment " + $("#action").val() == "save"?"Add":"Edit");
    })
</script>
</body>
</html>
