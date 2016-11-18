<table>
    <hr>
    <tr>
        <th>Name</th>
        <th>Add Time</th>
    </tr>

[#list page.content as item]
    <tr>
        <td>${item.title}</td>
        <td> [#if item.createDate??]${item.createDate?datetime}[/#if] </td>
    </tr>
[/#list]
</table>
[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
    [#include "/include/pagination.ftl"]
[/@pagination]