[#include "/include/head.ftl"]
<div id="body">
    <div id="l_body">
        <div class="l_t on">
            <nav data-icon="2">Table 2</nav>
            <form class="form">
                <p>
                Base<select name="" id="baseSelect">
                [#list baseCurrency as item]
                    <option value="${item.index}" [#if item.descEng=NZD]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>

                Trade<select name="" id="traderSelect">
                [#list traderingCurrency as item]
                    <option value=${item.code} [#if item.desc=CNY]selected[/#if]>${item.desc}</option>
                [/#list]
                </select>
                </p>
            </form>
            <div class="table">
                <table id="showRateTable">
                    <tbody>
                    <tr>
                        <th>Category</th>
                        <th>Webuy</th>
                        <th>WeSell</th>
                    </tr>
                    [#list showRateVOList as item]
                    <tr>
                        <td>${item.category}</td>
                        <td>${item.weBuy}</td>
                        <td>${item.weSell}</td>
                    </tr>
                    [/#list]
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div id="l_m"></div>
</div>

<script>
    seajs.use(["validation"],function(alertM){
        /*select base*/
        $("#baseSelect").on("change",function(){
            var $t=$(this).val();
            $.ajax({
                type: "POST",
                url: "/showRate/changeBaseCurr.action",
                dataType:"json",
                data: {index:$t}
            }).done(function(data){
                $("#traderSelect").empty();
                var jsonArr=data.data;
                for(var i= 0;i<jsonArr.length;i++){
                    $("#traderSelect").append("<option value="+jsonArr[i].code+">"+jsonArr[i].desc+"</option>");
                }
            })
        })
        /*select trade*/
        $("#traderSelect").on("change",function(){
            var $t=$(this).val();
            $.ajax({
                type: "POST",
                url: "/showRate/changeTradeCurr.action",
                dataType:"json",
                data: {index:$t}
            }).done(function(data){
                var list=data.data;
                var html="<tr><th>Category</th><th>Webuy</th><th>WeSell</th></tr>";
                if(list.length>0){
                    for(var i=0 ;i<list.length;i++){
                        html+="<tr><td>"+list[i].category+"</td><td>"+list[i].weBuy+"</td><td>"+list[i].weSell+"</td></tr>";
                    }
                }
                $("#showRateTable").html(html);
            })
        })
    });
</script>