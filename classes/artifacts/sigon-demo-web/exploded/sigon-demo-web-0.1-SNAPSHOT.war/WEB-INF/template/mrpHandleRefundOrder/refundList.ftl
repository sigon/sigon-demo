<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>

<h2 class="page_title">Settle Handle Refund History</h2>
<form id="listForm" action="refundList.action" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <menu>
        <div class="form">

            <p class="f_1p">
                <label class="f_info">Order No</label>
                <input type="text" id="tradeNo" name="tradeNo" value="${param.tradeNo}" >
            </p>

            <p class="f_2p">
                <label class="f_info">Create Date</label>
            [@inputRegion id="createDate" type="date"  start=param.createDateStart end=param.createDateEnd]
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
        <a href="javascript:history.go(-1);" class="btn" data-icon="p" >返回</a>
        <hr>
        <table>
            <tr>
                [#--<th>Create Date[@pageOrder pageable=page.pageable property="create_date"][/@pageOrder]</th>--]
                <th>Detail</th>
                <th>Code</th>
                <th>Order No</th>
                <th>To Account</th>
                <th>Currency</th>
                <th>Amount</th>
                <th>
                    <span class="b_tip">
                        Bank Charge
                        <span class="h_tip">
                        [@wrap value="POSITIVE or NEGATIVE：decrease or increase the bank account balance" labelMsg="" length=50][/@wrap]
                        </span>
                    </span>
                </th>
                <th>Comment</th>
                <th>Create Date[@pageOrder pageable=page.pageable property="create_date"][/@pageOrder]</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td>
                    [#if item.gatewayId??]
                        <a href="/settleOrder/payHistory.action?orderNo=${item.paymentOrderNo}&gatewayId=${item.gatewayId}" class="icon-open_in_new">查看拆分记录</a>
                    [#else]
                        <span class="icon-open_in_new">查看拆分记录</span>
                    [/#if]
                </td>
                <td><a href="/basicInfo/info.action?code=${item.code}">${item.code}</a></td>
                <td>
                    <a href="/mrpHandleRefundOrder/detail.action?orderNo=${item.refundOrderNo}">${item.refundOrderNo}</a>
                        <br>
                        <a href="/paymentOrder/detail.action?orderNo=${item.paymentOrderNo}&queryint=1">${item.paymentOrderNo}</a>
                </td>

                <td>${item.account}</td>
                <td>${item.currency}</td>
                <td>
                    [@number num = item.amount][/@number]
                </td>
                <td>[@number num = item.fee][/@number]</td>
                    <td>${item.comment}</td>
                <td>${item.createDate?string("yyyy-MM-dd")}</td>
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

    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>
