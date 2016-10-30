
<!DOCTYPE html>
<html>
<head>
    [#include "/include/head.ftl"]
    <title>HOME</title>
    <style type="text/css">
        .home_p{
            position: relative;
            width: 240px;
            height: 180px;
            font-size: 32px;
            opacity: .8;
            overflow: hidden;
            transition: all .2s ease-out;
        }
        .home_p:before{
            position: absolute;
            left: 9px;
            bottom: 9px;
            font-size: 120px;
            transition: all .2s ease-out;
        }
        .home_p:hover{
            opacity: 1
        }
        .home_p:hover:before{
            transform: rotate(9deg) translateX(99px);
        }
        .area,#area1,#area2{
            width: 852px;
            height: 320px;
        }
    </style>
</head>
<body>
<div class="cf">
[@showMenu code="0302"]
    <div>
        <a href="/merchantView/list.action" class="panel fl home_p" data-icon="3" style="color:#09CBBF;border-color:#09CBBF" onclick="window.top.i_p.add(this);return false" title="Merchant List">Merchant</a>
    </div>
[/@showMenu]
[@showMenu code="0903"]
    <div>
        <a href="/settleOrder/list.action?status=1&queryint=1" class="panel fl home_p" data-icon="2" style="color:#FFA93C;border-color:#FFA93C" onclick="window.top.i_p.add(this);return false" title="Account Payable">Order<span class="fr">${orderCount}</span></a>
    </div>
[/@showMenu]
[@showMenu code="0101"]
    <div>
        <a href="/merchantSupport/list.action" class="panel fl home_p" data-icon="S" style="color:#E45C75;border-color:#E45C75" onclick="window.top.i_p.add(this);return false" title="Merchant Support">Support<span class="fr">${supportCount}</span></a>
    </div>
[/@showMenu]
</div>
<div class="panel area">
    <div id="area1">
    </div>
</div>
<div class="panel area">
    <div id="area2">
    </div>
</div>
<script>
    seajs.use("echarts",function(){
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
                [#if homeStatisticVO.yAxis?size==0]
                    {
                        name: '',
                        type: 'bar',
                        data: []
                    }
                [#else]
                    [#list homeStatisticVO.yAxis as item]
                     {
                        name: '${item.name}',
                        type: 'bar',
                        data: [[#list item.data as amount]${amount/100}[#if amount_has_next],[/#if][/#list]]
                    }
                    [#if item_has_next],[/#if]
                    [/#list]
                [/#if]
            ]
        })
        var charts1 = echarts.init(document.getElementById('area2'), {
            color: [
                '#09CBBF', '#44B6FB','#E45C75', '#FFA93C'
            ],
            line: {
                smooth: true,
                symbol: 'emptyCircle',
                symbolSize: 3
            }
        })
        charts1.setOption({
            title: {
                text: 'Transaction summary by gateway',
                x: "center"
            },
            tooltip: {
                trigger: 'axis',
                formatter: function(params, ticket, callback) {
                    var res = params[0].name;
                    for (var i = 0, l = params.length; i < l; i++) {
                        res += '<br/>' + params[i].seriesName + ' : ￥ ' +toMoney(params[i].value) ;
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
                data: [[#list homeGatewayVO.currencyList as item]'${item}'[#if item_has_next],[/#if][/#list]],
                x: "right",
                padding: [36, 0, 0, 120]
            },
            grid:{y:80},
            xAxis: [{
                type: 'category',
                data: [[#list homeGatewayVO.xAxis as item]'${item}'[#if item_has_next],[/#if][/#list]]
            }],
            yAxis: [{
                type: 'value',
                name: 'Amount',
                axisLabel: {
                    formatter: '￥ {value}'
                }
            }],
            series: [
                [#if homeGatewayVO.yAxis?size==0]
                    {
                        name: '',
                        type: 'bar',
                        data: []
                    }
                [#else]
                    [#list homeGatewayVO.yAxis as item]
                        {
                            name: '${item.name}',
                            type: 'bar',
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