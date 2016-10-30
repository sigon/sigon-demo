<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body class="iframe">

<form id="editForm" method="post" class="form ">
    <div>
    <input type="hidden" name="id"  id="id" value="${branch.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <p>
            <label class="f_info"><span data-icon="S"  ></span>Name</label>
            <input type="text" id="name" name="name" value="${branch.name}" onblur="this.value=$.trim(this.value)"  data-v="validate[required,maxSize[20],custom[onlyChineseLetterNumberSp],ajax[checkUserId.action?id=${branch.id}]]">
            <span id="checkId"></span>
        </p>

        <p id="enum1">
            <label class="f_info"><span data-icon="S" ></span>Clearing Price</label>
            <select name="priceCategoryId" id="priceCategoryId" value="${branch.priceCategoryId}" data-v="validate[required]">
                <option value="">Please select</option>
                [#list categoryList as item]
                <option value="${item.id}" [#if branch.priceCategoryId==item.id]selected[/#if]>${item.name}</option>
                [/#list]
            </select>
        </p>
</div>
    <p>
        <label class="f_info"><span data-icon="S"  ></span>Status</label>
        [#if c==1]
            [#list priceCategoryEnum as item]
             <input type="radio" name="status" value="${item.index}" id="status${item.index}" required [#if branch.status==item.index||branch.status==null]checked[/#if] disabled> &nbsp;<label class="f_for" for="status${item.index}">${item.descEng}</label>
            [/#list]
            <span class='red' style="display">The branch is in use</span>
        [#else ]
            [#list priceCategoryEnum as item]
                <input type="radio" name="status" value="${item.index}" id="status${item.index}" required [#if branch.status==item.index||branch.status==null]checked[/#if] > &nbsp;<label class="f_for" for="status${item.index}">${item.descEng}</label>
            [/#list]
        [/#if]
    </p>

    <p><label class="f_info">Comment</label>
        <textarea id="remark" maxlength="100" name="comment">${branch.comment}</textarea>
        <br/><span id="msg"></span>
    </p>
    <p>
        <a href="javascript:" id="cancl" class="btn" data-icon="p">Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>
    </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        showLength("#remark", "#msg", 100);
        $("#editForm").validationEngine().on("submit",function(){
                    alertM.end("/branch/"+$("#action").val()+".action",$("#editForm").serialize(),function(){
                        window.parent.location.href = "/branch/list.action";
                    });
                    return false

        })
        $("#cancl").on("click",function(){
            window.parent.refresh()
        })
    })
</script>
</body>
</html>