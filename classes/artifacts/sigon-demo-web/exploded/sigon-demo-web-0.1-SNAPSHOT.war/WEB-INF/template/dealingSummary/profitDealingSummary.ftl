<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>

<h2 class="page_title">Profit Dealing Summary</h2>
<form id="listForm" action="profitList.action" method="post">
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

            [#--<p class="f_1p">--]
                [#--<label class="f_info">Deal No</label>--]
                [#--<input type="text" id="dealNo" name="dealNo" value="${dealingSummary.dealNo}" >--]
            [#--</p>--]

            <p class="f_2p">
                <label class="f_info">Trade Date</label>
            [@inputRegion id="createDate" type="date" start=dealingSummary.createDateStart end=dealingSummary.createDateEnd]
                [#include "/include/inputregion.ftl"]
            [/@inputRegion]
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
            <!--搜索和重置按钮-->
            <p  class="f_2p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a id="searchNewTab" class="btn bg_blue" data-icon="s" title="Dealing Summary">Search&New Tab</a>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table">
        <a href="javascript:" id="export" class="btn bg_blue">Export</a>
        <hr>
        <table>
            <tr>
                <th>Trade Date[#if page??][@pageOrder pageable=page.pageable property="id"][/@pageOrder][/#if]</th>
                <th id="buyCurrency1">Buy XXX</th>
                <th>Rate</th>
                <th id="sellCurrency1">Sell XXX</th>
                <th id="buyCurrency2">Buy XXX</th>
                <th>Rate</th>
                <th id="sellCurrency2">Sell XXX</th>
                <th>Currency</th>
                <th>profit</th>
                <th>isDeal</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td>
                    <a href="/dealingSummary/list.action?dealNo=[#if item.isDeal == 1]${item.sumNo}[#else]${item.dealNo}[/#if]&currencyPair=${dealingSummary.currencyPair}&isDeal=1&queryint=1" title="Dealing Summary" onclick="window.top.i_p.add(this);return false">${item.createDate?datetime}</a>
                </td>
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
                <td>${item.profitCurrency}</td>
                <td>[@subString content=item.profit otherContent=item.comment!"未指定" length=100 brLength=20 isFormat=true][/@subString]</td>
                <td>
                    ${whetherMap.get(item.isDeal).descEng}
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

        $("#export").on("click",function(){
            if (pair.val()==""){
                alertM("需要选择一个货币对",{cls:"error"})
                return false;
            }
            var $t=$(this);
            alertM("将按照列表查询条件导出，确定导出吗？",{
                time:"y",
                title:"导出",
                btns:[
                    {
                        txt:"Export",
                        cls:"bg_blue",
                        func:function(){
                            alertM("Loading",{cls:"loading",time:"y"})
                            $.ajax({
                                url:"export.action",
                                dataType:"json",
                                data: $("#listForm").serialize()
                            }).done(function(data){
                                alertM(data.msg,{cls:data.status,rf:function(){
                                [@showMenu code="0601"]   if(data.status=="succ")
                                    alertM('已添加异步导出任务到Statistics - Asyc Export Task，请选择继续的操作：<a id="goa1" style="display: none"  href="/exportTask/list.action">Export Task List</a>',{
                                        time:"y",
                                        title:"导出",
                                        btns:[
                                            {
                                                txt:"停留在当前页"
                                            },
                                            {
                                                cls:"bg_blue",
                                                txt:"去 Asyc Export Task 看看下载",
                                                func:function(){
                                                    window.top.i_p.add(document.getElementById("goa1"));
                                                }}
                                        ]
                                    })
                                [/@showMenu]
                                }})
                            });
                            return false;
                        }

                    },
                    {
                        txt:"Cancel"
                    }
                ]
            })
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
