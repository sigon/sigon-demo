<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body class="iframe">
<form id="editForm" method="post" class="form " action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${smsTemplate.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>

        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Model</label>
            [#if action=="update"]
                <input type="hidden" name="model" id="model" value="${modelMap.get(smsTemplate.model).code}">
                <input type="text" readonly value="${modelMap.get(smsTemplate.model).desc}">
            [#else]
                <select name="model" id="model">
                    [#list modelList as model]
                        <option value="${model.code}" [#if smsTemplate.model==model.code]selected[/#if] >${model.desc}</option>
                    [/#list]
                </select>
            [/#if]

        </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>MessageInChinese</label>
                <textarea id="messageInChinese" name="messageInChinese" data-v="validate[required,maxSize[200]]">${smsTemplate.messageInChinese}</textarea><br>
                <span id="msgC"></span>
            </p>
        </div>
        <div>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>MessageInEnglise</label>
                <textarea id="messageInEnglise" name="messageInEnglise" data-v="validate[required,maxSize[200]]">${smsTemplate.messageInEnglise}</textarea><br>
                <span id="msgE"></span>
            </p>
        </div>
            <p class="f_1p gray">tips：Message中{}包起的单词为动态变量，会在短信使用时替换</p>
            <p class="f_1p">
                <a href="javascript:" id="cancel" class="btn" data-icon="p" >Cancel</a>
                <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>
            </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        showLength("#messageInChinese", "#msgC", 200);
        showLength("#messageInEnglise", "#msgE", 200);
        window.parent.setAH($("body").height()+12);
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
