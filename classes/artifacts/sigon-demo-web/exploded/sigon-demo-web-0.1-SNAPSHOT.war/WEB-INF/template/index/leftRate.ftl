<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <style type="text/css">
        .table,.panel{
            margin: 9px;
        }
        body{
            padding: 0;;
        }
        .form p {
             display: flex;
             padding: 0;
             margin: 0;
        }
        select {
            width: auto!important;
            flex-grow: 1;
            margin: 0 4px;
        }
    </style>
</head>
<body>
    <form class="form panel" id="formRate" method="get" action="showRate.action">
        <p>
            Base<select name="baseC" id="baseSelect">
        [#list baseCurrency as item]
            <option value=${item.index} [#if item.index==baseC]selected[/#if]>${item.descEng}</option>
        [/#list]
        </select>

            Trade<select name="tradeC" id="traderSelect">
        [#list traderingCurrency as item]
            <option value=${item.code} [#if item.desc==tradeC]selected[/#if]>${item.desc}</option>
        [/#list]
        </select>
        </p>
    </form>
    <div class="table">
        <table id="showRateTable">
            <tbody>
            <tr>
                <th>Category</th>
                <th>WeBuy</th>
                <th>WeSell</th>
            </tr>
            [#list showRateVOList as item]
            <tr>
                <td>${item.category}</td>
                [#if item.weBuy == "0.0000"]
                    <td>-</td>
                [#else]
                    <td>${item.weBuy}</td>
                [/#if]
                [#if item.weSell == "0.0000"]
                    <td>-</td>
                [#else]
                    <td>${item.weSell}</td>
                [/#if]
            </tr>
            [/#list]
            </tbody>
        </table>
    </div>
<script>
    seajs.use("alert",function(alertM){
        $("select").on("change",function(){
            $("form").trigger("submit")
        })

        //自动执行代码
        setInterval(function(){
            $("form").trigger("submit")
        },300000);
    });
</script>
</body>
</html>