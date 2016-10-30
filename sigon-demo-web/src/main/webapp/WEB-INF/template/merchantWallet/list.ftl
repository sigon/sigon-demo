<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2 >Merchant Wallet</h2>
<div class="table">
    <table>
        <tr>
            <th>Currency</th>
            <th>Total amount</th>
            <th>Available amount</th>
            <th>Pending amount</th>
            <th>Bond amount</th>
        </tr>
    [#list wallets as item]
        <tr>
            <td>${item.currency}</td>
            <td>[@number num=item.amount][/@number]</td>
            <td>[@number num=item.availableAmount][/@number]</td>
            <td>[@number num=item.unavailableAmount][/@number]</td>
            <td>[@number num=item.bondAmount][/@number]</td>
        </tr>
    [/#list]
    </table>
</div>
<form id="listForm" action="list.action">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Merchant Code</label>
                <input type="text" id="code" name="code" value="${param.code}"  />
            </p>
            <p class="f_2p">
                <label class="f_info">Trade Date</label>
                [@inputRegion id="createDate" type="date" start=param.createDateStart end=param.createDateEnd]
                    [#include "/include/inputregion.ftl"]
                [/@inputRegion]
            </p>
            <p class="f_1p">
                <label class="f_info">Order No</label>
                <input type="text" id="orderNo" name="orderNo" value="${param.orderNo}" />
            </p>
            <p>
                <label class="f_info">Trade Type</label>
                [#list walletTypeEnum as enum]
                    <input type="checkbox" name="walletType" value="${enum.id}" id="${enum.descEn}" [#if walletTypeChecked?index_of(enum.descEn)!=-1]checked[/#if]><label class="f_for" for="${enum.descEn}">${enum.descEn}</label>
                [/#list]
                <span class="fr">
                    <input type="checkbox" [#if allWalletType?if_exists]checked[/#if] name="allWalletType" value="1" id="allWalletType"><label class="f_for" for="allWalletType">Select All</label>
                </span>
            </p>
            <p>
                <label class="f_info">Currency</label>
                [#assign num=0]
                [#list wallets as item]
                    [#if num%6==0 && num>0]<br>[/#if]
                    [#assign num=num+1]
                    <input type="checkbox" name="currency" value="${item.currency}" id="${item.currency}" [#if currencyChecked?index_of(item.currency)!=-1]checked[/#if]><label class="f_for" for="${item.currency}">${item.currency}</label>
                [/#list]
                <span class="fr">
                    <input type="checkbox" [#if allCurrency?if_exists]checked[/#if]  name="allCurrency" value="1" id="allCurrency"><label class="f_for" for="allCurrency">Select All</label>
                </span>
            </p>

            <p >
                <button id="searchForm" type="submit" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>
    </menu>
    <div class="table">
        <table>
            <tr>
                <th>Merchant Code</th>
                <th>Trade Date[@pageOrder pageable=page.pageable property="id"][/@pageOrder]</th>
                <th>Order No[@pageOrder pageable=page.pageable property="order_no"][/@pageOrder]</th>
                <th>Trade Type</th>
                <th>Deposit</th>
                <th>Withdrawal</th>
                <th>Balance[@pageOrder pageable=page.pageable property="balance"][/@pageOrder]</th>
            </tr>
        [#list page.content as item]
            <tr>
                <td><a href="/basicInfo/info.action?code=${item.code}" onclick="window.top.i_p.add(this);return false">${item.code}</a></td>
                <td>${item.createDate?datetime}</td>
                <td>
                    [#if item.orderNo?starts_with("RE")]
                        <a href="/mrpHandleRefundOrder/detail.action?orderNo=${item.orderNo?split("<br/>")[0]}">${item.orderNo?split("<br/>")[0]}</a>
                        [#else]
                        [@orderLink orderNo=item.orderNo]${item.orderNo}[/@orderLink]
                    [/#if]

                </td>
                <td>${walletTypeMap.get(item.walletType).descEn}</td>
                [#if item.amount>0]
                    <td>${item.currency} [@number num=item.amount][/@number]</td>
                    <td></td>
                    [#else ]
                    <td></td>
                    <td>${item.currency} [@number num=item.amount][/@number]</td>
                [/#if]
                <td>${item.currency} [@number num=item.balance][/@number]</td>
            </tr>
        [/#list]
        </table>
        [@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
            [#include "/include/pagination.ftl"]
        [/@pagination]
    </div>
</form>
<script>
    seajs.use(["alert","role","validation"],function(alertM,role){
        $("#allWalletType").on("click",function(){
            if($("#allWalletType").prop("checked")){
                $("input[name='walletType']").prop("checked", true);
            }else{
                $("input[name='walletType']").prop("checked", false);
            }
        });
        $("#allCurrency").on("click",function(){
            if($("#allCurrency").prop("checked")){
                $("input[name='currency']").prop("checked", true);
            }else{
                $("input[name='currency']").prop("checked", false);
            }
        });
    });
</script>
</body>
</html>