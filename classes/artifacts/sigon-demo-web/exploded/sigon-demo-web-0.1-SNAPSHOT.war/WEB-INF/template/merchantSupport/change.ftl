<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body  class="iframe">
<form id="form1" method="post" class="form " action=".action">
    <input type="hidden" name="id" value="${id}">
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"></span>Trader</label>
            <select id="trader" name="trader" data-v="validate[required]" >
                <option value="" >Please select</option>
                [#list userList as item]
                [#if merchantSupport.level==2  ]
                    [#if (merchantSupport.trader==null || merchantSupport.trader=="" )&& item.dataAuthority==2]
                        <option value="${item.userId}" [#if item.userId==merchantSupport.trader]selected[/#if]>${item.userId}</option>
                    [#elseif item.userId!=userId && item.dataAuthority==2]
                        <option value="${item.userId}" [#if item.userId==merchantSupport.trader]selected[/#if]>${item.userId}</option>
                    [/#if]
                [#else ]
                    [#if merchantSupport.trader==null || merchantSupport.trader==""]
                        <option value="${item.userId}" [#if item.userId==merchantSupport.trader]selected[/#if]>${item.userId}</option>
                    [#elseif item.userId!=userId]
                        <option value="${item.userId}" [#if item.userId==merchantSupport.trader]selected[/#if]>${item.userId}</option>
                    [/#if]
                [/#if]
                [/#list]
            </select>
        </p>
        <p class="f_2p">
            <label class="f_info"><span data-icon="S"></span>Remark</label>
            <textarea name="remark" data-v="validate[required,maxSize[50]]"></textarea>
        </p>
    </div>
        <p>
            <a href="javascript:" id="cancel" class="btn" data-icon="p" >Cancel</a>
            <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Save</Button>
        </p>

    [#if page.content?size>0]
    <div class="table">
        <table>
            <tr>
                <th>Change Before</th>
                <th>Change After</th>
                <th>remark</th>
                <th>Date</th>
            </tr>
        [#list page.content as item]
            <tr >
                <td>[@showValue value=item.traderBefore][/@showValue]</td>
                <td>[@showValue value=item.traderAfter][/@showValue]</td>
                <td>[@subString content=item.reason length=10][/@subString]</td>
                <td>[@dateFormat format="yyyy-MM-dd HH:mm:ss" value=item.createDate][/@dateFormat]</td>
            </tr>
        [/#list]
        </table>
    </div>
    [/#if]
</form>
<script>
    seajs.use(["alert","validation"],function(alertM,addp) {
        $("#form1").validationEngine().on("submit", function () {
            alertM.end("changeSave.action", $("#form1").serialize(), function () {
                window.parent.refresh(1)
            });
            return false;
        });
        $("#cancel").on("click",function(){
            window.parent.refresh()
        })
        window.parent.setAH($("body").height()+32);
    })
</script>
</body>
</html>