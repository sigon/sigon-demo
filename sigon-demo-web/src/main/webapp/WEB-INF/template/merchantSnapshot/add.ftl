<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${merchantSnapshot.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info">DocNum</label>
            <input type="text" id="docNum" name="docNum" value="${merchantSnapshot.docNum}" data-v="validate[maxSize[25]]">
        </p>
        <p class="f_1p">
            <label class="f_info">Note</label>
            <input type="text" id="note" name="note" value="${merchantSnapshot.note}" data-v="validate[maxSize[50]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>OrderNo</label>
            <input type="text" id="orderNo" name="orderNo" value="${merchantSnapshot.orderNo}" data-v="validate[required,maxSize[25]]">
        </p>
        <p class="f_1p">
            <label class="f_info">Code</label>
            <input type="text" id="code" name="code" value="${merchantSnapshot.code}" data-v="validate[maxSize[5]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>NextChecklistDate</label>
            <input type="text" id="nextChecklistDate" onclick="WdatePicker()" class="Wdate" name="nextChecklistDate" value="[#if merchantSnapshot.nextChecklistDate??]${merchantSnapshot.nextChecklistDate?date}[/#if]">
        </p>
        <p class="f_1p">
            <label class="f_info">IdType</label>
            <input type="text" id="idType" name="idType" value="${merchantSnapshot.idType}" data-v="validate[maxSize[5]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">Mobile</label>
            <input type="text" id="mobile" name="mobile" value="${merchantSnapshot.mobile}" data-v="validate[maxSize[10]]">
        </p>
        <p class="f_1p">
            <label class="f_info">AuthorisePersonId</label>
            <input type="text" id="authorisePersonId" name="authorisePersonId" value="${merchantSnapshot.authorisePersonId}" data-v="validate[maxSize[5]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>RemindDate</label>
            <input type="text" id="remindDate" onclick="WdatePicker()" class="Wdate" name="remindDate" value="[#if merchantSnapshot.remindDate??]${merchantSnapshot.remindDate?date}[/#if]">
        </p>
        <p class="f_1p">
            <label class="f_info">RegistrationAddress</label>
            <input type="text" id="registrationAddress" name="registrationAddress" value="${merchantSnapshot.registrationAddress}" data-v="validate[maxSize[100]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">PlaceOfIssue</label>
            <input type="text" id="placeOfIssue" name="placeOfIssue" value="${merchantSnapshot.placeOfIssue}" data-v="validate[maxSize[25]]">
        </p>
        <p class="f_1p">
            <label class="f_info">Attachment</label>
            <input type="text" id="attachment" name="attachment" value="${merchantSnapshot.attachment}" data-v="validate[maxSize[32767]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">Name</label>
            <input type="text" id="name" name="name" value="${merchantSnapshot.name}" data-v="validate[maxSize[75]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>IssueDate</label>
            <input type="text" id="issueDate" onclick="WdatePicker()" class="Wdate" name="issueDate" value="[#if merchantSnapshot.issueDate??]${merchantSnapshot.issueDate?date}[/#if]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info">RegisterName</label>
            <input type="text" id="registerName" name="registerName" value="${merchantSnapshot.registerName}" data-v="validate[maxSize[25]]">
        </p>

    <p>
        <Button type="submit" id="sbEdit" class="btn bg_blue"  data-icon="y">Submit</Button>
        <a href="javascript:" id="cancel" class="btn"   data-icon="p">Cancel</a>
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
