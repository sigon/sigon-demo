<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2 id="h2"> </h2>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${merchantBase.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Password</label>
            <input type="text" id="password" name="password" value="${merchantBase.password}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Code</label>
            <input type="text" id="code" name="code" value="${merchantBase.code}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Salt</label>
            <input type="text" id="salt" name="salt" value="${merchantBase.salt}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Level</label>
            <input type="text" id="level" name="level" value="${merchantBase.level}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Tel</label>
            <input type="text" id="tel" name="tel" value="${merchantBase.tel}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>MerchantType</label>
            <input type="text" id="merchantType" name="merchantType" value="${merchantBase.merchantType}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Email</label>
            <input type="text" id="email" name="email" value="${merchantBase.email}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>LockState</label>
            <input type="text" id="lockState" name="lockState" value="${merchantBase.lockState}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Status</label>
            <input type="text" id="status" name="status" value="${merchantBase.status}" data-v="validate[required,maxSize[20]]">
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
        $("#h2").html("MerchantBase " + $("#action").val() == "save"?"Add":"Edit");
    })
</script>
</body>
</html>
