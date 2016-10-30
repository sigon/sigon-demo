<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>

<h2 class="page_title">Settle Handle History</h2>
<form id="listForm" action="payHistory.action" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Pay Order No</label>
                <input type="text" id="payOrderNo" name="payOrderNo" value="${param.payOrderNo}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Order No</label>
                <input type="text" id="orderNo" name="orderNo" value="${param.orderNo}" >
            </p>
            <p class="f_1p">
                <label class="f_info">From Account</label>
                <select id="gatewayId" name="gatewayId" >
                    <option value="" >All</option>
                [#list gatewayMap.keySet() as item]
                    <option value="${item}" [#if item==param.gatewayId]selected[/#if]>${gatewayMap.get(item)}</option>
                [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Status</label>
                <select id="status" name="status" >
                    <option value="" >All</option>
                [#list statusList as item]
                    <option value="${item.index}" [#if item.index==param.status]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>
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
                <th>Create Date[@pageOrder pageable=page.pageable property="create_date"][/@pageOrder]</th>
                <th>Order No<br> Pay Order No</th>
                <th>From Account</th>
                <th>Amount <br>Fee</th>
                <th>Account Name <br>Account No</th>
                <th>Bank Name<br> Bank Branch <br>CNAPS Code</th>
                <th>Province <br>City</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td>${item.createDate?datetime}</td>
                <td>
                ${item.orderNo}
                    <br>
                ${item.payOrderNo}
                </td>
                <td>${gatewayMap.get(item.gatewayId)}</td>
                <td>
                    [@number num = item.amount][/@number] <br>[@number num = item.fee][/@number]
                </td>

                <td>
                ${item.accountName} <br>${item.accountNo}
                </td>
                <td>
                ${item.bankName}
                    <br>
                ${item.bankBranch}
                    <br>
                ${item.unionCode}
                </td>
                <td>
                ${item.province} <br>${item.city}
                </td>
                <td>
                    <span class="b_tip">
                        ${statusMap.get(item.status).descEng}
                            <span class="h_tip">
                             [@wrap value=statusMap.get(item.status).desc labelMsg="" length=30][/@wrap]
                         </span>
                    </span>
                </td>
                <td>
                    [#if item.status==103]
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                            <a href="/settleOrder/refund.action?id=${item.id}" class="refund" data-icon="e">Refund</a>
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
        $(".refund").on("click",function(){
            var title="Refund";
            alertM(this.href,{
                title:title,
                time:"y",
                width:660,
                iframe:1
            })
            return false;
        });

//        $(function(){
//          window.parent.refreshIframe1();
//        })

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
