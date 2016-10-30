<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>

<h2 class="page_title">WalletDetail List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Merchant Code</label>
                <input type="text" id="code" name="code" value="${walletDetail.code}" >
            </p>

            <p class="f_1p">
                <label class="f_info">Order No</label>
                <input type="text" id="orderNo" name="orderNo" value="${walletDetail.orderNo}" >
            </p>

            <p class="f_2p">
                <label class="f_info">WalletType</label>
                [#list walletTypeEnum as walletType ]
                    <label for="type${walletType.id}" class="f_for"><input type="checkbox" id="type${walletType.id}" name="walletType" value="${walletType.id}" >${walletType.desc}</label>
                [/#list]

            </p>
            <p class="f_2p">
                <label class="f_info">Trade Date</label>
            [@inputRegion id="createDate" type="date" start=walletDetail.createDateStart end=walletDetail.createDetailEnd]
            [#include "/include/inputregion.ftl"]
            [/@inputRegion]
            </p>

            <p class="f_2p">

                <label class="f_info">Currency</label>
                [#list walletCurrencyEnum as currency ]
                    <label for="currency${currency.index}" class="f_for"><input type="checkbox" id="currency${currency.index}" name="currency" value="${currency.index}" >${currency.descEng}</label>
                [/#list]
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>
        <a href="add.action" class="btn add" data-icon="a">Add</a>
    </menu>
    <div class="table">
        <table>
            <tr>
                <th>amount</th>
                <th>code</th>
                <th>orderNo</th>
                <th>isUsable</th>
                <th>walletType</th>
                <th>usableDate</th>
                <th>currency</th>
                <th>isBond</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>

<td> ${item.amount} </td>
<td> ${item.code} </td>
<td> ${item.orderNo} </td>
<td> ${item.isUsable} </td>
<td> ${item.walletType} </td>
<td> ${item.usableDate?datetime} </td>
<td> ${item.currency} </td>
<td> ${item.isBond} </td>                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                         <a href="edit.action?id=${item.id}" class="edit" data-icon="e">Edit</a>
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
        $("#reset").on("click",function(){
            $("#status").val("1");
        })

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
