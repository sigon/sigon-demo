<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>

<h2 class="page_title">Orders</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <menu>
        <div class="form">
            <p class="f_2p">
                <label class="f_info">Trade Date</label>
            [@inputRegion id="createDate" type="date"   start=apiOrder.createDateStart end=apiOrder.createDateEnd]
                [#include "/include/inputregion.ftl"]
            [/@inputRegion]
            </p>

            <p class="f_1p">
                <label class="f_info">Merchant Code</label>
                <input type="text" id="merchantCode" name="merchantCode" value="${apiOrder.merchantCode}" >
            </p>

            <p class="f_1p">
                <label class="f_info">Order Currency</label>
                <select id="currencyReceive" name="currencyReceive"  >
                    <option value="" >All</option>
                [#list currencyEnum as item]
                    <option value="${item.descEng}" [#if item.descEng==apiOrder.currencyReceive]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>

            <p class="f_1p">
                <label class="f_info">Status</label>
                <select id="tradeState" name="tradeState" >
                    <option value="" >All</option>
                [#list tradeStateEnum as item]
                    <option value="${item.index}" [#if item.index==apiOrder.tradeState]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>

            <p class="f_2p">
                <label class="f_info">Order Amount</label>
            [@inputRegion id="tradeAmount" type="number" start=apiOrder.tradeAmountStart end=apiOrder.tradeAmountEnd]
                [#include "/include/inputregion.ftl"]
            [/@inputRegion]
            </p>

            <p class="f_1p">
                <label class="f_info">Payer</label>
                <input type="text" id="payerName" name="payerName" value="${apiOrder.payerName}" >
            </p>


            <p class="f_1p">
                <label class="f_info">MRP Order</label>
                <input type="text" id="orderId" name="orderId" value="${apiOrder.orderId}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Merchant Order</label>
                <input type="text" id="receiveOrderId" name="receiveOrderId" value="${apiOrder.receiveOrderId}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Notice</label>
                <select id="noticeState" name="noticeState" >
                    <option value="" >All</option>
                    [#list noticeEnum as item]
                        <option value="${item.index}" [#if item.index==apiOrder.noticeState]selected[/#if]>${item.desc}</option>
                    [/#list]
                    </option>
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
        <table>
            <tr>
                <th ></th>
                <th>MerchantCode</th>
                <th>Date[@pageOrder pageable=page.pageable property="create_date"][/@pageOrder]</th>
                <th>Merchant order</th>
                <th>MRP order</th>
                <th>Payer</th>
                <th>Amount</th>
                <th>Fee</th>
                <th>Status</th>
                <th>Notice</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td><a href="javascript:" class="btn_i td_down">M</td>
                <td><a href="/basicInfo/info.action?code=${item.merchantCode}" onclick="window.top.i_p.add(this);return false"> ${item.merchantCode}</a></td>
                <td>[@dateFormat format="yyyy-MM-dd HH:mm:ss" value=item.createDate][/@dateFormat]</td>
                <td> <a href="/apiOrder/detail.action?orderId=${item.orderId}&queryint=1">${item.receiveOrderId}</a></td>
                <td> ${item.orderId}</td>
                <td> ${item.payerName}</td>
                <td> ${item.currencyReceive} [@number num = item.tradeAmount][/@number]</td>
                <td> ${item.currencyReceive} [@number num = item.feeAmtSys][/@number]</td>
                <td> ${tradeStateMap.get(item.tradeState)}</td>
                <td> [#if item.backUrl!=null && item.backUrl!=""]${noticeEnumMap.get(item.noticeState).desc}[/#if]</td>
                <td>
                    [#if (item.tradeState==0||item.tradeState==999)||(item.tradeState!=999 && item.tradeState !=0 && item.backUrl!=null && item.backUrl!="")]
                    <span class="btn_i item_menu" data-itemid="${item.orderId}">
                        o<span data-itemid="${item.orderId}">
                        [#if item.tradeState==0||item.tradeState==999]
                            [@showMenu code ="090101"]
                         <a href="edit.action?id=${item.orderId}" class="edit" data-icon="e">Re-submit an order</a>
                            [/@showMenu]
                        [/#if]
                    [#if item.tradeState!=999 && item.tradeState !=0 && item.backUrl!=null && item.backUrl!=""]
                        [@showMenu code ="090102"]
                        <a href="javascript:void(0);" class="noticeAgain" data-icon="e">Re-send the notification</a>
                        [/@showMenu]
                    [/#if]
                        </span>
                    </span>
                    [/#if]
                </td>

            </tr>
            <tr class="tr_hide">
                <td colspan="99">
                    <div class="form_detail">
                        <p class="form_detail_margin mobile_show">
                        </p>
                        <p class="form_detail_margin">
                            <label>Paid by:</label> <b>${item.idCardName}</b>
                            <i class="orange icon-close"></i>
                        </p>
                        <p>
                            <label>Merchant order number:</label>
                            <b>${item.receiveOrderId}</b>
                        </p>

                        <p>
                            <label>Order amount:</label>
                            <b>${item.currencyReceive} [@number num = item.tradeAmount][/@number]</b>
                        </p>
                        <p>
                            <label>Rate:</label>
                            <b> [@number num = item.rate m=100000 formatStr=",##0.0000"][/@number]</b>
                        </p>
                        <p>
                            <label>Fee amount:</label>
                            <b>${item.currencyReceive} [@number num = item.feeAmtSys][/@number]</b>
                        </p>
                    </div>
                    <div class="form_detail">
                        <p class="form_detail_margin">
                            <label>National ID number:</label>
                            <b>${item.idCard}</b>
                        </p>
                        <p>
                            <label>MRP order:</label>
                            <b>${item.orderId}</b>
                        </p>
                        <p>
                            <label>CNY amount:</label>
                            <b>CNY [@number num = item.wholeAmount][/@number]</b>
                        </p>
                        <p>
                            <label>Payment method:</label>
                            <b>${gatewayTypeMap.get(item.gatewayType).paymentType}</b>
                        </p>
                        <p>
                            <label>Order status:</label>
                            <b>${tradeStateMap.get(item.tradeState)}</b>
                        </p>
                    </div>
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
            var title="Re-submit an order";
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
        $(".noticeAgain").on("click",function(){
            var $t=$(this);
            var itemid=$t.parent().data("itemid") ;
            alertM.end("noticeAgain.action","id="+itemid,"list.action");
        })
    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>
