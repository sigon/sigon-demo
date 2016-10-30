<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">DepositeInfo List</h2>
<form id="listForm" action="list.action" method="post">
    <div class="table">
            <a href="add.action?merchantCode=${depositeInfo.merchantCode}&orderNo=${depositeInfo.orderNo}" class="btn add bg_green" data-icon="a">Add Deposit</a>
            <hr>
        <table>
            <tr>
                <th>Deposit</th>
                <th>Currency</th>
                <th>Amount</th>
                <th>Received</th>
                <th>Create Date</th>
                <th>Confirm Date</th>
                <th width="64">Actions</th>
            </tr>

        [#list depositeInfoList as item]
            <tr>

<td> ${item.deposit} </td>
<td> ${item.currency} </td>
<td> [@number num = item.amount][/@number] </td>
<td> [@number num = item.received][/@number] </td>
<td>[@dateFormat format="yyyy-MM-dd hh:mm:ss" value=item.createDate][/@dateFormat]</td>
<td>[@dateFormat format="yyyy-MM-dd hh:mm:ss" value=item.finishDate][/@dateFormat]</td>
<td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                         <a href="edit.action?id=${item.id}" class="edit" data-icon="e">Edit</a>
                         <a href="bankConfirm.action?id=${item.id}" class="edit" data-icon="e">Bank Confirm</a>
                            <a href="delete.action?id=${item.id}" class="delete" data-icon="e">Delete</a>
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

    seajs.use(["alert","validation"], function (alertM) {
        $(".edit,.add").on("click",function(){
            var title=$(this).is(".add")?"DepositeInfo Add":"DepositeInfo Edit";
            alertM(this.href,{
                title:title,
                time:"y",
                width:400,
                height:400,
                iframe:1
            })
            return false;
        });

        window.refresh=function(t){
            if(t)
                window.location.reload()
            alertM.remove()
        }
    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>
