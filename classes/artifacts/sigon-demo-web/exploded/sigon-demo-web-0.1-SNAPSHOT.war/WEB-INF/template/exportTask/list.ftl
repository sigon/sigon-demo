<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script type="text/javascript" src="${base}/js/datepicker/wdatepicker.js"></script>
</head>
<body>

<h2 class="page_title">Async Export Task List</h2>
<form action="list.action" method="post" id="listForm">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <div class="table">
        <table >
            <tr>
                <th>Choose</th>
                <th>Staff Name</th>
                <th>Task Type</th>
                <th>System Info</th>
                <th>queryJson</th>
                <th>Status</th>
                <th>Number</th>
                <th>Download Url</th>
                <th>ModifyDate</th>
                [#--<th>Setting</th>--]
            </tr>
        [#list page.content as item]
            <tr>
                <td><input type="radio"  id="choose" name="merId" value=${item.code}></td>
                <td>${item.staffName}</td>
                <td>${ExportTaskStrategyEnum.getDescByCode(item.taskType)}</td>
                <td>${item.systemInfo}</td>
                <td>[@subString content=item.queryJson length=25][/@subString]</td>
                <td>${ExportTaskStatusEnum.getDescByCode(item.status)}</td>
                <td>${item.number}</td>
                <td>
                    [#if item.status == 2 && item.number > 0]
                        <a href="download.action?taskId=${item.id}">Download</a>
                    [/#if]</td>
                <td>${item.modifyDate?datetime}</td>
                [#--<td></td>--]
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
        $("#create").on("click",function(){
            $.ajax({
                url:"/wallet/beSelectMerchant.action",
                dataType:"json",
                type:"POST",
                data:$("#listForm").serialize()
            }).done(function(data){
                if(data.status=="succ"){
                    window.location.href="/wallet/selectMerchant.action?merId="+data.data;
                }
            }) ;
            return false;
        });
    });
</script>
[#include "/include/footer.ftl"]
</body>
</html>