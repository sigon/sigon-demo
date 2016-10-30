<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>

<h2 class="page_title">Dealing Summary</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <menu>
        <div class="form" id="filter">
            <p class="f_1p">
                <label class="f_info">CurrencyPair</label>
                <select id="currencyPair" name="currencyPair" >
                    <option value="" >Please select</option>
                [#list pairList as item]
                    <option value="${item.name}" [#if item.name==dealingSummary.currencyPair]selected[/#if]>${item.shortName}</option>
                [/#list]
                </select>
            </p>


            <p class="f_1p">
                <label class="f_info">Deal No</label>
                <input type="text" id="dealNo" name="dealNo" value="${dealingSummary.dealNo}" >
            </p>

            <p class="f_1p">
                <label class="f_info">IsDeal</label>
                <select id="isDeal" name="isDeal" >
                    <option value="" >All</option>
                [#list whetherEnum as item]
                    <option value="${item.index}" [#if item.index==dealingSummary.isDeal]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>

            [#if data==2]
            <p class="f_1p">
                <label class="f_info">Data</label>
                <select id="level" name="level" >
                    <option value="" >All</option>
                [#list datalevelEnum as item]
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


            <!--搜索和重置按钮-->
            <p  class="f_2p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a id="searchNewTab" class="btn bg_blue" data-icon="s" title="Dealing Summary">Search&New Tab</a>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table">

        <table>
            <tr>
                <th>Trade Date[#if page??][@pageOrder pageable=page.pageable property="id"][/@pageOrder][/#if]</th>
                <th id="buyCurrency1">Buy XXX</th>
                <th>Rate</th>
                <th id="sellCurrency1">Sell XXX</th>
                <th id="buyCurrency2">Buy XXX</th>
                <th>Rate</th>
                <th id="sellCurrency2">Sell XXX</th>
                <th>isDeal</th>
                <th>Order No</th>

            </tr>

        [#list page.content as item]
        [#if item_index < page.content.size()-2]
            <tr>
                <td> [@dateFormat format="yyyy-MM-dd HH:mm:ss" value=item.createDate][/@dateFormat]</td>
                [#if  item.direction==1]
                <td> [@number num = item.amountPay][/@number]</td>
                <td> [@number num = item.rate m=100000 formatStr=",##0.0000"][/@number]</td>
                <td> [@number num = item.amountReceive][/@number]</td>
                <td></td>
                <td></td>
                <td></td>
                [#else]
                <td></td>
                <td></td>
                <td></td>
                <td> [@number num = item.amountPay][/@number]</td>
                <td> [@number num = item.rate m=100000 formatStr=",##0.0000"][/@number]</td>
                <td> [@number num = item.amountReceive][/@number]</td>
                [/#if]
                <td> ${whetherMap.get(item.isDeal).descEng}</td>
                <td>
                    [#if item.orderNoId!=null]
                    <a href="/purchaseOrder/edit.action?id=${item.orderNoId}" title="Purchase Order Edit" onclick="window.top.i_p.add(this);return false">${item.orderNo}</a>
                        [#else ]
                        [@orderLink orderNo = item.orderNo ]${item.orderNo}[/@orderLink]
                    [/#if]
                </td>
            </tr>
        [#else]
            <tr>
                <td> ${item.name}</td>
                <td> [@number num = item.buyCurrBefore][/@number]</td>
                <td> ${item.rateBTA}</td>
                <td> [@number num = item.sellCurrAfter][/@number]</td>
                <td>[#if item.buyCurrAfter??][@number num = item.buyCurrAfter][/@number][/#if]</td>
                <td>[#if item.rateATB??]${item.rateATB} [/#if]</td>
                <td>[#if item.sellCurrBefore??][@number num = item.sellCurrBefore][/@number][/#if]</td>
                <td> </td>
                <td> </td>
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

    seajs.use("alert", function (alertM) {
        var pair = $("#currencyPair")

        $("#searchNewTab").on("click",function(){
            if (pair.val()==""){
                alertM("需要选择一个货币对",{cls:"error"})
                return false;
            }
            $(this).attr("href", "/dealingSummary/list.action?"+$("#listForm").serialize());
            top.i_p.add(this)
            return false;
        })

        $(document).ready(function() {
            var currencyPair = $("#currencyPair").val();
            if (currencyPair) {
                var currencyPairArray = currencyPair.split('@@');
                $("#buyCurrency1").html("Buy " + currencyPairArray[0]);
                $("#sellCurrency1").html("Sell " + currencyPairArray[1]);
                $("#buyCurrency2").html("Buy " + currencyPairArray[1]);
                $("#sellCurrency2").html("Sell " + currencyPairArray[0]);
            }
        });


        $("#cal").on("click",function(){
            var href = "/dealingSummary/cal.action?"+$("#listForm").serialize()
            if (pair.val()==""){
                alertM("需要选择一个货币对",{cls:"error"})
                return false;
            }
            alertM(href,{
                title:"Cal Profit",
                time:"y",
                width:660,
                height:350,
                iframe:1
            })
            return false;
        });
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
    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>
