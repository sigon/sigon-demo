<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body class="iframe">
<form id="editForm" method="post" class="form " action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${cashhold.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <input  type="hidden" name="showDeactive"  id="showDeactive" value="${showDeactive}"/>
        <div>
        <p >
            <label class="f_info"><span data-icon="S"></span>Employee</label>
            <select id="userId" name="userId" data-v="validate[required]">
                <option value="" >Select All</option>
            [#list userList as item]
                <option value="${item.userId}" [#if item.userId==cashhold.userId]selected[/#if]>${item.userId}</option>
            [/#list]
            </select>
        </p>
        <p >
            <label class="f_info"><span data-icon="S"></span>Name</label>
            <input type="text" id="name" name="name" value="${cashhold.name}" data-v="validate[required,maxSize[50]]">
        </p>

        </div>
        <div>
        <p >
            <label class="f_info">Currency</label>
            [#list currencyList as item]
                ${item.descEng}&nbsp;&nbsp;
            [/#list]
        </p>
        <p >
            <label class="f_info">Status</label>
        [#list activeEnum as item]
            <input type="radio" name="status" value="${item.index}" [#if (item.index==cashhold.status)||(item.index=1&&cashold.status=null)]checked[/#if] id="status${item.index}"><label for="status${item.index}">${item.descEng}</label>
        [/#list]
            <br>
            <span id="statusSpan" class="red" hidden>当前cashhold的币种金额有为0的记录无法Deactive</span>
        </p>

            <p>
                <a href="javascript:" id="cancel" class="btn" data-icon="p">Cancel</a>
                <button type="submit" class="btn bg_blue" data-icon="y">Submit</button>
            </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        if ($("#showDeactive").val()==0&&$("#action").val()=="update"){
            $("#status0").prop("disabled",true);
            $("#statusSpan").prop("hidden", false);
        }
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
