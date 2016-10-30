<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>

<h2 class="page_title">PaymentOrder List</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <menu>

        <div class="form">
            <p class="f_1p">
                <label class="f_info">MerchantCode</label>
                <input type="text" id="code" name="code" value="${paymentOrder.code}" >
            </p>
            <p class="f_2p">
                <label class="f_info">Trade Date</label>
            [@inputRegion id="createDate" type="date"   start=paymentOrder.createDateStart end=paymentOrder.createDateEnd]
                [#include "/include/inputregion.ftl"]
            [/@inputRegion]
            </p>

            <p class="f_1p">
                <label class="f_info">Order Currency</label>
                <select id="currencyAfter" name="currencyAfter"  >
                    <option value="" >Please select</option>
                [#list currencyEnum as item]
                    <option value="${item.descEng}" [#if item.descEng==paymentOrder.currencyAfter]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>

            <p class="f_1p">
                <label class="f_info">Status</label>
                <select id="status" name="status" >
                    <option value="" >All</option>
                [#list paymentOrderStatusEnum as item]
                    <option value="${item.code}" [#if item.code==paymentOrder.status]selected[/#if]>${item.desc}</option>
                [/#list]
                </select>
            </p>


            <p class="f_1p">
                <label class="f_info">Receiver</label>
                <input type="text" id="accountName" name="accountName" value="${paymentOrder.accountName}" >
            </p>


            <p class="f_1p">
                <label class="f_info">Order No</label>
                <input type="text" id="orderNo" name="orderNo" value="${paymentOrder.orderNo}" >
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>
    </menu>
    <div class="table">
        <table>
            <tr>
                <th>MerchantCode</th>
                <th>Order No</th>
                <th>Currency</th>
                <th>Amount</th>
                <th>Receiver</th>
                <th>Status</th>
                <th>Create Date[@pageOrder pageable=page.pageable property="id"][/@pageOrder]</th>
                <th>Modify Date[@pageOrder pageable=page.pageable property="modify_date"][/@pageOrder]</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td><a href="javascript:" class="btn_i td_down">M<a href="/basicInfo/info.action?code=${item.code}" onclick="window.top.i_p.add(this);return false"> ${item.code}</a></td>
                <td><a href="/paymentOrder/detail.action?orderNo=${item.orderNo}&queryint=1"> ${item.orderNo}</a></td>
                <td> ${item.currencyAfter}</td>
                <td> [@number num = item.amountAfter][/@number]</td>
                <td width="99"> ${item.accountName}</td>
                <td> ${paymentOrderStatusMap.get(item.status)}</td>
                <td>[@dateFormat format="yyyy-MM-dd" value=item.createDate][/@dateFormat]</td>
                <td>[@dateFormat format="yyyy-MM-dd" value=item.modifyDate][/@dateFormat]</td>
            </tr>
            <tr class="tr_hide">
                <td colspan="99">
                    <div class="form_detail">
                        [#if item.currencyAfter=="CNY"]
                        <p class="form_detail_margin">
                            <label>National ID Name:</label> <b>${item.idName}</b>
                            <i class="orange icon-close"></i>
                        </p>
                        [/#if]
                        <p>
                            <label>Account name:</label>
                            <b>${item.accountName}</b>
                        </p>
                        <p>
                            <label>Account Number:</label>
                            <b>${item.accountNumber}</b>
                        </p>
                        <p>
                            <label>Bank name:</label>
                            <b>${item.bankName}</b>
                        </p>
                        <p>
                            <label>Branch:</label>
                            <b>${item.bankBranch}</b>
                        </p>
                        <p>
                            <label>Purpose of payment:</label>
                            <b>${item.remark}</b>
                        </p>
                    </div>
                    <div class="form_detail">
                [#if item.currencyAfter=="CNY"]
                        <p class="form_detail_margin">
                            <label>National ID number:</label>
                            <b>${item.idNumber}</b>
                        </p>
                [/#if]
                        <p>
                            <label>Reference:</label>
                            <b>[@showValue value=item.reference][/@showValue]</b>
                        </p>
                        <p>
                            <label>Fee:</label>
                            <b>${item.currencyBefore} [@number num = item.fee][/@number]</b>
                        </p>
                        <p>
                            <label>Paid amount:</label>
                            <b>${item.currencyAfter} [@number num = item.paidAmount][/@number]</b>
                        </p>
                        <p>
                            <label>Deducted amount:</label>
                            <b>${item.currencyBefore} [@number num = item.amountBefore][/@number]</b>
                        </p>

                    </div>
                </td>
            </tr>[/#list]
        </table>
    [@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
        [#include "/include/pagination.ftl"]
    [/@pagination]
    </div>
</form>

<script>

    seajs.use(["alert","validation"], function (alertM) {
        $(".edit,.add").on("click",function(){
            var title="补单";
            alertM(this.href,{
                title:title,
                time:"y",
                width:650,
                height:150,
                iframe:1
            })
            return false;
        });

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
