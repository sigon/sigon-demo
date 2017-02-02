<head>
[#include "/include/head.ftl"]
</head>
<table>
    <hr>
    <tr>
        <th>Company Name</th>
        <th>Company Code</th>
        <th>Add Time</th>
        <th>Option</th>
    </tr>

[#list page.content as item]
    <tr>
        <td>${item.comname}</td>
        <td>${item.comcode}</td>
        <td> [#if item.createtime??]${item.createtime?datetime}[/#if] </td>
        <td><button value="Delete" data-id="${item.id}" class="delBtn">Delete</button> </td>
    </tr>
[/#list]
</table>
<div><a href="add.action">add</a> </div>
[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
    [#include "/include/pagination.ftl"]
[/@pagination]
<script>
    seajs.use("alert", function (alertM) {
        $(".delBtn").on("click", function(){
            if(confirm("confirm delete this item?")){
                window.location.href = "del.action?id=" + $(this).data("id")
            }
        })
    })
</script>