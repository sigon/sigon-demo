<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <style type="text/css">
        .table{
            margin: 9px;
        }
        body{
            padding: 0;;
        }
    </style>
</head>
<body>
<form class="table" id="supportForm" style="min-width: 440px">
    <table id="supportTable">
        <tbody>
        <tr>
            <th>Create date</th>
            <th>Merchant</th>
            <th>Department</th>
            <th>Issue</th>
        </tr>
        [#if page.content?size>0]
        [#list page.content as item]
        <tr>
            <td>[@dateFormat value = item.createDate ][/@dateFormat]</td>
            <td><a href="/merchantSupport/list.action?code=${item.code}&pageNumSup=${pageNumber}" title="Merchant Support" onclick="window.top.i_p.add(this);return false">${item.code}</a></td>
            <td>${item.department}</td>
            <td>${item.issue}</td>
        </tr>
        [/#list]
        [#else]
        <tr><td colspan="99">There are no records</td></tr>
        [/#if]
        </tbody>
    </table>
    [@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
        [#include "/include/paginationShort.ftl"]
    [/@pagination]
</form>
</body>
</html>