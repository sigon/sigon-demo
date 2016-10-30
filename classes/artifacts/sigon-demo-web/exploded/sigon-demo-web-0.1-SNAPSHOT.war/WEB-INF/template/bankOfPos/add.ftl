<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body class="iframe">
<form id="editForm" method="post" class="form " action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${bankOfPos.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
            <p >
                <label class="f_info"><span data-icon="S"></span>Bank</label>
                <select id="bankNameId" name="bankNameId" data-v="validate[required]">
                    <option value="" >Select All</option>
                [#list bankNameList as item]
                    <option value="${item.id}" [#if item.id==bank.bankNameId]selected[/#if]>${item.shortName}</option>
                [/#list]
                </select>
            </p>
            <p >
                <label class="f_info"><span data-icon="S"></span>Account</label>
                <select id="bankId" name="bankId" data-v="validate[required]">
                    <option value="" >Select All</option>
                    [#if action=="update"]
                    <option value="${bank.id}" currency="${bank.currency}" selected>${bank.accountNo}-${bank.accountName}-${bank.currency}</option>
                    [/#if]
                </select>
            </p>
            <p >
                <label class="f_info"><span data-icon="S"></span>Currency</label>
                <input type="text" id="currency" name="currency" value="${bankOfPos.currency}" readonly="readonly" data-v="validate[required]">
            </p>
        </div>
    <p>
        <a href="javascript:" id="cancel" class="btn" data-icon="p">Cancel</a>
        <button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</button>
    </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        $("#bankNameId").on("change",function(){
            var $t = $(this);
            if ($t.val()==""){
                var html='<option value="" >Select All</option>';
                if ($t.is("#bankNameId")){
                    $("#bankId").html(html);
                    $("#bankId").trigger('change');
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
                html2+='<option value="" >Select All</option>';
                var select = false;
                for(var i=0;i<list.length;i++){
                    if (list[i].id=='${bankOfPos.bankId}'){select = true;}
                    html2+='<option value="'+list[i].id+'" currency="'+list[i].currency+'">'+list[i].accountNo+"-"+list[i].accountName+"-"+list[i].currency+'</option>';
                }
                $("#bankId").html(html2);
                if (select){
                    $("#bankId").val('${bankOfPos.bankId}');
                    $("#bankId").trigger('change');
                } else {
                    $("#bankId").trigger('change');
                }
            })
        })

        $("#bankId").on("change",function(){
            var selectBankId = $("#bankId option:selected");
            if(selectBankId.length > 0) {
                $("#currency").val(selectBankId.attr("currency"));
            } else {
                $("#currency").val("");
            }
        })

        $("#bankNameId").trigger('change');

        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                window.parent.refresh(1)
            })
            return false

        })
        $("#cancel").on("click",function(){
            window.parent.refresh()
        })
    })
</script>
</body>
</html>
