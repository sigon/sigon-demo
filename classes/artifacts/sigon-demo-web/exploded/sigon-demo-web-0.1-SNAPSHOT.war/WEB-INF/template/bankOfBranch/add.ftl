<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
<form id="editForm" method="post" class="form form_short_info">
    <input type="hidden" name="id"  id="id" value="${bankOfBranch.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BranchId</label>
            <input type="text" id="branchId" name="branchId" value="${bankOfBranch.branchId}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BankId</label>
            <input type="text" id="bankId" name="bankId" value="${bankOfBranch.bankId}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>

    <p>
        <Button type="submit" id="sbEdit" class="btn bg_blue">Submit</Button>
        <a href="javascript:" id="cancel" class="btn">Cancel</a>
    </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        $("#editForm").validationEngine().on("submit",function(){
                    alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                        window.parent.refresh(1)
                    })
                    return false

        })
        $("#cancel").on("click",function(){
            window.parent.refresh()
        })
    })
</script>
</body>
</html>
