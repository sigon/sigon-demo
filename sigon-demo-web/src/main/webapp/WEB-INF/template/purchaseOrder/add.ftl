<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2 >${title}</h2>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Provider</label>
            <select name="providerId" id="providerId" data-v="validate[required]">
                <option value="">Please select</option>
                [#list listPro as item]
                    <option value="${item.id}" [#if purchaseOrder.providerId==item.id ]selected[/#if]>${item.name}</option>
                [/#list]
            </select>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Purchase Type</label>
            <select name="purchaseType" id="purchaseType" data-v="validate[required]">
                <option value="">Please select</option>
            [#list purchaseTypeList as item]
                <option value="${item.code}" [#if purchaseOrder.purchaseType==item.code]selected[/#if]>${item.desc}</option>
            [/#list]
            </select>
        </p>
        </div>

        <div>
            <p class="f_1p" style="width: 40%">
            <label class="f_info"><span data-icon="S"  ></span>Buy currency&amount</label>
            <select name="buyCurrency" id="s1" class="f_short" data-v="validate[required]">
                <option value="" >Please select</option>
                [#list currencyList as item]
                    <option value="${item.descEng}" [#if purchaseOrder.buyCurrency==item.descEng]selected[/#if]>${item.descEng}</option>
                [/#list]
            </select><span style="display: none"></span>
            <input type="text" id="amt1" style="width: 240px;" onblur="blurToMoney(this)" name="buyAmountDouble" value="[@number num = purchaseOrder.buyAmount formatStr="##0.00"][/@number]" data-v="validate[required,min[0.01],max[1000000000]]">
                *<span></span>
            <p class="f_1p" style="width: 20%">

            <label class="f_info"><span data-icon="S"  ></span>Rate</label>
            <input type="text" id="rateDouble" name="rateDouble" onblur="blurToRate(this)" value="[@number num = purchaseOrder.rate formatStr="##0.0000" m=10000][/@number]" data-v="validate[required,custom[number],min[0.0001],max[100]]">
            </p>
            <p class="f_1p" style="width: 40%">
            <label class="f_info" id="sellLabel"><span data-icon="S"  ></span>Sell currency&amount</label>
                =
            <select name="sellCurrency" id="s2" class="f_short" data-v="validate[required]">
                <option value="" >Please select</option>
            [#list currencyList as item]
                <option value="${item.descEng}" [#if purchaseOrder.sellCurrency==item.descEng]selected[/#if]>${item.descEng}</option>
            [/#list]
            </select><span style="display: none"></span>
            <input type="text" style="width: 240px;" id="amt2" onblur="blurToMoney(this),blurAmt()" name="sellAmountDouble" value="[@number num = purchaseOrder.sellAmount formatStr="##0.00"][/@number]" data-v="validate[required,min[0.01],max[1000000000]]">
        </p>
        </div>

        <div id="d1" style="display: none;">
            <p class="f_1p" style="width: 40%">
                <label class="f_info"><span data-icon="S"></span>Buy currency&amount(intermediary)</label>
                <input type="text" readonly class="f_short" id="midCurr" value="USD">
                <input type="text" style="width: 240px;" readonly id="midAmt" value="0.00">
                *
            <p class="f_1p" style="width: 20%">
                <label class="f_info"><span data-icon="S"  ></span>Rate</label>
                <input type="text" id="midRateDouble" onblur="blurToRate(this)" name="midRateDouble" value="[@number num = purchaseOrder.midRate formatStr="##0.0000" m=10000][/@number]" data-v="validate[required,custom[number],min[0.0001],max[100]]">
            </p>
            <p  class="f_1p" style="width: 40%">
            <label class="f_info"><span data-icon="S" ></span>Sell currency&amount</label>
            =
            <select name="midCurrency" id="s3" class="f_short" data-v="validate[required]">
            [#--[#list currencyList as item]--]
                [#--<option value="${item.descEng}" [#if purchaseOrder.midsellCurrency==item.descEng]selected[/#if]>${item.descEng}</option>--]
            [#--[/#list]--]
            </select><span style="display: none"></span>
            <input type="text" style="width: 240px;"  id="amt3" onblur="blurToMoney(this)" name="midAmountDouble" value="[@number num = purchaseOrder.midAmount formatStr="##0.00"][/@number]" data-v="validate[required,min[0.01],max[1000000000]]">
            </p>
        </div>
        <div>
            <p>
                <label class="f_info"><span data-icon="S"  ></span>Settle Date</label>
                <input type="text" style="width: 200px;" [#if action=="update"&&purchaseOrder.receivable!=2&&purchaseOrder.payable!=2]readonly [#else]onclick="WdatePicker()"[/#if] data-v="validate[required]" id="settleDate"  class="Wdate" name="settleDateStr" value="[#if purchaseOrder.settleDate??]${purchaseOrder.settleDate?string("yyyy-MM-dd")}[/#if]">
            </p>

        </div>
        <div>
            <p>
                <label class="f_info">Comment</label>
                <input type="text" id="comment" [#if action=="update"&&purchaseOrder.receivable!=2&&purchaseOrder.payable!=2]readonly[/#if] name="comment" value="${purchaseOrder.comment}" data-v="validate[maxSize[100]]">
            </p>
        </div>

        <p>
            <a href="javascript:history.back();" id="cancel" class="btn"  data-icon="p">Cancel</a>
            <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>
        </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        //计算币种间的转换金额
        $("#amt1").on("focus",function(){
            var $t=$(this), $rateDouble=$("#rateDouble"), $amt2=$("#amt2");
            if($rateDouble.val().length&&$amt2.val().length){
                $t.val(accDiv($amt2.val(),$rateDouble.val()).toFixed(2))
            }
        });
        $("#amt2").on("focus",function(){
            var $t=$(this), $rateDouble=$("#rateDouble"), $amt1=$("#amt1");
            if($rateDouble.val().length&&$amt1.val().length){
                $t.val(accMul($rateDouble.val(),$amt1.val()).toFixed(2))
            }
        });
        $("#amt3").on("focus",function(){
            var $t=$(this), $midRateDouble=$("#midRateDouble"),$amt2=$("#amt2");
            if($midRateDouble.val().length&&$amt2.val().length){
                $t.val(accMul($midRateDouble.val(),$amt2.val()).toFixed(2))
            }
        });
        $("#rateDouble").on("focus",function(){
            var $amt1=$("#amt1"), $t=$(this), $amt2=$("#amt2");
            if($amt1.val().length&&$amt2.val().length){
                $t.val(accDiv($amt2.val(),$amt1.val()).toFixed(4))
            }
        });

        $("#midRateDouble").on("focus",function(){
            var $amt2=$("#amt2"),$amt3=$("#amt3"),$t=$(this);
            if($amt2.val().length&&$amt3.val().length){
                $t.val(accDiv($amt3.val(),$amt2.val()).toFixed(4))
            }
        });

        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                window.location.href="/purchaseOrder/list.action"
            })
            return false

        })
        $("#cancel").on("click",function(){
            window.location.href="/purchaseOrder/list.action"
        })
        $("#purchaseType").on("change",function(){
            var $t=$(this);
            if($t.val()==2){
                $("#sellLabel").html('<span data-icon="S"></span>Sell currency&amount(intermediary)');
                $("#d1").show();
                $s1.trigger("change");
                $s2.trigger("change");
                $s3.trigger("change");
            }else{
                $("#sellLabel").html('<span data-icon="S"></span>Sell currency&amount');
                $("#d1").hide();
                $("#s3").val("");
                $s1.trigger("change");
                $s2.trigger("change");
            }
        })

       var $amt1=$("#amt1"), $amt2 = $("#amt2").on("keyup",function(){
            $("#midAmt").val($amt2.val());
        }),$amt3=$("#amt3")
        $amt1.trigger("blur");
       window.blurAmt = function(){
            $("#midAmt").val($amt2.val());
        }
        $amt2.trigger("blur");
        $amt2.trigger("keyup");
        $amt3.trigger("blur");

        var s=[[#list currencyList as item]'${item.descEng}'[#if item_has_next],[/#if][/#list]],
                $s1=$("#s1").on("change",function(){
                    var s1=$s1.val(),
                        s2=$s2.val(),
                        s3=$s3.val(),str='<option value="" >Please select</option>';
                    for(var i= 0,l= s.length;i<l;i++){
                        if(s[i]!=s1&&s[i]!=s3)
                            str+='<option'+(s[i]==s2?' selected':'')+' value="'+s[i]+'">'+s[i]+'</option>'
                    }
                    $s2.html(str);
                    str='<option value="" >Please select</option>';
                    s2=$s2.val();
                    for(var i= 0,l= s.length;i<l;i++){
                        if(s[i]!=s1&&s[i]!=s2)
                            str+='<option'+(s[i]==s3?' selected':'')+' value="'+s[i]+'">'+s[i]+'</option>'
                    }
                    if($("#d1").is(":visible")){
                        $s3.html(str);
                    }
                }),
                $s2=$("#s2").on("change",function(){
                    var s1=$s1.val(),
                            s2=$s2.val(),
                            s3=$s3.val(),str='<option value="" >Please select</option>';
                    for(var i= 0,l= s.length;i<l;i++){
                        if(s[i]!=s2&&s[i]!=s3)
                            str+='<option'+(s[i]==s1?' selected':'')+' value="'+s[i]+'">'+s[i]+'</option>'
                    }
                    $s1.html(str);
                    str='<option value="" >Please select</option>';
                    s3=$s3.val();
                    for(var i= 0,l= s.length;i<l;i++){
                        if(s[i]!=s1&&s[i]!=s2)
                            str+='<option'+(s[i]==s3?' selected':'')+' value="'+s[i]+'">'+s[i]+'</option>'
                    }

                    if($("#d1").is(":visible")){
                        $s3.html(str);
                        $("#midCurr").val(s2);
                    }
                }),
                $s3=$("#s3").on("change",function(){
                    var s1=$s1.val(),
                            s2=$s2.val(),
                            s3=$s3.val(),str='<option value="" >Please select</option>';
                    for(var i= 0,l= s.length;i<l;i++){
                        if(s[i]!=s3&&s[i]!=s2)
                            str+='<option'+(s[i]==s1?' selected':'')+' value="'+s[i]+'">'+s[i]+'</option>'
                    }
                    $s1.html(str);
                    str='<option value="" >Please select</option>';
                    s2=$s2.val();
                    for(var i= 0,l= s.length;i<l;i++){
                        if(s[i]!=s1&&s[i]!=s3)
                            str+='<option'+(s[i]==s2?' selected':'')+' value="'+s[i]+'">'+s[i]+'</option>'
                    }
                    $s2.html(str);
                })
        /*$s1.trigger("change")*/;
        /*$s2.trigger("change")*/;
        /*$s3.trigger("change");*/
    })
</script>
</body>
</html>
