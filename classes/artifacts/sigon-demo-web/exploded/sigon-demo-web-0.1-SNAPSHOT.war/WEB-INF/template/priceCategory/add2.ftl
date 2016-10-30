<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body class="iframe">
<form id="editForm" method="post" class="form ">
    <input type="hidden" name="id" id="id" value="${priceCategory.id}"/>
    <input type="hidden" name="action" id="action" value="${action}">
        <p>
            <label class="f_info"><span data-icon="S"  ></span>Name</label>
            <input type="text" id="name" name="name" value="${priceCategory.name}" onblur="this.value=$.trim(this.value)" data-v="validate[required,maxSize[10],ajax[checkUserId.action?id=${priceCategory.id}]]">
            <span id="checkId" ></span>
        </p>
    <br>
    <p>
        <a href="javascript:" id="cancl" class="btn" data-icon="p">Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>
    </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        showLength("#remark", "#msg", 100);
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end("/priceCategory/"+$("#action").val()+".action",$("#editForm").serialize(),function(){
                window.parent.refresh(1)
            })
            return false
        })
        $("#cancl").on("click",function(){
            window.parent.refresh()
        })
    })
</script>
</body>
</html>