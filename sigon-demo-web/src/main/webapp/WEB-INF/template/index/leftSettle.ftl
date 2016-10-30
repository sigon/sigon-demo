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
<form class="table" id="settleForm" style="min-width: 1000px">
    <table id="orderTable">
        <tbody>
        <tr>
            <th>Create date</th>
            <th>Merchant</th>
            <th>Account name</th>
            <th>Account no</th>
            <th>Bank name</th>
            <th>Currency</th>
            <th>Amount</th>
            <th>Paid amount</th>
            <th>Order no</th>
        </tr>
        [#if page.content?size>0]
            [#list page.content as item]
            <tr>
                <td>[@dateFormat value = item.createDate ][/@dateFormat]</td>
                <td>${item.code}</td>
                <td>${item.accountName}</td>
                <td>${item.accountNumber}</td>
                <td>${item.bankName}</td>
                <td>${item.currency}</td>
                <td> [@number num = item.amount][/@number]</td>
                <td> [@number num = item.paidAmount][/@number]</td>
                <td>
                    [#if item.orderNo?starts_with(orderP)]
                        <a href="/settleOrder/handle.action?orderNo=${item.orderNo}&id=${item.id}&pageNumber=${pageNumber}" title="Account Payable" onclick="window.top.i_p.add(this);return false">${item.orderNo}</a>
                    [/#if]
                </td>
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