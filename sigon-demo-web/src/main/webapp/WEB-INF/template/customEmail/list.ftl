[#assign title="Email Log"]
[#assign header="setting"]
[#assign nav="sendLogList"]
<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
[#if msg??]
    <script>
        seajs.use("alert",function(alertM){
            alertM("${msg}");
        });
    </script>
[/#if]
</head>
<body>
<h2 class="page_title">${title}</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <menu>
        <div class="form cf">
            <p class="f_1p">
                <label class="f_info">Status：</label>
                <select id="status" name="status">
                    <option value="">ALL</option>
                    [#list customEmailStatusEnumList as item]
                        <option value="${item.code}" [#if param.status==item.code]selected[/#if]>${item.desc}</option>
                    [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Send To：</label>
                <input type="text" name="sendTo" id="sendTo" value="${param.sendTo}">
            </p>
            <p class="f_1p">
                <label class="f_info">From</label>
                <input type="text" name="from" id="from" value="${param.from}">
            </p>
            <p class="f_2p">
                <label class="f_info">Modify Date(<=30days)</label>
            [@inputRegion id="modifyTime" type="date" start=param.modifyTimeStart end=param.modifyTimeEnd]
                [#include "/include/inputregion.ftl"]
            [/@inputRegion]
                <input type="hidden" id="today" value="">
            </p>
            <p class="f_1p">
                <label class="f_info">&nbsp;</label>
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <button type="button" id="reset" class="btn">Reset</button>
            </p>
        </div>
    </menu>
    <div class="table">
        [#--<div>&nbsp;&nbsp;<b>Total Records ${page.total}</b></div>--]
        <table>
            <tr>
                <th>Subject</th>
                <th>Send To</th>
                <th>From</th>
                <th>Status</th>
                <th>CreateDate</th>
                <th>ModifyDate</th>
                <th>Option</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td>
                    ${item.subject}
                </td>
                <td>
                    [@subString content=item.sendTo length=20 /]
                </td>
                <td>
                    [@subString content=item.from length=20 /]
                </td>
                <td>
                    ${customEmailStatusEnumMap.get(item.status)}
                </td>
                <td>[@aunewtop.longToTime item.createTime "yyyy-MM-dd HH:mm:ss"/]</td>
                <td>
                    [@aunewtop.longToTime item.modifyTime "yyyy-MM-dd HH:mm:ss"/]
                </td>
                <td>
                <span class="btn_i item_menu">
                    o<span data-itemid="${item.skey}">
                        <a href="view.action?id=${item.id}" onclick="window.top.i_p.add(this);return false" data-itemid="${item.id}" data-icon="e">View</a>
                    </span>
                </span>
                </td>
            </tr>
        [/#list]
        </table>
    [@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
    [#include "/include/pagination.ftl"]
    [/@pagination]
    </div>
</form>
<script>
    seajs.use("alert",function(alertM){
        $("#reset").click(function(){
            var today= $("#today").val();
            $("#modifyTimeStart").val(today);
            $("#modifyTimeEnd").val(today);
            $("#modifyTimeRegion").val(today);
            $("#status").val("");
            $("#sendTo").val("");
            $("#from").val("");
        });
    })
</script>
</body>
</html>