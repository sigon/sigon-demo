<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">TradingOrder List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">BranchId</label>
                <input type="text" id="branchId" name="branchId" value="${tradingOrder.branchId}" >
            </p>
            <p class="f_1p">
                <label class="f_info">OrderNo</label>
                <input type="text" id="orderNo" name="orderNo" value="${tradingOrder.orderNo}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Data</label>
                <input type="text" id="data" name="data" value="${tradingOrder.data}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Remark</label>
                <input type="text" id="remark" name="remark" value="${tradingOrder.remark}" >
            </p>
            <p class="f_1p">
                <label class="f_info">SellCurrency</label>
                <input type="text" id="sellCurrency" name="sellCurrency" value="${tradingOrder.sellCurrency}" >
            </p>
            <p class="f_1p">
                <label class="f_info">PriceLocked</label>
                <input type="text" id="priceLocked" name="priceLocked" value="${tradingOrder.priceLocked}" >
            </p>
            <p class="f_1p">
                <label class="f_info">IsFinish</label>
                <input type="text" id="isFinish" name="isFinish" value="${tradingOrder.isFinish}" >
            </p>
            <p class="f_1p">
                <label class="f_info">BuyCurrency</label>
                <input type="text" id="buyCurrency" name="buyCurrency" value="${tradingOrder.buyCurrency}" >
            </p>
            <p class="f_1p">
                <label class="f_info">DelFlag</label>
                <input type="text" id="delFlag" name="delFlag" value="${tradingOrder.delFlag}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Operator</label>
                <input type="text" id="operator" name="operator" value="${tradingOrder.operator}" >
            </p>
            <p class="f_1p">
                <label class="f_info">DepositOrder</label>
                <input type="text" id="depositOrder" name="depositOrder" value="${tradingOrder.depositOrder}" >
            </p>
            <p class="f_1p">
                <label class="f_info">BuyAmount</label>
                <input type="text" id="buyAmount" name="buyAmount" value="${tradingOrder.buyAmount}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Rate</label>
                <input type="text" id="rate" name="rate" value="${tradingOrder.rate}" >
            </p>
            <p class="f_1p">
                <label class="f_info">SellAmount</label>
                <input type="text" id="sellAmount" name="sellAmount" value="${tradingOrder.sellAmount}" >
            </p>
            <p class="f_1p">
                <label class="f_info">IsDeal</label>
                <input type="text" id="isDeal" name="isDeal" value="${tradingOrder.isDeal}" >
            </p>
                    [@inputRegion id="finishDate" type="date" start=tradingOrder.finishDateStart end=tradingOrder.tradingOrderEnd]
                    [#include "/include/inputregion.ftl"]
                    [/@inputRegion]
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm bg_blue" class="btn" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table">
            <a href="add.action" class="btn add bg_green" data-icon="a">Add</a>
            <hr>
        <table>
            <tr>
                <th>branchId</th>
                <th>orderNo</th>
                <th>data</th>
                <th>remark</th>
                <th>sellCurrency</th>
                <th>priceLocked</th>
                <th>isFinish</th>
                <th>buyCurrency</th>
                <th>delFlag</th>
                <th>operator</th>
                <th>depositOrder</th>
                <th>buyAmount</th>
                <th>rate</th>
                <th>sellAmount</th>
                <th>isDeal</th>
                <th>finishDate</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>

<td> ${item.branchId} </td>
<td> ${item.orderNo} </td>
<td> ${item.data} </td>
<td> ${item.remark} </td>
<td> ${item.sellCurrency} </td>
<td> ${item.priceLocked} </td>
<td> ${item.isFinish} </td>
<td> ${item.buyCurrency} </td>
<td> ${item.delFlag} </td>
<td> ${item.operator} </td>
<td> ${item.depositOrder} </td>
<td> ${item.buyAmount} </td>
<td> ${item.rate} </td>
<td> ${item.sellAmount} </td>
<td> ${item.isDeal} </td>
<td> ${item.finishDate?datetime} </td>                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                         <a href="edit.action?id=${item.id}" class="edit" data-icon="e">Edit</a>

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
            var title=$(this).is(".add")?"TradingOrder Add":"TradingOrder Edit";
            alertM(this.href,{
                title:title,
                time:"y",
                width:660,
                height:400,
                iframe:1
            })
            return false;
        });
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
