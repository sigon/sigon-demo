<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>

<h2 class="page_title">网关代付</h2>
<form id="listForm" action="saveAndShow.action" method="post">
    <input type="hidden" id="groupNo" name="groupNo" value="${groupNo}">
    <menu>
        <div class="form">
            <p>
                <label class="f_info">选择支付网关:</label>
                <select required id="gatewayId" name="gatewayId" style="width:500px;">
                    <option value="" >Select...</option>
                [#list bankList as account]
                    <option value="${account.gatewayId}">${account.bankName}丨${account.gatewayName}-${account.gatewayCode}丨${account.currency}|￥[@number num=account.balance/]丨${account.accountNo}</option>
                [/#list]
                </select>
            </p>
        </div>
    </menu>
    <div class="table">
        <a href="javascript:history.go(-1);" class="btn" data-icon="p" >返回</a>
        <input type="submit" class="btn bg_green" value="保存并预览">
        [#--<a href="javascript:" id="submit" class="btn bg_green">保存并预览</a>--]
        <hr>
        <table>
            <tr>
                <th width="100"><input id="boxAll" type="checkbox"><label for="boxAll">全选/取消</label></th>
                <th>Order No<br>Create Date</th>
                <th>Amount</th>
                <th>Pay Amount</th>
                <th>Account Name <br>Account No</th>
                <th>银行英文简称<br> Bank Name<br> Bank Branch <br>CNAPS Code</th>
                <th>Province <br>City</th>
            </tr>

        [#list mrpList as item]
            <tr class="tr">
                <td><input type="checkbox" class="checkBox" id="box${item_index}" name="box" value="${item_index}"></td>
                <td>
                ${item.orderNo}
                    <input type="hidden" name="orderNo${item_index}" value="${item.orderNo}">
                    <br>
                ${item.settleDate?string("yyyy-MM-dd")}
                    <input type="hidden" name="settleDate${item_index}" value="${item.settleDate?datetime}">
                </td>
                <td>
                    [@number num = item.amount][/@number]
                    <input type="hidden" name="amount${item_index}" value="${item.amount}">
                </td>
                <td>
                    <input type="number" class="unpayAmount" required min="0.01" step="0.01" max="${item.unpayAmount/100}" value="${item.unpayAmount/100}" onblur="blurToMoney(this)" name="unpayAmount${item_index}">
                </td>
                <td>
                    <input type="text" maxlength="50" required value="${item.accountName}" name="accountName${item_index}">
                    <br>
                    <input type="text" maxlength="50" required pattern="^[0-9]*$" value="${item.accountNo}" name="accountNo${item_index}">
                </td>
                <td>
                    <input type="text" maxlength="20" class="shortNameEng" placeholder="京东代付必填,例:CCB" name="shortNameEng${item_index}">
                    <br>
                    <input type="text" maxlength="50" name="bankName${item_index}" class="bankN" value="${item.bankName}" required>
                    <span class="red" style="display: block"></span>
                    <input type="text" maxlength="50" required value="${item.bankBranch}" style="width: 250px;" name="bankBranch${item_index}">
                    <br>
                    <input type="text" maxlength="20" pattern="^[0-9]*$" name="unionCode${item_index}" value="${item.unionCode}" required>
                </td>
                <td>
                    <input type="text" maxlength="20" value="${item.province}" name="province${item_index}">
                    <br>
                    <input type="text" maxlength="20" required value="${item.city}" name="city${item_index}">
                </td>
            </tr>
        [/#list]
        </table>

    </div>
    <input id="pageNumber" name="pageNumber" value="1" type="hidden"/>
    <script>seajs.use("pagenation");</script>
</form>

<script>

    seajs.use(["alert"], function (alertM) {
//      var $box = $(".checkBox").each(function(){
//            var $t=$(this);
//            if($t.prop("checked")){
//                $t.parent().parent().find(":text").prop("required",true);
//            }else{
//                $t.parent().parent().find(":text").prop("required",false);
//            }
//        })


        $("#boxAll").trigger("change");
        $("#boxAll").on("change",function(){
            if(!$("#boxAll").prop("checked")){
//                $(":text").not(".shortNameEng").prop("required",false);
                $(".tr").removeClass("on");
            }else{
//                $(":text").not(".shortNameEng").prop("required",true);
                $(".tr").addClass("on");
            }
        });
      var $box = $(".checkBox").on("change",function(){
          $(".checkBox").each(function(){
                var $t=$(this);
                if($t.prop("checked")){
                    $t.parent().parent().find(":text").not(".shortNameEng").prop("required",true);
                }else{
                    $t.parent().parent().find(":text").prop("required",false);
                }
            })
        }).trigger("change");

        $("#gatewayId").on("change",function(){
            var $t=$(this).val();
            bankNF.trigger("keyup");
            $.ajax({
                url:"changeGate.action",
                dataType:"json",
                method:"post",
                data:{
                    code:$t
                }
            }).done(function(data){
                if(data.status=="succ"){
//                    $(".shortNameEng").prop("required",true);
                    $box.trigger("change");
                }else {
                    $box.trigger("change");
//                    $(".shortNameEng").prop("required",false);
                }

            })
        })
       var bankNF = $(".bankN").on("keyup",function(){
            var $t=$(this);
            $t.removeClass("v_error");
            $t.next().html("");
        })

        $(".unpayAmount").trigger("blur");
        var checkS=function(){
            var check=true;
            $(".on .bankN").each(function(){
                check=!!$(this).data("check")
                return check;
            })
            if(check)
                    $f.trigger("submit",[check])
        },
        $f=$("#listForm").on("submit",function(e,c){
            if(c)
                    return true;
            if(!$("#gatewayId").val().length){
                alertM("请选择支付网关",{cls:"error"})
                return false;
            }
            if(!$(".checkBox").filter(':checked').length){
                alertM("至少选择一条支付记录",{cls:"error"})
                return false;
            }

            $(".on .bankN").data("check",0).each(function(){
                if($("#gatewayId").val()=="30"){
                    var $t=$(this),$b=$t.prev().prev();
                    $.ajax({
                        url:"checkJDBank.action",
                        dataType:"json",
                        method:"post",
                        data:{
                            name:$t.val()
                        }
                    }).done(function(data){
                        if(data.status=="succ"){
                            $b.val(data.data.code);
                            $t.data("check",1);
                        }else {
                            $t.addClass("v_error");
                            $t.next().html(data.msg);
                        }
                        checkS();
                    })
                }
            })
            if($("#gatewayId").val()=="30"){
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
