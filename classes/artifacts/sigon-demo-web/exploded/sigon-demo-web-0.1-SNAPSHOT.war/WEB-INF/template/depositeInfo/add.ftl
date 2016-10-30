<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<form id="editForm" method="post" class="form " action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${depositeInfo.id}"/>
    <input  type="hidden" name="action"  id="action" value="${action}"/>
    <input  type="hidden" name="merchantCode"  id="merchantCode" value="${depositeInfo.merchantCode}"/>
    <input  type="hidden" name="orderNo"  id="orderNo" value="${depositeInfo.orderNo}"/>
        <div>
        <p >
            <label class="f_info"><span data-icon="S"  ></span>Method Of Deposit</label>
            <select id="depositeType" name="depositeType">
            [#list depositTypeEnum as item]
                <option value="${item.code}" [#if item.code==depositeInfo.depositeType]selected[/#if]>${item.desc}</option>
            [/#list]
            </select>
        </p>
        <p >
            <label class="f_info"><span data-icon="S"  ></span></label>
            <select id="currency" name="currency">
                <option value="" >Select All</option>
            [#list currencyEnum as item]
                <option value="${item.descEng}" [#if item.descEng==depositeInfo.currency]selected[/#if]>${item.descEng}</option>
            [/#list]
            </select>
        </p>
        <p >
            <label class="f_info"><span data-icon="S"  ></span>Deposit Amount</label>
            <input type="text" id="amountDouble" name="amountDouble" value="${depositeInfo.amount}" data-v="validate[required,maxSize[20]]">
        </p>
        <p >
            <label class="f_info"><span data-icon="S"  ></span>Received</label>
            &nbsp;&nbsp;<input type="radio" name="isReceived" value="1" data-v="validate[required]" [#if depositeInfo!=null && depositeInfo.finishDate!=null]checked[/#if]>&nbsp;&nbsp;<label>是</label>
            &nbsp;&nbsp;<input type="radio" name="isReceived" value="0" data-v="validate[required]" [#if depositeInfo==null || depositeInfo.finishDate==null]checked[/#if]>&nbsp;&nbsp;<label>否</label>
        </p>
        </div>
        <div>
        <p >
            <label class="f_info"></span>Comment</label>
            <textarea id="comment"  name="comment" maxlength="100">${depositeInfo.comment}</textarea>
        </p>
        </div>
        <div>

    <p>
        <a href="javascript:" id="cancel" class="btn"   data-icon="p">Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue"  data-icon="y">Save</Button>
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
