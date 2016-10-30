<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body class="iframe">
<form id="editForm" method="post" class="form form_short_info">
    <input type="hidden" name="id" id="id" value="${priceCategory.id}"/>
    <input type="hidden" name="action" id="action" value="${action}">
        <p>
            <label class="f_info"><span data-icon="S" ></span>Name</label>
            <input type="text" id="name" name="name" style="text-transform:capitalize;" value="${priceCategory.name}" onblur="this.value=$.trim(this.value)"  data-v="validate[required,maxSize[10],ajax[checkUserId.action?id=${priceCategory.id}]]" >
            <span id="checkId" ></span>
        </p>
    <p>
        <label class="f_info"><span data-icon="S"  >Status</label>
        [#if c1==1||c2==1]
        [#list priceCategoryEnum as item]
        <input type="radio" name="status" value="${item.index}" id="status${item.index}" [#if priceCategory.status==item.index||priceCategory.status==null]checked="true"[/#if] disabled> &nbsp;<label class="f_for"  for="status${item.index}">${item.descEng}</label>
        [/#list]
        <br>
            <span class='red' style="display">This Category is in use</span>
        [#else ]
            [#list priceCategoryEnum as item]
                <input type="radio" name="status" value="${item.index}" id="status${item.index}" [#if priceCategory.status==item.index||priceCategory.status==null]checked="true"[/#if]  required> &nbsp;<label class="f_for"  for="status${item.index}">${item.descEng}</label>
            [/#list]
        [/#if]
    </p>

    <p>
        <input type="checkbox" name="wholeSale" value="1" id="wholeSale" [#if priceCategory.wholeSale == 1]checked="true"[/#if]><label for="wholeSale">IsWholeSale</label>
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