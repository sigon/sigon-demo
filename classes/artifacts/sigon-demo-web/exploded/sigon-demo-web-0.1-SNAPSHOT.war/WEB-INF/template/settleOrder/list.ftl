<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>

<h2 class="page_title">Account Payable</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Order No</label>
                <input type="text" id="orderNo" name="orderNo" value="${settleOrder.orderNo}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Merchant Code</label>
                <input type="text" id="code" name="code" value="${settleOrder.code}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Status</label>
                <select id="status" name="status" >
                    <option value="" >All</option>
                [#list settleOrderStatusEnum as item]
                    <option value="${item.code}" [#if item.code==settleOrder.status]selected[/#if]>${item.desc}</option>
                [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Currency</label>
                <select id="currency" name="currency"  >
                    <option value="" >All</option>
                [#list currencyEnum as item]
                    <option value="${item.descEng}" [#if item.descEng==settleOrder.currency]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>
            <p class="f_2p">
                <label class="f_info">Create Date</label>
            [@inputRegion id="createDate" type="date"   start=settleOrder.createDateStart end=settleOrder.createDateEnd]
                [#include "/include/inputregion.ftl"]
            [/@inputRegion]
            </p>
            <p class="f_2p">
                <label class="f_info">Amount</label>
            [@inputRegion id="amount" type="number" start=settleOrder.amountStart end=settleOrder.amountEnd]
                [#include "/include/inputregion.ftl"]
            [/@inputRegion]
            </p>

            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>
    </menu>
    <div class="table">
[@showMenu code="090302"]
        <a href="dispose.action" class="btn bg_green" >批量代付CNY交易单</a>
[/@showMenu]

[@showMenu code="090303"]
        <a href="/settleOrder/payHistory.action" class="btn bg_green" >查看批量代付历史</a>
[/@showMenu]
[@showMenu code="090304"]
    <a href="refundSome.action" class="btn bg_green" >批量代付退款</a>
[/@showMenu]
[@showMenu code="090305"]
<a href="/mrpHandleRefundOrder/refundList.action" class="btn bg_green">查看退款历史</a>
[/@showMenu]
    [#--<a href="/paymentInfo/transactionAdd.action">第四步交易单</a>--]
        <hr>
        <table>
            <tr>
                <th>Merchant Code</th>
                <th>Order No[@pageOrder pageable=page.pageable property="order_no"][/@pageOrder]</th>
                <th>Currency</th>
                <th>Amount</th>
                <th>Paid Amount</th>
                <th>Status[@pageOrder pageable=page.pageable property="status"][/@pageOrder]</th>
                <th>Create date[@pageOrder pageable=page.pageable property="id"][/@pageOrder]</th>
                <th>Modify date[@pageOrder pageable=page.pageable property="modify_date"][/@pageOrder]</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td><a href="/basicInfo/info.action?code=${item.code}" onclick="window.top.i_p.add(this);return false"> ${item.code}</a></td>
                <td>[@orderLink orderNo=item.orderNo]${item.orderNo}[/@orderLink]</td>
                <td>${item.currency}</td>
                <td>[@number num = item.amount][/@number]</td>
                <td>[@number num = item.paidAmount][/@number]</td>
                <td>${settleOrderStatusMap.get(item.status)}</td>
                <td>[@dateFormat format="yyyy-MM-dd" value=item.createDate][/@dateFormat]</td>
                <td>[@dateFormat format="yyyy-MM-dd" value=item.modifyDate][/@dateFormat]</td>
                <td>
                    [#if item.status==1]
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                        [@showMenu code="090301"]
                            <a href="handle.action?orderNo=${item.orderNo}&id=${item.id}" class="delete" data-icon="e">Handle</a>
                        [/@showMenu]
                    </span>
                    [/#if]

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
//        $(".edit,.add").on("click",function(){
//            var title=$(this).is(".add")?"SettleOrder Add":"SettleOrder Edit";
//            alertM(this.href,{
//                title:title,
//                time:"y",
//                width:660,
//                height:400,
//                iframe:1
//            })
//            return false;
//        });

      /*  $(function(){
          window.parent.refreshIframe1();
        })*/

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
