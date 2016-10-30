<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>

<h2 class="page_title">Daily Dealing Summary</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">CurrencyPair</label>
                <select id="currencyPair" name="currencyPair" >
                    <option value="" >Please select</option>
                [#list pairList as item]
                    <option value="${item.name}" [#if item.name==dealingSummary.currencyPair]selected[/#if]>${item.shortName}</option>
                [/#list]
                </select>
            </p>
        [#if dataLevelEnum != null]
            <p class="f_1p">
                <label class="f_info">Data</label>
                <select id="level" name="level" >
                    <option value="" >All</option>
                    [#list dataLevelEnum as item]
                        <option value="${item.code}" [#if item.code==dealingSummary.level]selected[/#if]>${item.desc}</option>
                    [/#list]
                </select>
            </p>
        [/#if]
            <p class="f_2p">
                <label class="f_info">Trade Date</label>
            [@inputRegion id="createDate" type="date" start=dealingSummary.createDateStart end=dealingSummary.createDateEnd]
                [#include "/include/inputregion.ftl"]
            [/@inputRegion]
            </p>

            <p class="f_1p">
                <label class="f_info">Deal No</label>
                <input type="text" id="dealNo" name="dealNo" value="${dealingSummary.dealNo}" >
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_2p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a id="searchNewTab" class="btn bg_blue" data-icon="s" title="Daily Dealing Summary">Search&New Tab</a>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table">
    [@showMenu code="100301"]
        <a id="cal" href="/dailyDealingSummary/cal.action" class="btn bg_green" >Cal Profit</a>
    [/@showMenu]
        <hr>
        <table>
            <tr>
                <th>Trade Date[@pageOrder pageable=page.pageable property="create_date"][/@pageOrder]</th>
                <th id="leftBuy">Buy XXX</th>
                <th>Rate</th>
                <th id="leftSell">Sell XXX</th>
                <th id="rightBuy">Buy XXX</th>
                <th>Rate</th>
                <th id="rightSell">Sell XXX</th>
                <th>isDeal</th>
            </tr>

        [#list page.content as item]
        [#if item_index < page.content.size()-2]
            <tr>
                <td>
                [#if item.dealType == 1]
                    <a href="/dealingSummary/list.action?currencyPair=${dealingSummary.currencyPair}&isDeal=${item.isDeal}&level=${dealingSummary.level}&createDateStart=${item.createDate?date}&createDateEnd=${item.createDate?date}&queryint=1" title="Dealing Summary" onclick="window.top.i_p.add(this);return false">${item.createDate?date}</a>
                [#else]
                    <a href="/dealingSummary/list.action?dealNo=${item.sumNo}&currencyPair=${dealingSummary.currencyPair}&isDeal=1&queryint=1" title="Dealing Summary" onclick="window.top.i_p.add(this);return false">${item.createDate?datetime}</a>
                [/#if]
                </td>
                <td> [#if item.leftAmountPay != 0][@number num = item.leftAmountPay][/@number][/#if] </td>
                <td> [#if item.leftRate != "0.0000"]${item.leftRate}[/#if] </td>
                <td> [#if item.leftAmountReceive != 0][@number num = item.leftAmountReceive][/@number][/#if] </td>
                <td> [#if item.rightAmountPay != 0][@number num = item.rightAmountPay][/@number][/#if] </td>
                <td> [#if item.rightRate != "0.0000"]${item.rightRate}[/#if] </td>
                <td> [#if item.rightAmountReceive != 0][@number num = item.rightAmountReceive][/@number][/#if] </td>
                <td> ${whetherEnumMap.get(item.isDeal)} </td>
            </tr>
        [#elseif item_index < page.content.size()-1]
            <tr>
                <td>Sum</td>
                <td> [@number num = item.leftAmountPay][/@number] </td>
                <td> ${item.leftRate} </td>
                <td> [@number num = item.leftAmountReceive][/@number] </td>
                <td> [@number num = item.rightAmountPay][/@number] </td>
                <td> ${item.rightRate} </td>
                <td> [@number num = item.rightAmountReceive][/@number] </td>
                <td></td>
            </tr>
        [#else]
            <tr>
                <td>Balance</td>
                <td> [@number num = item.leftAmountPay][/@number] </td>
                <td> ${item.leftRate} </td>
                <td> [@number num = item.leftAmountReceive][/@number] </td>
                <td> [@number num = item.rightAmountPay][/@number] </td>
                <td> ${item.rightRate} </td>
                <td> [@number num = item.rightAmountReceive][/@number] </td>
                <td></td>
            </tr>
        [/#if]
        [/#list]
        </table>
    [@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
        [#include "/include/pagination.ftl"]
    [/@pagination]
    </div>
</form>

<script>

    seajs.use(["alert","validation"], function (alertM) {
        var pair = $("#currencyPair")

        $("#searchNewTab").on("click",function(){
            if (pair.val()==""){
                alertM("需要选择一个货币对",{cls:"error"})
                return false;
            }
            $(this).attr("href", "/dailyDealingSummary/list.action?"+$("#listForm").serialize());
            top.i_p.add(this)
            return false;
        })

        $("#cal").on("click",function(){
            if (pair.val()==""){
                alertM("需要选择一个货币对",{cls:"error"})
                return false;
            }
            window.location.href = this.href + "?" + $("#listForm").serialize();
            return false;
        });
        $("#reset").on("click",function(){
            $("#status").val("1");
        })

        $("#listForm").on("submit",function(){
            if (pair.val()==""){
                alertM("需要选择一个货币对",{cls:"error"})
                return false;
            }
        })

        window.refresh=function(t){
            if(t)
                window.location.reload()
            alertM.remove()
        }

        $(document).ready(function() {
            var currencyPair = $("#currencyPair").val();
            if (currencyPair) {
                var currencyPairArray = currencyPair.split('@@');
                $("#leftBuy").html("Buy " + currencyPairArray[0]);
                $("#leftSell").html("Sell " + currencyPairArray[1]);
                $("#rightBuy").html("Buy " + currencyPairArray[1]);
                $("#rightSell").html("Sell " + currencyPairArray[0]);
            }
        });
    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>
