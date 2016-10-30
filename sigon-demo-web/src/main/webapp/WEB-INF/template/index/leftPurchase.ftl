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
<form class="table" id="purchaseForm" style="min-width: 400px">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <table id="orderTable">
        <tbody>
        <tr>
            <th>Provider</th>
            <th>Currency</th>
            <th>Direction</th>
            <th>Balance</th>

        </tr>
        [#if list?size>0]
        [#list list as item]
        [#if item.balance > 0]
        <tr>
            [#if item.direction==receivable]
                <td><a href="/purchaseOrder/list.action?providerId=${item.providerId}&receivable=${unreceived}&receivable=${partial}&settleDateEnd=${today}&buyCurrency=${item.currency}&queryint=1" title="Pending Purchase Order" onclick="window.top.i_p.add(this);return false">${item.provider}</a></td>
            [#elseif item.purchaseType = ZJGH]
                <td><a href="/purchaseOrder/list.action?providerId=${item.providerId}&payable=${unpaid}&payable=${partial}&settleDateEnd=${today}&sellCurrency=${item.currency}&midCurrency=${item.currency}&queryint=1" title="Pending Purchase Order" onclick="window.top.i_p.add(this);return false">${item.provider}</a></td>
            [/#if]
            <td>${item.currency}</td>
            <td>${directionEnumMap.get(item.direction).desc}</td>
            <td>[@number num =item.balance /]</td>

        </tr>
        [/#if]
        [/#list]
        [#else]
        <tr><td colspan="99">There are no records</td></tr>
        [/#if]
        </tbody${item.balance}>
    </table>

</form>
</body>
</html>