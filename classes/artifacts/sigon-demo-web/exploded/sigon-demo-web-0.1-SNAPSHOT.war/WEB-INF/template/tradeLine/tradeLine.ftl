
<!DOCTYPE html>
<html>
<head>
    [#include "/include/head.ftl"]
        <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
    <title>Transaction summary by currency</title>
    <style type="text/css">
        .area,#area1,#area2{
            width: 852px;
            height: 320px;
        }
    </style>
</head>
<body>
<form id="listForm" action="/tradeLine/line.action" method="post">
    <h2>Transaction Summary By currency</h2>
    <menu>
        <div class="form">
            <p class="f_2p">
                <label class="f_info">
                    <span class="b_tip"><span data-icon="q" class="gray"></span>Date range:<span id="hTip" class="h_tip">选择查询类型为“按日”时，则横轴区间是按日分割选择的时间段</span></span>
                </label>
                <select id="dateType" name="dateType" style="width: 100px;" >
                    <option [#if dateType=="yyyy-MM-dd"]selected[/#if] value="yyyy-MM-dd">By date</option>
                    <option [#if dateType=="yyyy-MM"]selected[/#if] value="yyyy-MM">By month</option>
                    <option [#if dateType=="yyyy"]selected[/#if] value="yyyy">By year</option>
                </select>
                <spqn id="dateSpan">
                    <input id="wdateStart" name="timeStart" type="text" style="width:90px;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate regionV" value="${dateStart}">
                    <input id="wdateEnd" name="timeEnd" type="text" style="width:90px;" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate regionV" value="${dateEnd}">
                </spqn>

            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>
     </menu>
</form>
<div class="panel area" [#if display?length=0]style="display: none;"[/#if]>
    <div id="area1">
    </div>
</div>

<script>
    seajs.use(["alert","echarts"],function(alertM){
//        var dateType = $("#dateType").on("change",function(){
//            var html='<input id="wdateStart" name="timeStart" type="text" style="width:90px;" onClick="WdatePicker({dateFmt:\''+dateType.val()+'\'})" class="Wdate regionV"><input id="wdateEnd" name="timeEnd" type="text" style="width:90px;" onClick="WdatePicker({dateFmt:\''+dateType.val()+'\'})" class="Wdate regionV">';
//            $("#dateSpan").html(html);
//        })


        var charts = echarts.init(document.getElementById('area1'), {
            color: [
                '#09CBBF', '#44B6FB','#E45C75', '#FFA93C'
            ],
            line: {
                smooth: true,
                symbol: 'emptyCircle',
                symbolSize: 3
            }
        })
        charts.setOption({
            title: {
                text: 'Transaction summary by currency',
                x: "center"
            },
            tooltip: {
                trigger: 'axis',
                formatter: function(params, ticket, callback) {
                    var res = params[0].name;
                    for (var i = 0, l = params.length; i < l; i++) {
                        res += '<br/>' + params[i].seriesName + ' : '+toMoney(params[i].value);
                    }
                    return res;
                }
            },
            toolbox: {
                show: true,
                feature: {
                    saveAsImage: {
                        show: true
                    }
                },
                padding: [36, 80, 0, 0]
            },
            calculable: false,
            legend: {
                data: [[#list homeStatisticVO.currencyList as item]'${item}'[#if item_has_next],[/#if][/#list]],
                x: "right",
                padding: [36, 0, 0, 120]
            },
            grid:{y:80},
            xAxis: [{
                type: 'category',
                data: [[#list homeStatisticVO.xAxis as item]'${item}'[#if item_has_next],[/#if][/#list]]
            }],
            yAxis: [{
                type: 'value',
                name: 'Amount',
                axisLabel: {
                    formatter: '{value}'
                }
            }],
            series: [
            [#if size??]
                {
                    name: '',
                    type: 'line',
                    data: []
                }
            [#else]
                [#list homeStatisticVO.yAxis as item]
                 {
                    name: '${item.name}',
                    type: 'line',
                    data: [[#list item.data as amount]${amount/100}[#if amount_has_next],[/#if][/#list]]
                }
                [#if item_has_next],[/#if]
                [/#list]
            [/#if]
            ]
        })
    });
</script>
</body>
</html>