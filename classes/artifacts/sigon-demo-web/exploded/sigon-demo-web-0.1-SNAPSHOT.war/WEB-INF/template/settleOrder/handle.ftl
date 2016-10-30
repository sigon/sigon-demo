<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
<h2>Handle</h2>
    <form action="" id="form1" class="form form_short_info">
    <input type="hidden" name="formLength" id="form_length" />
    <input type="hidden" name="orderNo" value="${settleOrder.orderNo}" />
    <input type="hidden" id="pageNumber" name="pageNumber" value="${pageNumber}">
    <h4>Order Details</h4>
    <div class="cf">
        <p class="f_1p"><label class="f_info">Order No:</label><span>${settleOrder.orderNo}</span></p>
        <p class="f_1p"><label class="f_info">Amount:</label><span>${paymentOrder.currencyAfter}:[@number num = settleOrder.amount][/@number]</span></p>
    </div>
    <div class="cf">
        <p class="f_1p"><label class="f_info">Amount paid:</label><span>${paymentOrder.currencyAfter}:[@number num = settleOrder.paidAmount][/@number]</span></p>
        <p class="f_1p">
            <label class="f_info">Purpose of payment</label>
            <span>[@showValue value=paymentOrder.remark][/@showValue]</span>
        </p>
    </div>
	<div class="cf">
        <p class="f_1p">
            <label class="f_info">Outstanding Amount </label>
            <span>${paymentOrder.currencyAfter} [@number num = outStandingAmount ][/@number]</span>
        </p>
    </div>
    <h4>Receiver Details</h4>
    [#if paymentOrder.currencyAfter!="CNY"]
        <p>
            <label class="f_info">Country</label>
        ${countryEnumMap.get(paymentOrderAccount.country)}
        </p>
    [/#if]

    [#if paymentOrder.currencyAfter=="CNY"]
    <div>
        <p class="f_1p">
            <label class="f_info">National ID name</label>
        ${paymentOrderAccount.idName}<span data-icon="y" class="green"></span>
        </p>

        <p class="f_1p">
            <label class="f_info">National ID number</label>
        ${paymentOrderAccount.idNumber}
        </p>
    </div>
    [/#if]
    <div>
        <p class="f_1p">
            <label class="f_info">Bank name</label>
        ${paymentOrderAccount.bankName}
        </p>
        <p class="f_1p">
            <label class="f_info">Bank branch</label>
        ${paymentOrderAccount.bankBranch}
        </p>
    </div>
        <div>
        <p class="f_1p" id="serviceAmount">
            <label class="f_info">Account name</label>
        ${paymentOrderAccount.accountName}
        </p>
        <p class="f_1p" id="toAccount">
            <label class="f_info">Account number</label>
        ${paymentOrderAccount.accountNumber}
        </p>
        </div>
        <div>
            <p class="f_1p">
                <label class="f_info">Reference</label>
            [@showValue value=paymentOrderAccount.reference][/@showValue]
            [#--${paymentOrderAccount.reference}--]
            </p>
            [#if paymentOrder.currencyAfter=="CNY"]
            <p class="f_1p">
                <label class="f_info">CNAPS code</label>
            ${paymentOrderAccount.unionCode}
            </p>
            [/#if]
            [#if paymentOrder.currencyAfter!="CNY"]
            <p class="f_1p">
                <label class="f_info">Swift code</label>
            ${paymentOrderAccount.unionCode}
            </p>
            [/#if]
        </div>
        [#if paymentOrder.currencyAfter!="CNY"]
            <div>
                <p class="f_1p">
                    <label class="f_info">Bank address</label>
                ${paymentOrderAccount.branchAddress}
                </p>
                <p class="f_1p">
                    <label class="f_info">Beneficiary address</label>
                ${paymentOrderAccount.beneficiaryAddress}
                </p>
            </div>
        [/#if]

        [#if settleOrderAccountList.size()!=0]
    [#include "/settleOrder/settleOrderAccount.ftl"/]
        [/#if]
    <h4>Payment Details</h4>
    <p>
        <label class="f_info">Whether Pay Or Not</label>
        <input type="radio" name="agree" value="agree" checked id="c2">
        <label for="c2" class="f_for">Agree</label>
        [#if settleOrder.paidAmount<=0]
            <input type="radio" name="agree" value="reject" id="c3">
            <label for="c3" class="f_for">Reject</label>
        [/#if]
    </p>
    <div id="bank_s1" class="cf">
        <h4>
            <label class="f_info">From Bank</label>
        </h4>
        <p>
            <label id="add_bank1" class="red" data-icon="a">Add payment bank</label>
        </p>
        <hr>
    </div>
    <div id="reject1" style="display: none">
        <p id="merchantInfoi18n">
            <label class="f_info">Merchant Language</label>
        ${merchantInfoi18n}
        </p>
        <p>
            <label class="f_info"><span data-icon="S"></span>Reject Reason</label>
            <textarea name="reason" data-v="validate[required,maxSize[100]]"></textarea>
        </p>
    </div>
    <p>
        <a href="list.action" id="cancel" class="btn" data-icon="p" >Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Save</Button>
    </p>
</form>

<div id="bank_info1" style="display: none">
    <input type="hidden" name="bankId_0" class="bankId"/>
    <div class="cf">
        <p class="f_1p"><label class="f_info">Bank name:</label><span class="bank_name1"></span></p>
        <p class="f_1p"><label class="f_info">Country:</label><span class="contury1"></span></p>
    </div>
    <div class="cf">
        <p class="f_1p"><label class="f_info">Account name:</label><span class="at_name1"></span></p>
        <p class="f_1p"><label class="f_info">Account number:</label><span class="at_no1"></span></p>
    </div>
    <div class="cf">
        <p class="f_1p"><label class="f_info">Available Balance:</label><span class="balance1"></span></p>
        <div class="fr" style="width:50%">
            <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Amount:</label><input type="text"  class="amount1 amountFee" name="doubleAmount_0" onblur="blurToMoney(this)" data-v="validate[required,min[0.01]]" value="[#if settleOrder.amount==""][#else][@number formatStr="##0.00" num = (settleOrder.amount-settleOrder.paidAmount)][/@number][/#if]"></p>
            <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Fee:</label><input type="text"  name="doubleFee_0" onblur="blurToMoney(this)" data-v="validate[required,max[10000000]]"></p>
        </div>
    </div>


    <p><label class="f_info">Remark:</label><input type="text" name="remark_0" data-v="validate[maxSize[100]]"></p>
    [#--<p><label class="f_info">Attachment:</label>--]
        [#--<input type="file" name="upfile" id="upfile">--]
        [#--<span id="upload_sp"></span>--]
    [#--</p>--]
    <p class="cf"><label class="f_info">Attachment:</label>
        <span class="f_upload_p"></span><input type="file" class="upfile">
    </p>
    <p>
        <label for="" class="info"></label><span class="red">Only type is *.jpg,*.png,*.gif,*.txt,*.doc,*.xls,*.pdf,*.docx,*.xlsx</span>
    </p>
    <p>
        <label class="fl delete_d blue" data-icon="d">Remove this bank account</label>
    </p>
    <hr>
</div>
<script>
    seajs.use(["alert","upload","piczoom", "validation"], function (alertM, upload,piczoom) {
        $("#form1").validationEngine().on("submit",function(){
            var sumAmount=0;
            $(".amountFee").each(function(){
                sumAmount+=this.value*1
            })
            var payAmount="${settleOrder.amount-settleOrder.paidAmount}"*1;
            if((sumAmount-payAmount/100)>payAmount/100){
                alertM("总金额不能大于提款金额",{cls:"cross"});
                return false;
            }
//            var uoloaded=false
//            $(".f_upload_p").not(":last").each(function(){
//                if(!$(this).find(".file_up").length)
//                    uoloaded=true
//            })
            if($("#c2").prop("checked")&&!$(".accont_d").length){
                alertM("Please select a payment bank",{cls:"cross"})
                return false;
            }
//            else if($("#c2").prop("checked")&&uoloaded){
//                alertM("至少上传一个文件",{cls:"cross"})
//                return false;
//            }
            else{
                alertM.end("save.action",$("#form1").serialize(),function(){
                    var pageNumber = $("#pageNumber").val();
                    window.parent.refreshIframe1(pageNumber);
                    window.location.href="/settleOrder/list.action";
                })
            }
            return false;
        }).on("click",".delete_d",function(){
            $(this).parent().parent().remove();
        });

        var upload_init=function($t){
            upload({
                bind: $t.find(".upfile"),
                url: "/upload/uploadFileDoc.action?folderNameId=${module.code}",
                fileName: "file",
                multiple:0,
                succ: function (d) {
                    var data = d[0];
                    var html = '<span class="file_up">';
                    if (data.type == "images")
                        html += '<span class="file_up_images" style="background-image:url(' + data.filePath  + ')" data-title="' + data.i_txt + '" data-src="' + data.filePath + '"></span>'
                    else
                        html += '<a class="file_up_txt" href="/upload/down.action?fileUrl=' + data.urlF +'&fileName='+ data.i_txt + '" target="_blank" data-icon="2"></a>'
                    $s.show().html(html + '<a class="remove" href="javascript:" data-fid="' + data.key + '">&times;</a><input type="text" class="file_txt" name="fileName' + $t.data("picname") + '" value="' + data.i_txt + '"><input type="hidden" name="key' + $t.data("picname") + '" value="' + data.key + '"></span>')
                    $t.find(".upload_btn").hide();
                }
            });
            var $s = $t.find(".f_upload_p").on("click", ".remove", function () {
                $(this).parent().remove();
                $t.find(".upload_btn").show();
                if(!$s.find(".file_up").length)
                    $s.hide()
            });
            piczoom($t.find(".f_upload_p"),".file_up_images")
        }

        $("#c2,#c3").on("change",function(){
            if($("#c2").prop("checked")){
                $("#bank_s1").show()
                $("#reject1").hide()
            }else{
                $("#bank_s1").hide()
                $("#reject1").show()
            }
        })
        var  $add_d=$("#add_bank1").on("click",function(){
            alertM("accountList.action?currency=${paymentOrder.currencyAfter}",{
                iframe:1,
                width:900,
                title:"选择银行(双击选择)",
                time:"y"
            })
        }).parent()
        window.setAH = function(h) {
            $("#alertP").animate({
                height: h
            })
        };
        var html=$("#bank_info1").html();
        var form_length=0;
        window.getBank=function(i){

            alertM.end("selectAccount.action","id="+i,function(data){
                var $t=$('<div class="accont_d"></div>')
                $t.html(html.replace(/_0/g,++form_length));
                $("#form_length").val(form_length)
                $t.data("picname",form_length)
                $t.find(".bankId").val(i)
                $t.find(".bank_name1").text(data.data.bankName)
                $t.find(".contury1").text(data.data.country)
                $t.find(".at_name1").text(data.data.bank.accountName)
                $t.find(".at_no1").text(data.data.bank.accountNo)
                if(data.data.availableBalance-0<0)
                    $t.find(".balance1").text("-"+fixMoney(0-data.data.availableBalance))
                else
                    $t.find(".balance1").text(fixMoney(data.data.availableBalance))
                var sumAmount=0;
                $(".amountFee").not(":last").each(function(){
                    sumAmount+=this.value*1
                })
                var payAmount="${settleOrder.amount-settleOrder.paidAmount}"-0;
                var payAmount100=accDiv(payAmount,100);//除法
//                var sumAmountSub=accSub(sumAmount,payAmount100);//已填的待支付金额  减法
                var money = accSub(payAmount100,sumAmount);

                if(money<=0){
                    money=0;
                }
                $t.find(".amount1").val(money).trigger("blur");
                $t.insertBefore($add_d)
                upload_init($t);
            })
        }

        $("#table_1").on("click",".td_down",function(){
            $(this).parent().parent().toggleClass("tr_next_show")
        })
    })
</script>
</body>
</html>
</html>
