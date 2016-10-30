<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
[#include "/basicInfo/menu.ftl"]
<body>
<h2 >Merchant Wallet Detail</h2>
    <div class="panel">
        <h4 >Merchant Info</h4>
        <p >
            <label class="f_info">Merchant code：${code}</label>
        </p>
        <p >
            <label class="f_info">Merchant name：${merchantName}</label>
        </p>
    </div>
    <div class="table">
        <h4 >Balance</h4>
        <table>
            <tr>
                <th>Currency</th>
                <th>Total amount</th>
                <th>Available amount</th>
                <th>Pending amount</th>
                <th>Bond amount</th>
                <th>Actions</th>
            </tr>
        [#if listWallet?size>0]
        [#list listWallet as item]
            <tr>
                <td>${item.currency}</td>
                <td>[@number num=item.amount][/@number]</td>
                <td>[@number num=item.availableAmount][/@number]</td>
                <td>[@number num=item.unavailableAmount][/@number]</td>
                <td>[@number num=item.bondAmount][/@number]</td>
                <!--调整操作-->
                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                        [@showMenu code="030227"]
                            <a href="/merchantWallet/adjust.action?code=${code}&currency=${item.currency}" class="edit" data-icon="e">Adjust balance</a>
                        [/@showMenu]
                        </span>
                    </span>
                </td>
            </tr>
        [/#list]
        [#else]
            <tr>
                <td colspan="99">There are no records</td>
            </tr>
        [/#if]
        </table>

    </div>

<form id="searchForm" action="detail.action" method="get">
    <input type="hidden" name="code" value="${code}">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <menu>
        <h4 >Transaction</h4>
        <div class="form">
            <p>
                <label class="f_info">Trade Date</label>
                [@inputRegion id="createDate" type="date" start=param.createDateStart end=param.createDateEnd]
                    [#include "/include/inputregion.ftl"]
                [/@inputRegion]
            </p>
            <p class="f_1p">
                <label class="f_info">Order No</label>
                <input type="text" id="orderNo" name="orderNo" value="${param.orderNo}" >
            </p>
            <p >
                <label class="f_info">Trade Type </label>
                [#list walletTypeEnum as enum]
                    <input type="checkbox" name="walletType" value="${enum.id}" id="${enum.descEn}" [#if walletTypeChecked?index_of(enum.descEn)!=-1]checked[/#if]><label class="f_for" for="${enum.descEn}">${enum.descEn}</label>
                [/#list]
                <span class="fr">
                    <input type="checkbox" [#if allWalletType?if_exists]checked[/#if] name="allWalletType" value="1" id="allWalletType"><label class="f_for" for="allWalletType">Select All</label>
                </span>
            </p>
            <p>
                <label class="f_info">Currency </label>
                [#assign num=0]
                [#list listWallet as wallet]
                    [#if num%6==0 && num>0]<br>[/#if]
                    [#assign num=num+1]
                    <input type="checkbox" name="currency" value="${wallet.currency}" id="${wallet.currency}" [#if currencyChecked?index_of(wallet.currency)!=-1]checked[/#if] ><label class="f_for" for="${wallet.currency}">${wallet.currency}</label>
                [/#list]
                <span class="fr">
                    <input type="checkbox" [#if allCurrency?if_exists]checked[/#if] name="allCurrency" value="1" id="allCurrency"><label class="f_for" for="allCurrency">Select All</label>
                </span>
            </p>
            <p >
                <button id="submitForm" type="submit" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#searchForm')">Reset</a>
            </p>
        </div>
    </menu>
    <div class="table">
        <table>
            <tr>
                <th>Trade Date[@pageOrder pageable=page.pageable property="create_date"][/@pageOrder]</th>
                <th>Order No[@pageOrder pageable=page.pageable property="order_no"][/@pageOrder]</th>
                <th>Trade Type</th>
                <th>Deposit</th>
                <th>Withdrawal</th>
                <th>Balance[@pageOrder pageable=page.pageable property="balance"][/@pageOrder]</th>
            </tr>
        [#list page.content as item]
            <tr>
                <td>[@dateFormat value = item.createDate][/@dateFormat]</td>
                <td>
                    [#if item.orderNo?starts_with("RE")]
                        <a href="/mrpHandleRefundOrder/detail.action?orderNo=${item.orderNo?split("<br/>")[0]}">${item.orderNo?split("<br/>")[0]}</a>
                    [#else]
                        [@orderLink orderNo=item.orderNo]${item.orderNo}[/@orderLink]
                    [/#if]
                    [#--[@orderLink orderNo=item.orderNo]${item.orderNo}[/@orderLink]--]
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

        $(".edit").on("click",function(){
                var title="Adjust balance";
                alertM(this.href,{
                    title:title,
                    time:"y",
                    width:660,
                    height:480,
                    iframe:1
                })
                return false;
            });

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

            window.refresh=function(t){
                if(t)
                    window.location.reload()
                alertM.remove()
            };

    });
</script>
</body>
</html>