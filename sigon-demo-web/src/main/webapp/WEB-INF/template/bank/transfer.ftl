<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body class="iframe">
<form id="inputForm" method="post" class="form form_short_info" enctype="multipart/form-data">
    <input type="hidden" name="id" value="${bank.id}">
    <p class="f_1p">
        <label class="f_info"><span data-icon="S"></span>Account:</label><span>${bank.currency}-${bankName}-${bank.accountNo}</span>
    </p>

    <p class="f_1p">
        <label class="f_info"><span data-icon="S"></span>Amount</label>
        <input type="text" id="doubleAmount" onblur="blurToMoney(this)" pattern="^(\d*)(\.\d\d)?$" name="transferAmount" data-v="validate[required,min[0.01],max[10000000],custom[number]]" />
    </p>

    <div>
    <p class="f_1p">
        <label class="f_info"><span data-icon="S"></span>Service Account Bank </label>
        <select name="feeBankNameId" id="feeBankNameId" data-v="validate[required]" >
            <option value="">All</option>
        [#list bankNameList as item]
            <option value="${item.id}" [#if feeBankNameId==null&&item.id=bank.bankNameId]selected[/#if]>${item.shortName}</option>
        [/#list]
        </select><span id="serviceBankSpan" hidden class="red">This field cannot be left blank</span>
    </p>

    <p class="f_1p">
        <label class="f_info"><span data-icon="S"></span>Service Account</label>
        <select name="feeBankId" id="feeBankId"  data-v="validate[required]"  >
            <option value="">All</option>
        [#list bankList as item]
            <option value="${item.id}" [#if feebankId==null&&item.id==bank.id]selected[/#if]>${item.accountNo}-${item.accountName}-${item.currency}</option>
        [/#list]
        </select>
    </p>
    </div>

    <div>
    <p class="f_1p">
        <label class="f_info"><span data-icon="S"></span>Service Amount</label>
        <input type="text"  pattern="^(\d*)(\.\d\d)?$"  onblur="blurToMoney(this)"id="fee" name="feeAmount" data-v="validate[required,custom[number],min[0.01],max[10000000]]"  />

    </p>

    <p class="f_1p">
    </p>
    </div>

    <div>
    <p class="f_1p">
        <label class="f_info"><span data-icon="S"></span>To Account Bank </label>
        <select name="recipientBankNameId" id="recipientBankNameId" data-v="validate[required]">
            <option value="">All</option>
        [#list bankNameList as item]
            <option value="${item.id}" >${item.shortName}</option>
        [/#list]
        </select>
    </p>


    <p class="f_1p">
        <label class="f_info"><span data-icon="S"></span>To Account</label>
        <select name="recipientBankId" id="recipientBankId" data-v="validate[required]">
            <option value="">All</option>
        [#list bankList as item]
            [#if item.id!=bank.id&&item.currency==bank.currency]
            <option value="${item.id}" >${item.accountNo}-${item.accountName}-${item.currency}</option>
            [/#if]
        [/#list]
        </select>
    </p>
    </div>

    <p >
        <label class="f_info">Comment</label>
        <textarea id="comment" maxlength="100"  name="remark"  data-v="validate[maxSize[100]]" ></textarea>
        <br/><span id="msg"></span>
    </p>

    <p>
        <a href="javascript:" id="cancel" class="btn" data-icon="p">Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>
    </p>
</form>
<script>
    seajs.use(["alert","validation"],function(alertM){
        showLength("#comment","#msg",100);
        $("#feeBankNameId,#recipientBankNameId").on("change",function(){
            var $t = $(this);
            if ($t.val()==""){
                var html='<option value="" >All</option>';
                //bankName为all的时候，account也为all
                if ($t.is("#feeBankNameId")){
                    $("#feeBankId").html(html);
                }else {
                    $("#recipientBankId").html(html);
                }
                return ;
            }
//            var url=$(this).is("#feeBankNameId")?"/bankDetailOrder/changeAccount.action?c=0":"/bankDetailOrder/changeAccount.action?c=1";
            var url = "/bank/changeAccount.action"
            $.ajax({
                type: "POST",
                url: url,
                dataType: "json",
                data: {id: $t.val()}
            }).done(function (data) {
                var html ='<option value="" >All</option>';
                var list = data.data;
                if ($t.is("#recipientBankNameId")) {
                    if (list.length == 0) {
                    } else {
                        for (var i = 0; i < list.length; i++) {
                            if ("${bank.currency}" == list[i].currency && "${bank.id}" != list[i].id) {
                                html += '<option value="' + list[i].id + '">' + list[i].accountNo + "-" + list[i].accountName + "-" + list[i].currency + '</option>';
                            }
                        }
                    }
                    $("#recipientBankId").html(html);
                } else {
                    if (list.length == 0) {
                    } else {
                        for (var i = 0; i < list.length; i++) {
                            html += '<option value="' + list[i].id + '">' + list[i].accountNo + "-" + list[i].accountName + "-" + list[i].currency + '</option>';
                        }
                    }
                    $("#feeBankId").html(html);
                }
            });
        });

        $(document).ready(function(){
            var url = "/bank/changeAccount.action"
            var html ='<option value="" >All</option>';
            if ($("#recipientBankNameId").val()==""){
                $("#recipientBankId").html(html);
            }else{
                $.ajax({
                    type: "POST",
                    url: url,
                    dataType: "json",
                    data: {id: $("#recipientBankNameId").val()}
                }).done(function (data) {
                    var html = "";
                    var list = data.data;
                        if (list.length == 0) {
                        } else {
                            for (var i = 0; i < list.length; i++) {
                                if ("${bank.currency}" == list[i].currency && "${bank.id}" != list[i].id) {
                                    html += '<option value="' + list[i].id + '">' + list[i].accountNo + "-" + list[i].accountName + "-" + list[i].currency + '</option>';
                                }
                            }
                        }
                        $("#recipientBankId").html(html);
                })
            }
            if ($("#feeBankNameId").val()==""){
                $("#feeBankId").html(html);
            }else{
                $.ajax({
                    type: "POST",
                    url: url,
                    dataType: "json",
                    data: {id: $("#feeBankNameId").val()}
                }).done(function (data) {
                    var html = "";
                    var list = data.data;
                        if (list.length == 0) {
                        } else {
                            for (var i = 0; i < list.length; i++) {
                                var selected = ""
                                if(list[i].id=="${bank.id}"){
                                    selected = " selected "
                                }
                                html += '<option value="' + list[i].id + '"'+ selected +'>' + list[i].accountNo + "-" + list[i].accountName + "-" + list[i].currency + '</option>';
                            }
                        $("#feeBankId").html(html);
                    }
                })
            }


        });

        $("#inputForm").validationEngine().on("submit",function(){
                $("#serviceBankSpan").hide();
                $("#serviceAccountSpan").hide();
                alertM.end("/bank/transferInsert.action",$("#inputForm").serialize(),function(){
                    window.parent.location.href="/bank/list.action";
                });
                return false;
        }).on('jqv.form.result',function(){
            window.parent.setAH($("body").height()+12);
        });
        $("#cancel").on("click",function(){
            window.parent.refresh()
        })
        window.parent.setAH($("body").height()+12);
    })
</script>
</body>
</html>