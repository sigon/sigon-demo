[#assign title="Home"]
<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
<h2>Price Policy</h2>

<form id="updateForm" class="form_short_info">
    <input type="hidden" id="traderingCurrency" name="traderingCurrency" value="NZDAUD"/>
    <p style="margin: 0 0 -20px 24px;">
        <b class="l_h">Base Currency</b>
        <select name="" id="baseCurr">
        [#list baseCurrencyList as item]
            <option value="${item.index}">${item.descEng}</option>
        [/#list]
        </select>
    </p>
    <div class="cf">
        <p id="traderingCurrP">
            <h4><b class="l_h">Tradering Currencies</b></h4>
        </p>

        <table id="traderingCurrTable" class="fl" style="width: 200px;margin: 0 0 0 24px;">

        </table>
        <div class="fl" style="width: 600px;">
        <table id="priceTable" class="gray_table" style="display: none;">
            <tr>
                <th>Name</th>
                <th>TT(Buy)</th>
                <th>TT(Sell)</th>
            </tr>
        [#list listCategory as category]
            <tr>
                <td>${category.name}
                </td>
                <td><input type="text" data-v="validate[required,custom[integer]]" id="buy${category.id}" name="buy${category.id}" /></td>
                <td><input type="text" data-v="validate[required,custom[integer]]" id="sell${category.id}" name="sell${category.id}"/></td>
            </tr>
        [/#list]
        </table>
            <button type="submit" id="submit" style="display: none;margin:32px 0 0 0;width: 66px;" class="btn bg_blue fr" data-icon="y">Save</button>
        </div>
    </div>


</form>

<script>
    seajs.use(["alert","validation"], function (alertM) {
        $("#baseCurr").on("change",function(){
            $("#priceTable").hide();
            $("#submit").hide();
            $t=$(this).val();
            if($t==2){
                $("#traderingCurrency").val("AUDCNY");
            }else if($t==1){
                $("#traderingCurrency").val("NZDAUD");
            }
           var $t=$(this).val();
            $.ajax({
                type: "POST",
                url: "/pricePolicy/changeBaseCurr.action",
                dataType:"json",
                data: {index:$t}
            }).done(function(data){
                var traderingCurrency
                var html="";
                var list=data.data;
                for(var i=0;i<list.length;i++){
                    if(i==0){
                        traderingCurrency=list[i];
                        html+='<tr><td><a href="javascript:" class="btn bg_blue" style="width: 75px;">'+list[i]+'</a></td></tr>';
                    }else{
                        html+='<tr><td><a href="javascript:" class="btn" style="width: 75px;">'+list[i]+'</a></td></tr>';
                    }
                }
                $("#traderingCurrTable").html(html)
                $.ajax({
                    type: "POST",
                    url: "/pricePolicy/selectTraderCurr.action",
                    dataType:"json",
                    data: {traderingCurr:traderingCurrency}
                }).done(function(data){
                    $("#priceTable").show();
                    var ppList=data.data.ppList;
                    var pcList=data.data.pcList;
                    var html='<tr><th>Name</th><th>TT(Buy)</th><th>TT(Sell)</th></tr>';
                    for(var i= 0;i<pcList.length;i++){
                        html+='<tr> <td>'+pcList[i].name+'</td> <td><input type="text" data-v="validate[required,custom[integer]]" id="buy'+pcList[i].id+'" name="buy'+pcList[i].id+'" /></td> <td><input type="text" data-v="validate[required,custom[integer]]" id="sell'+pcList[i].id+'" name="sell'+pcList[i].id+'"/></td> </tr>';
                    }
                    $("#priceTable").html(html);
                    if(data.status=="succ"){
                        for(var i=0;i<ppList.length;i++){
                            $('#buy'+ppList[i].categoryId).val(ppList[i].ttBuy);
                            $('#sell'+ppList[i].categoryId).val(ppList[i].ttSell);
                        }
                    }else{
                        for(var i=0;i<pcList.length;i++){
                            $('#buy'+pcList[i].id).val("");
                            $('#sell'+pcList[i].id).val("");
                        }
                    }
                    $("#submit").show();
                })
            })
        }).trigger("change");
        var $table=$("#traderingCurrTable").on("click","a",function(){
            $table.find(".bg_blue").removeClass("bg_blue")
            var $t=$(this).addClass("bg_blue");
            $("#traderingCurrency").val($t.html());
            $.ajax({
                type: "POST",
                url: "/pricePolicy/selectTraderCurr.action",
                dataType:"json",
                data: {traderingCurr:$t.html()}
            }).done(function(data){
                $("#priceTable").show();
                var ppList=data.data.ppList;
                var pcList=data.data.pcList;
                var html='<tr><th>Name</th><th>TT(Buy)</th><th>TT(Sell)</th></tr>';
                for(var i= 0;i<pcList.length;i++){
                    html+='<tr> <td>'+pcList[i].name+'</td> <td><input type="text" data-v="validate[required,custom[integer]]" id="buy'+pcList[i].id+'" name="buy'+pcList[i].id+'" /></td> <td><input type="text" data-v="validate[required,custom[integer]]" id="sell'+pcList[i].id+'" name="sell'+pcList[i].id+'"/></td> </tr>';
                }
                $("#priceTable").html(html);
                if(data.status=="succ"){
                    for(var i=0;i<ppList.length;i++){
                        $('#buy'+ppList[i].categoryId).val(ppList[i].ttBuy);
                        $('#sell'+ppList[i].categoryId).val(ppList[i].ttSell);
                    }
                }else{
                    for(var i=0;i<pcList.length;i++){
                        $('#buy'+pcList[i].id).val("");
                        $('#sell'+pcList[i].id).val("");
                    }
                }
                $("#submit").show();
            })
        })
        $.ajax({
            type: "POST",
            url: "/pricePolicy/selectTraderCurr.action",
            dataType:"json",
            data: {traderingCurr:"NZDAUD"}
        }).done(function(data){
            $("#priceTable").show();
            var ppList=data.data.ppList;
            var pcList=data.data.pcList;
            if(data.status=="succ"){
                for(var i=0;i<ppList.length;i++){
                    $('#buy'+ppList[i].categoryId).val(ppList[i].ttBuy);
                    $('#sell'+ppList[i].categoryId).val(ppList[i].ttSell);
                }
            }else{
                for(var i=0;i<pcList.length;i++){
                    $('#buy'+pcList[i].id).val("");
                    $('#sell'+pcList[i].id).val("");
                }
            }
            $("#submit").show();
        })
        $("#updateForm").validationEngine().on("submit",function(){
            $.ajax({
                type: "POST",
                url: "/pricePolicy/update.action",
                dataType:"json",
                data: $("#updateForm").serialize()
            }).done(function(data){
                alertM(data.msg,{cls:data.status,rf:function(){
                    if(data.status=="succ"){
                        var ppList=data.data.ppList;
                        var pcList=data.data.pcList;
                        var html='<tr><th>Name</th><th>TT(Buy)</th><th>TT(Sell)</th></tr>';
                        for(var i= 0;i<pcList.length;i++){
                            html+='<tr> <td>'+pcList[i].name+'</td> <td><input type="text" data-v="validate[required,custom[integer]]" id="buy'+pcList[i].id+'" name="buy'+pcList[i].id+'" /></td> <td><input type="text" data-v="validate[required,custom[integer]]" id="sell'+pcList[i].id+'" name="sell'+pcList[i].id+'"/></td> </tr>';
                        }
                        $("#priceTable").html(html);
                        for(var i=0;i<ppList.length;i++){
                            $('#buy'+ppList[i].categoryId).val(ppList[i].ttBuy);
                            $('#sell'+ppList[i].categoryId).val(ppList[i].ttSell);
                        }
//                        window.location.reload();
                    }
                }})
            })
            return false;
        })
    });
</script>
</body>
</html>