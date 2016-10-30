<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>

<h2 class="page_title">Api Detail List</h2>
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
                    <option value="${item.id}" >${item.shortName}</option>
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

            [#--<p class="f_1p">
                <label class="f_info">Trade Type</label>
                <select id="tradeType" name="tradeType" >
                    <option value="" >All</option>
                [#list tradeTypeEnum as item]
                    <option value="${item.code}" [#if item.code==bankDetail.tradeType]selected[/#if]>${item.desc}</option>
                [/#list]
                </select>
            </p>--]
            [#assign tradeTypeArray=(bankDetail.tradeTypes?split(","))]
            <p>
                <label class="f_info">Trade Type</label>
                <input id="tradeTypesAll" type="checkbox" />
                <label for="tradeTypesAll" class="f_for" style="min-width: 0px;">All</label>
            [#list tradeTypeEnum as item]
                [#if item.code == 7 || item.code == 8]
                <input id="tradeType${item.code}" name="tradeTypes" type="checkbox" value="${item.code}" [#if tradeTypeArray?seq_contains(item.code + "")]checked[/#if] />
                <label for="tradeType${item.code}" class="f_for">${item.desc}</label>
                [/#if]
            [/#list]
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

            <p class="f_2p">
                <label class="f_info">Trade Date</label>
            [@inputRegion id="createDate" type="date" timeType="yes" start=bankDetail.createDateStart end=bankDetail.createDateEnd]
                [#include "/include/inputregion.ftl"]
            [/@inputRegion]
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
    <div class="table" style="min-width: 1200px;">
        <table>
        [@showMenu code ="050302"]
            <a href="javascript:" id="export" class="btn bg_blue">Export</a>
        [/@showMenu]
            <hr>
            <tr>
                <th>Trade No</th>
                <th>Date[@pageOrder pageable=page.pageable property="id"][/@pageOrder]</th>
                <th>Account</th>
                <th>Trade Type</th>
                <th>Employee</th>
                <th>Currency</th>
                <th>Credit</th>
                <th>Debit</th>
                <th>Balance</th>
            </tr>
        [#list bankDetailParamList as item]
            <tr>

                [#--<td><a href="/bankDetail/detail.action?tradeNo=${item.tradeNo}&id=${item.id}&bankId=${item.bankId}&bankNameId=${item.bankNameId}" >${item.tradeNo}</a></td>--]
                <td>[@orderLink orderNo=item.tradeNo]${item.tradeNo}[/@orderLink]</td>
                <td>${item.createDate?datetime}</td>
                <td>${item.account}</td>
                <td>${tradeTypeMap.get(item.tradeType).desc}</td>
                <td>${item.userId} </td>
                <td>${item.currency}</td>
                <td> [#if item.amount<0][@number num = item.amount*-1][/@number][/#if]</td>
                <td> [#if item.amount>0][@number num = item.amount][/@number][/#if]</td>
                <td> [@number num = item.balance][/@number]</td>
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
        $("#listForm").on("submit",function(){
            $c = $("input[name='tradeTypes']:checked")
            if($c.size() == 0) {
                alertM("需要选择一个Trade Type",{cls:"error"})
                return false;
            }
        })


        $("input[name='tradeTypes']").on("change",function(){
            $c = $("input[name='tradeTypes']:not(:checked)")
            if($c.size() == 0) {
                $("#tradeTypesAll").prop("checked", true);
            } else {
                $("#tradeTypesAll").prop("checked", false);
            }
        }).trigger("change");

        $("#tradeTypesAll").on("change",function(){
            if($("#tradeTypesAll").prop("checked")) {
                $("input[name='tradeTypes']").prop("checked", true);
            } else {
                $("input[name='tradeTypes']").prop("checked", false);
            }
        });

        $("#bankNameId,#recipientBankNameId").on("change",function(){
            var $t = $(this);
            if ($t.val()==""){
                var html='<option value="" >All</option>';
                //bankName为all的时候，account也为all
                if ($t.is("#bankNameId")){
                    $("#bankId").html(html);
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
                    if (select){$("#bankId").val('${bankDetail.bankId}');}
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
            var tradeTypes = '${bankDetail.tradeTypes}';
            if(tradeTypes == '') {
                $('#tradeTypesAll').trigger('click');
            }
            var html ='<option value="" >All</option>';
            $("#bankNameId").val('${bankDetail.bankNameId}');
            $('#bankNameId').trigger('change');
            $("#bankId").val('${bankDetail.bankId}');
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

        $("#tradeType").on("change",function(){
            if( $(this).val()==5){
                $("#recipientNameSelect").show();
                $("#recipientBankSelect").show();
            }else {
                $("#recipientNameSelect").hide();
                $("#recipientBankSelect").hide();
            }
        });

        $("#export").on("click",function(){
            $c = $("input[name='tradeTypes']:checked")
            if($c.size() == 0) {
                alertM("需要选择一个Trade Type",{cls:"error"})
                return false;
            }
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
    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>