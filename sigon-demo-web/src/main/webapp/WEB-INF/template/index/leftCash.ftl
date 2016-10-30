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
<form class="table" id="cashForm" style="min-width: 1000px">
    <input id="pageNumber" name="pageNumber" value="1" data-pageindex="${pageNumber}" data-pagelength="${totalPages}" type="hidden"/>
    <input type="hidden" id="sortname" name="orderProperty" value="${page.orderProperty}" />
    <input type="hidden" id="sortval" name="orderDirection" value="${page.orderDirection}" />
    <input type="hidden" id="queryint" name="queryint" value="1">
        <div class="form">
            <div>
            <p class="f_1p" style="width: 15%">
                <label class="f_info">Type</label>
                <select id="tradeType" name="tradeType" >
                    <option value="" >All</option>
                [#list typeEnumList as item]
                    [#if item.code == 1 || item.code == 2]
                    <option value="${item.code}" [#if item.code==cashOrder.tradeType]selected[/#if]>${item.desc}</option>
                    [/#if]
                [/#list]
                </select>
            </p>
            <p class="f_1p" style="width: 15%">
                <label class="f_info">Order No</label>
                <input type="text" id="orderNo" name="orderNo" value="${cashOrder.orderNo}" >
            </p>
            <p  class="f_1p" style="width: 15%">
                <label class="f_info">&nbsp;</label>
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
            </p>
            </div>

        </div>
    <table id="cashTable">
        <tbody>
        <tr>
            <th>Order No[@pageOrder pageable=pageable property="order_no"][/@pageOrder]</th>
            <th>From CashHolder</th>
            <th>To CashHolder</th>
            <th>Type</th>
            <th>Create Date[@pageOrder pageable=pageable property="create_date"][/@pageOrder]</th>
            <th>Actions</th>
        </tr>
        [#if list?size>0]
        [#list list as item]
        <tr>
            <td>[@orderLink orderNo = item.orderNo userName = userId ]${item.orderNo}[/@orderLink]</td>
            <td>${cashholdMap.get(item.fromCashholdId)}</td>
            <td>${cashholdMap.get(item.toCashholdId)}</td>
            <td>${typeEnumMap.get(item.tradeType).desc}</td>
            <td>${item.createDate?datetime}</td>
            <td>
                <span class="btn_i item_menu">
                    o<span data-itemid="${item.orderNo}">
                    [#if (item.tradeType == 1 && item.fromUserId == userId) || (item.tradeType == 2 && item.toUserId == userId)]
                        [@showMenu code='110203']
                    <a href="/cashOrder/confirm.action?orderNo=${item.orderNo}&confirm=true" class="edit" data-icon="e" title="Confirm Cash Borrowing" onclick="window.top.i_p.add(this);return false">Confirm</a>
                        [/@showMenu]
                        [@showMenu code='110204']
                    <a href="/cashOrder/confirm.action?orderNo=${item.orderNo}&confirm=false" class="edit" data-icon="e" title="Reject Cash Borrowing" onclick="window.top.i_p.add(this);return false">Reject</a>
                        [/@showMenu]
                    [/#if]
                    [@showMenu code='110205']
                    [#if (item.tradeType == 1 && item.toUserId == userId) || (item.tradeType == 2 && item.fromUserId == userId)]
                    <a href="javascript:" data-itemid="${item.orderNo}" class="delete" data-icon="d">Delete</a>
                    [/#if]
                    [/@showMenu]
                </span>
            </td>
        </tr>
        [/#list]
        [#else]
        <tr><td colspan="99">There are no records</td></tr>
        [/#if]
        </tbody${item.balance}>
    </table>

</form>
<script>
    seajs.use(["alert","validation","pagenation"], function (alertM) {
        $(".delete").on("click",function(){
            var $t=$(this);
            var confirm = window.top.i_p.cashOrderDelete($t,window);
        })
    })
</script>
</body>
</html>