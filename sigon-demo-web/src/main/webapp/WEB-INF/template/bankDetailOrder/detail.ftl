<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
        <h2 class="page_title">Detail</h2>
        <form id="inputForm" method="post" class="form form_short_info" enctype="multipart/form-data">
            [#--<input type="hidden" name="id" id="id" value="${id}"/>--]
            <input type="hidden" name="orderType" id="orderType" value="${orderType}"/>
            [#--<input type="hidden" name="bankId" id="bankId" value="${bankId}"/>--]
            [#--<input type="hidden" name="bankNameId" id="bankNameId" value="${bankNameId}" />--]
        <div>
            <p class="f_1p">
                <label class="f_info">Trade No </label>
            ${bankDetailOrder.tradeNo}
            </p>
            [#if orderType=="BA"]
            <p class="f_1p" id="tradeType">
                <label class="f_info">Trade Type </label>
            ${tradeTypeMap.get(bankDetailOrder.tradeType).desc}
            </p>
            [/#if]

            <p class="f_1p">
                <label class="f_info">Trade Date </label>
            [@dateFormat value=bankDetailOrder.createDate format="yyyy-MM-dd HH:mm:ss"][/@dateFormat]
            </p>
            [#if orderType=="BA"]
            <p class="f_1p" id="account">
                <label class="f_info">Account </label>${account}
            </p>
            [/#if]
        </div>
[#if orderType=="BT"]
        <div>


            <p class="f_1p" id="fromAccount">
                <label class="f_info">From Account </label>${account}
            </p>

            <p class="f_1p" id="fromAmount">
                <label class="f_info">Amount </label>
            [#if bankDetailOrder.amount??]
                [#if bankDetailOrder.amount<0]
                    [@number num = bankDetailOrder.amount*-1][/@number]
                [#else ]
                    [@number num = bankDetailOrder.amount][/@number]
                [/#if]
            [/#if]
            </p>
                </div>
        <div>
        [#if bankDetailOrder.feeBankId??]
            <p class="f_1p" id="serviceAccount">
                <label class="f_info">Service Fee Account </label>
            ${feeAccount}
            </p>

            <p class="f_1p" id="serviceAmount">
            [#if bankDetailOrder.fee??]
                <label class="f_info">Service Fee </label>
                [#if bankDetailOrder.fee<0]
                    [@number num = bankDetailOrder.fee*-1][/@number]
                [#else ]
                    [@number num = bankDetailOrder.fee][/@number]
                [/#if]
            [/#if]
            </p>
        [/#if]
        </div>
[/#if]
        <div>
            [#if orderType=="BT"]
            <p class="f_1p" id="toAccount">
                <label class="f_info">To Account </label>
            ${recipientAccount}
            </p>
            [/#if]
            [#if orderType=="BA"]
                <p class="f_1p" id="amount">
                    <label class="f_info">Amount </label>
                [#if bankDetailOrder.amount<0]
                    [@number num = bankDetailOrder.amount*-1][/@number]
                [#else ]
                    [@number num = bankDetailOrder.amount][/@number]
                [/#if]

                </p>
            [/#if]
            <p class="f_1p">
                <label class="f_info">Comment
                [@showMenu code ="050304"]
                <a href="/bankDetailOrder/edit.action?tradeNo=${bankDetailOrder.tradeNo}&remark=${bankDetailOrder.remark}" class="btn edit bg_blue" data-icon="e">Edit</a>
                [/@showMenu]
                </label>
                ${bankDetailOrder.remark}

            </p>
        </div>

                <p>
                <a href="/bankDetailView/list.action" class="btn" data-icon="p">Back</a>

        [#if bankDetailOrder.delFlag==null]
            [@showMenu code ="050303"]
                <a href="/bankDetail/update.action?id=${id}&orderId=${bankDetailOrder.id}" class="btn delete bg_red" data-icon="d">Delete</a>
            [/@showMenu]
        [/#if]

            <span class="red">${delEnum.get(bankDetailOrder.delFlag).descEng}</span>
        </p>



        </form>

        <script>
            seajs.use("alert", function (alertM) {



                $(".edit").on("click",function(){
                    alertM(this.href,{
                        title:"Edit Comment",
                        time:"y",
                        width:660,
                        height:250,
                        iframe:1
                    })
                    return false;
                });

                $(".delete").on("click",function(){
                    var $t=$(this);
                    alertM("Are you sure delete the record?",{
                        time:"y",
                        title:"Delete Record",
                        btns:[
                            {
                                txt:$t.html(),
                                cls:"bg_red",
                                func:function(){
                                    var datas=$("#inputForm").serialize();
                                    alertM("Loading",{cls:"loading",time:"y"})
                                    $.ajax({
                                        url:"/bankDetail/update.action?id=${id}&orderId=${bankDetailOrder.id}",
                                        dataType:"json",
                                        data:datas
                                    }).done(function(data){
                                        alertM(data.msg,{cls:data.status,rf:function(){
                                            if(data.status=="succ")
                                                window.location.reload();
                                        }})
                                    })
                                    return false;
                                }
                            },
                            {
                                txt:"Cancel"
                            }
                        ]
                    })
                    return false;
                });

                window.refresh=function(t){
                    if(t)
                        window.location.reload()
                    alertM.remove()
                }
            });
        </script>
</body>
</html>