<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>

<h2 class="page_title">WalletSumDetail List</h2>
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
                <th>Trade Date</th>
                <th>Order No</th>
                <th>Trade Type</th>
                <th>Deposit</th>
                <th>Withdrawal</th>
                <th>Balance</th>
            </tr>

        [#list page.content as item]
            <tr>

                <td> ${item.createDate?datetime} </td>
                <td> ${item.orderNo} </td>
                <td> ${item.walletType} </td>
                [#if item.amount>0]
                        <td>${item.amount}</td>
                        <td></td>
                    [#else]
                        <td></td>
                        <td>${item.amount}</td>
                [/#if]
                <td> ${item.balance} </td>
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
