<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>

<h2 class="page_title">Transaction Detail List</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <input type="hidden" id="fromUrl" name="fromUrl" value="${bankDetail.fromUrl}">
    <menu>
        <div class="form">

            <p class="f_1p">
                <label class="f_info">Bank</label>
                <select id="bankNameId" name="bankNameId" >
                    <option value="" >All</option>
                [#list bankNameList as item]
                    <option value="${item.id}" [#if item.id==bankDetail.bankNameId]selected[/#if]>${item.shortName}</option>
                [/#list]
                </select>
            </p>

            <p class="f_1p">
                <label class="f_info">Account</label>
                <select id="bankId" name="bankId" >
                    <option value="" >All</option>
                [#--[#list bankList as item]--]
                    [#--<option value="${item.id}" [#if item.id==bankDetail.bankId]selected[/#if]>${item.accountNo}-${item.accountName}-${item.currency}</option>--]
                [#--[/#list]--]
                </select>
            </p>

            <p class="f_1p">
                <label class="f_info">Trade Type</label>
                <select id="tradeType" name="tradeType" >
                    <option value="" >All</option>
                [#list tradeTypeEnum as item]
                    [#if item.code != 8]
                    <option value="${item.code}" [#if item.code==bankDetail.tradeType]selected[/#if]>${item.desc}</option>
                    [/#if]
                [/#list]
                </select>
            </p>

            <p class="f_1p" id="recipientNameSelect">
                <label class="f_info">Recipient Bank</label>
                <select id="recipientBankNameId" name="recipientBankNameId" >
                    <option value="" >All</option>
                [#list bankNameList as item]
                    <option value="${item.id}" >${item.shortName}</option>
                [/#list]
                </select>
            </p>

            <p class="f_1p" id="recipientBankSelect">
                <label class="f_info">Recipient Account</label>
                <select id="recipientBankId" name="recipientBankId" >
                    <option value="" >All</option>
                [#--[#list bankList as item]--]
                [#--<option value="${item.id}" [#if item.id==bankDetail.recipientBankId]selected[/#if]>${item.accountNo}-${item.accountName}-${item.currency}</option>--]
                [#--[/#list]--]
                </select>
            </p>

            <p class="f_1p">
                <label class="f_info">Trade No</label>
                <input type="text" id="tradeNo" name="tradeNo" value="${bankDetail.tradeNo}" >
            </p>

            <p id="balanceStatusP" class="f_1p" [#if bankDetail.bankId == null]style="display: none"[/#if]>
                <label class="f_info">Status</label>
                <select id="balanceStatus" name="balanceStatus" >
                    <option value="" >ALL</option>
                [#list balanceStatusList as item]
                    <option value="${item.code}" [#if item.code==bankDetail.balanceStatus]selected[/#if]>${item.desc}</option>
                [/#list]
                </select>
            </p>

            <p class="f_2p">
                <label class="f_info">Trade Date</label>
            [@inputRegion id="createDate" type="date" timeType="yes" start=bankDetail.createDateStart end=bankDetail.createDateEnd]
                [#include "/include/inputregion.ftl"]
            [/@inputRegion]
            </p>

            <p class="f_1p">
                <label class="f_info">Employee</label>
                <select id="userId" name="userId" >
                    <option value="" >All</option>
                [#list userList as item]
                    <option value="${item.userId}" [#if item.userId==bankDetail.userId]selected[/#if]>${item.userId}</option>
                [/#list]
                    <option value="system" [#if bankDetail.userId=="system"]selected[/#if]>system</option>
                </select>
            </p>

            <p class="f_2p">
                <label class="f_info">Amount</label>
            [@inputRegion id="amount" type="number" name="amount" start=bankDetail.amountStart end=bankDetail.amountEnd]
                [#include "/include/inputregion.ftl"]
            [/@inputRegion]
            </p>

            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table" style="min-width: 1400px;">
        [@showMenu code ="050302"]
        <a href="javascript:" id="export" class="btn bg_blue">Export</a>
        [/@showMenu]
        <hr>
        <table>
            <tr>
                <th>Trade No</th>
                <th>Date[@pageOrder pageable=page.pageable property="create_date"][/@pageOrder]</th>
                <th>Account</th>
                <th>Recipient Account</th>
                <th>Trade Type</th>
                <th>Employee</th>
                <th>Currency</th>
                <th>Credit</th>
                <th>Debit</th>
                <th>Available Balance</th>
                <th>Deleted</th>
            </tr>
        [#list bankDetailParamList as item]
            <tr>

                [#--<td><a href="/bankDetail/detail.action?tradeNo=${item.tradeNo}&id=${item.id}&bankId=${item.bankId}&bankNameId=${item.bankNameId}" >${item.tradeNo}</a></td>--]
                <td>
                    [#if item.tradeType == 7]
                        <a href="/bankDetail/list.action?bankId=${item.bankId}&bankNameId=${item.bankNameId}&tradeTypes=7,8&createDateStart=${item.queryDateStart}&createDateEnd=${item.queryDateEnd}&queryint=1" title="Api Detail List" onclick="window.top.i_p.add(this);return false">${item.tradeNo}</a>
                    [#elseif item.tradeType == 15 || item.tradeType == 16]
                        <a href="/purchaseOrder/edit.action?orderNo=${item.tradeNo}">${item.tradeNo}</a>
                    [#elseif item.tradeType == 13 || item.tradeType == 14]
                        <a href="/mrpHandleRefundOrder/detail.action?orderNo=${item.tradeNo}">${item.tradeNo}</a>
                    [#elseif item.tradeType == 17 || item.tradeType == 18]
                        <a href="/mrpHandleRefundOrder/detail.action?orderNo=${item.tradeNo?split("<br/>")[0]}">${item.tradeNo?split("<br/>")[0]}</a>
                        <br>
                        [@orderLink orderNo=item.tradeNo?split("<br/>")[1]]${item.tradeNo?split("<br/>")[1]}[/@orderLink]
                    [#else]
                        [@orderLink orderNo=item.tradeNo]${item.tradeNo}[/@orderLink]
                    [/#if]
                </td>
                <td>${item.createDate?datetime}</td>
                <td>${item.account}</td>
                <td>${item.recipientAccount}</td>
                <td>${tradeTypeMap.get(item.tradeType).desc}</td>
                <td>${item.userId}</td>
                <td>${item.currency}</td>
                <td> [#if item.amount<0][@number num = item.amount*-1][/@number][/#if]</td>
                <td> [#if item.amount>0][@number num = item.amount][/@number][/#if]</td>
                <td>[@number num = item.availableBalance][/@number]</td>
                <td>
                    [#if item.delFlag??]
                        true
                    [#else]
                        false
                    [/#if]
                </td>

            </tr>
        [/#list]
        </table>
    [@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
        [#include "/include/pagination.ftl"]
    [/@pagination]

    [#if bankDetail.fromUrl != null]
        <a data-icon="p" class="btn" href="${bankDetail.fromUrl}" id="back">Back</a>
    [/#if]
    </div>
</form>

<script>
    seajs.use(["alert","validation"], function (alertM) {

        $("#bankId").on("change",function(){
            var balanceStatus = $("#balanceStatus").val();
            var $t=$(this).val();
            if($t == "") {
                $("#balanceStatusP").hide();
                $("#balanceStatus").get(0).selectedIndex = 0;
            } else {
                $("#balanceStatusP").show();
            }
            return false;
        });

        $("#bankNameId,#recipientBankNameId").on("change",function(){
            var $t = $(this);
            if ($t.val()==""){
                var html='<option value="" >All</option>';
                //bankName为all的时候，account也为all
                if ($t.is("#bankNameId")){
                    $("#bankId").html(html);
                    $("#bankId").trigger('change');
                }else {
                    $("#recipientBankId").html(html);
                }
                return ;
            }
            $.ajax({ type: "POST",
                url: "/bankDetail/changeAccount.action",
                dataType:"json",
                data: {id:$t.val()}
            }).done(function(data){
                var html2="";
                var list=data.data;
                html2+='<option value="" >All</option>';
                if ($t.is("#bankNameId")){
                    var select = false;
                    for(var i=0;i<list.length;i++){
                        if (list[i].id=='${bankDetail.bankId}'){select = true;}
                        html2+='<option value="'+list[i].id+'">'+list[i].accountNo+"-"+list[i].accountName+"-"+list[i].currency+'</option>';
                    }
                    $("#bankId").html(html2);
                    if (select){
                        $("#bankId").val('${bankDetail.bankId}');
                    } else {
                        $("#bankId").trigger('change');
                    }
                }else {
                    var select = false;
                    for(var i=0;i<list.length;i++){
                        if(list[i].id=='${bankDetail.recipientBankId}') {select = true;}
                        html2+='<option value="'+list[i].id+'">'+list[i].accountNo+"-"+list[i].accountName+"-"+list[i].currency+'</option>';
                    }
                    $("#recipientBankId").html(html2);
                    if (select) {$("#recipientBankId").val('${bankDetail.recipientBankId}');}
                }
            })
        });


        //初始化页面的时候，bankName为all的时候，account也为all，根据tradeType显示收款账户
        $(document).ready(function(){
            var html ='<option value="" >All</option>';
            $("#bankNameId").val('${bankDetail.bankNameId}');
            $('#bankNameId').trigger('change');
            if ($("#bankNameId").val()==""){
                $("#bankId").html(html);
            }

            $("#recipientBankNameId").val('${bankDetail.recipientBankNameId}');
            $('#recipientBankNameId').trigger('change');
            $("#recipientBankId").val('${bankDetail.recipientBankId}');
            if ($("#bankNameId").val()==""){
                $("#bankId").html(html);
            }
            if ($("#recipientBankNameId").val()==""){
                $("#recipientBankId").html(html);
            }
            if( $("#tradeType").val()==5){
                $("#recipientNameSelect").show();
                $("#recipientBankSelect").show();
            }else {
                $("#recipientNameSelect").hide();
                $("#recipientBankSelect").hide();
            }
        });
        $("#export").on("click",function(){
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
                                [@showMenu code="0601"] if(data.status=="succ")
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
                                    }) [/@showMenu]
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
        });
        $("#tradeType").on("change",function(){
            if( $(this).val()==5){
                $("#recipientNameSelect").show();
                $("#recipientBankSelect").show();
            }else {
                $("#recipientNameSelect").hide();
                $("#recipientBankSelect").hide();
                $("#recipientBankNameId").get(0).selectedIndex = 0;
                $("#recipientBankId").get(0).selectedIndex = 0;
            }
        });

    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>