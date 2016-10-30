<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>

<h2 class="page_title">网关代付预览</h2>
<form id="listForm" method="post">
    <input type="hidden" id="groupNo" name="groupNo" value="${groupNo}">
    <input type="hidden" id="gatewayId" name="gatewayId" value="${gatewayId}">
    <menu>
        <div class="form">
            <p>
                <label class="f_info">支付网关:</label>
                [#list bankList as account]
                    [#if gatewayId==account.gatewayId]
                        <span>${account.bankName}丨${account.gatewayName}-${account.gatewayCode}丨${account.currency}|￥[@number num=account.balance/]丨${account.accountNo}</span>
                    [/#if]
                [/#list]
            </p>
        </div>
    </menu>
    <div class="table">
        <a href="dispose.action" class="btn bg_green" >返回批量代付CNY交易单</a>
        <input type="button" style="display: none;" id="graySub" disabled class="btn gray" value="进行代付">
        <a href="javascript:" id="submit" class="btn bg_green">进行代付</a>
        <hr>
        <table>
            <tr>
                <th>序列号</th>
                <th>Pay Order No</th>
                <th>Amount</th>
                <th>Fee</th>
                <th>Account Name</th>
                <th>Account No</th>
                <th>银行英文简称 <br> Bank Name<br> Bank Branch <br>CNAPS Code</th>
                <th>Province <br>City</th>
            </tr>

        [#list splitList as item]
            <tr>
                <td>${item_index+1}</td>
                <td>
                ${item.payOrderNo}
                </td>
                <td>
                    [@number num = item.amount][/@number]
                    [#if item.amount<singleLeast]
                        <br> <span class="red">代付金额小于当前网关单笔最低交易金额[@number num = singleLeast][/@number],会导致代付失败.</span>
                    [/#if]
                </td>
                <td>
                    [@number num = item.fee][/@number]
                </td>

                <td>
                ${item.accountName}
                </td>
                <td>${item.accountNo}</td>
                <td>
                    ${item.shortNameEng}
                    <br>
                ${item.bankName}
                    <br>
                ${item.bankBranch}
                    <br>
                ${item.unionCode}
                </td>
                <td>
                ${item.province} <br>${item.city}
                </td>
            </tr>
        [/#list]
        </table>
        <p>
            <label for="" class="f_for">交易金额(共)：</label><span>[@number num = allAmount][/@number]</span>
        </p>
        <p>
            <label for="" class="f_for">交易手续费(共)：</label><span>[@number num = allFee][/@number]</span>
        </p>
    </div>
</form>

<script>

    seajs.use(["alert","validation"], function (alertM) {
        $("#submit").on("click",function(){
            var $t=$(this);

            alertM("您确认请求代付吗? 请求发出后不可取消.",{
                time:"y",
                title:"请求代付",
                btns:[
                    {
                        txt:$t.html(),
                        cls:"bg_blue",
                        func:function(){
                            $t.hide();
                            $("#graySub").show();
//                            alertM.end("pay.action",$("#listForm").serialize(),"/settleOrder/list.action")
                            $.ajax({
                                url:"pay.action",
                                dataType:"json",
                                method:"post",
                                data:$("#listForm").serialize()
                            }).done(function(data){
                                alertM(data.msg,{time:"y",rf:function(){
                                    if(data.status=="succ"){
                                        window.location.href="/settleOrder/list.action";
                                    }
                                }})
                            });
                            return false;
                        }
                    },
                    {
                        txt:"Cancel",
                        func:function(){
                            $t.show();
                            $("#graySub").hide();
                        }
                    }
                ]
            })
        })
    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>
