<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
<h2>Delivery</h2>
    <form action="" id="form1" class="form form_short_info">
        <input type="hidden" name="poId" value="${purchaseOrder.id}">
    <h4>Purchase Order Info</h4>
    <div class="cf">
        <input type="hidden" name="providerName" value="${provider.name}">
        <input type="hidden" name="purchaseNo" value="${purchaseOrder.orderNo}">
        <p class="f_1p"><label class="f_info">Provider</label><span>${provider.name}</span></p>
        <p class="f_1p"><label class="f_info">Order No</label><span>${purchaseOrder.orderNo}</span></p>
    </div>
    <div class="cf">
        <p class="f_1p"><label class="f_info">Direction</label>
            <select name="direction" id="direction">
                [#list paTypeList as type]
                    <option value="${type.code}" [#if purchaseOrder.payable == 1 && type.code == 2]selected[/#if] >${type.desc}</option>
                [/#list]
            </select>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"></span>Currency & amount</label>
            [#if purchaseOrder.purchaseType==2]
                <span style="width: 20%;display: none;" id="sellCurrency">${purchaseOrder.midCurrency}</span>
                <span style="width: 20%;display: none;" id="buyCurrency">${purchaseOrder.buyCurrency}</span>
                <input type="text" id="amountDouble" style="width: 80%" onblur="blurToMoney(this),blurAmt()" name="doubleAmount"  value="[@number num = purchaseOrder.midAmount-purchaseOrder.amtToPay formatStr="##0.00"][/@number]"  data-v="validate[required,min[0.01]]">
                [#else]
                <span style="width: 20%;display: none;" id="sellCurrency">${purchaseOrder.sellCurrency}</span>
                    <span style="width: 20%;display: none;" id="buyCurrency">${purchaseOrder.buyCurrency}</span>
                    <input type="text" id="amountDouble" style="width: 80%" onblur="blurToMoney(this),blurAmt()" name="doubleAmount"  value="[@number num = purchaseOrder.sellAmount-purchaseOrder.amtToPay formatStr="##0.00"][/@number]"  data-v="validate[required,min[0.01]]">
            [/#if]

        </p>
    </div>
        <h4 id="h4a">From Bank</h4>
        <div>
            <p class="f_1p">
                <a href="javascript:" id="add_bank1" class="btn bg_green">选择银行</a>
            </p>

        </div>
        <div id="bank_info1" style="display: none">
            <input type="hidden" name="fromBankId" class="bankId"/>
            <div class="cf">
                <p class="f_1p"><label class="f_info">Bank name:</label><span class="bank_name"></span></p>
                <p class="f_1p"><label class="f_info">Country:</label><span class="country"></span></p>
            </div>
            <div class="cf">
                <p class="f_1p"><label class="f_info">Account name:</label><span class="at_name"></span></p>
                <p class="f_1p"><label class="f_info">Account number:</label><span class="at_no"></span></p>
            </div>
            <div class="cf">
                <p class="f_1p"><label class="f_info">Available Balance:</label><span class="balance"></span></p>
                <div class="fr" style="width:50%">
                    <p class="f_1p"><label class="f_info">Amount:</label><input type="text" id="amount" readonly class="amount amountFee"></p>
                    <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Fee:</label><input type="text" id="fee"  name="doubleFee" onblur="blurToMoney(this)" data-v="validate[required,max[10000000]]"></p>
                </div>
            </div>


            [#--<p class="cf"><label class="f_info">Attachment:</label>--]
                [#--<span class="f_upload_p"></span><input type="file" class="upfile">--]
            [#--</p>--]
            <p class="cf"><label class="f_info">Upload Remittance Documents</label>
                <span id="f_upload_p" style="display: none">
                [#list picList as file]
                    <span class="file_up">
                        [#if file.fileType==1]
                            <span class="file_up_images" style="background-image:url([@fileUrl m=module.module f=file.url t="s"][/@fileUrl])" data-title="${file.name}" data-src="[@fileUrl m=module.module f=file.url][/@fileUrl]"></span>
                                    <a class="remove" href="javascript:" data-fid="${file.id}">&times;</a>
                                    <input type="text" class="file_txt fileName" data-fid="${file.id}" name="fileName${file.id}" value="${file.name}"/>
                                    <input type="hidden" class="file_txt" name="key" value="${file.id}"/>
                        [#elseif file.fileType == 2]
                            <a class="file_up_txt" href="/upload/down.action?fileUrl=[@fileUrl m=module.module f=file.url][/@fileUrl]&fileName=${file.name}" target="_blank" data-icon="2"></a>
                                    <a class="remove" href="javascript:" data-fid="${file.id}">&times;</a>
                                    <input type="text" class="file_txt fileName" data-fid="${file.id}" name="fileName${file.id}" value="${file.name}"/>
                                    <input type="hidden" class="file_txt" name="key" value="${file.id}"/>
                        [/#if]
                    </span>
                [/#list]

                </span><input type="file" id="upfile">
            </p>
            <p>
                <label for="" class="info"></label><span class="red">Only type is *.jpg,*.png,*.gif,*.txt,*.doc,*.xls,*.pdf,*.docx,*.xlsx</span>
            </p>
            <hr>
        </div>
        <h4 id="h4b">To Bank</h4>
        [#if bopList?size!=0]
        <div id="divToBank">
            [#list bopList as bop]
                [#if mapBankName.get(mapBank.get(bop.bankId).bankNameId)?length!=0&&mapBank.get(bop.bankId)?length!=0]
                    <p class="radio${mapBank.get(bop.bankId).currency}" style="display:none;">
                        <input type="radio" required name="toBankId" id="a${bop.id}" value="${bop.bankId}" bankname="${mapBankName.get(mapBank.get(bop.bankId).bankNameId)}" accountname="${mapBank.get(bop.bankId).accountName}" accountno="${mapBank.get(bop.bankId).accountNo}"><label for="a${bop.id}">${mapBankName.get(mapBank.get(bop.bankId).bankNameId)}-${mapBank.get(bop.bankId).accountName}-${mapBank.get(bop.bankId).accountNo}-${mapBank.get(bop.bankId).currency}</label>
                    </p>
                [/#if]
            [/#list]
        </div>
        [#else]
        <div id="divToBank">
                No bank for the time being
        </div>
        [/#if]
        <p>
             <input type="radio" required name="toBankId" value="" id="nullBank"><label for="nullBank" class="f_for">使用新的临时银行</label>
        </p>
        <div id="otherBank">
            <p class="f_1p">
                <label class="f_info"><span data-icon="S" class="msgB"></span>Bank Name</label>
                <input type="text" name="toBankName" id="toBankName" data-v=validate[required,maxSize[100]]">
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  class="msgB"></span>Account Name</label>
                <input type="text" name="toAccountName" id="toAccountName" data-v=validate[required,maxSize[100]]">
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  class="msgB"></span>Account Number</label>
                <input type="text" name="toAccountNumber" id="toAccountNumber" data-v=validate[required,custom[onlyLetterNumber],maxSize[50]]">
            </p>
        </div>
        <p>
            <label class="f_for">Comment</label>
            <textarea name="remark" id="comment" data-v="validate[maxSize[100]]"></textarea> <br>
            <span id="commentMsg" class="red"></span>
        </p>
    <p>
        <a href="list.action" id="cancel" class="btn" data-icon="p" >Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Save</Button>
    </p>
</form>


<script>
    seajs.use(["alert","upload","piczoom", "validation"], function (alertM, swfupload,piczoom) {
        $("#direction").on("change",function(){
            $("#bank_info1").hide();
            var $t=$(this);
            if($t.val()==1){

                $("#sellCurrency").show();
                $("#buyCurrency").hide();
                [#if purchaseOrder.purchaseType==2]
                    $("#amountDouble").val("[@number num = purchaseOrder.midAmount-purchaseOrder.amtToPay formatStr="##0.00"][/@number]");
                    $("#amountDouble").attr("data-v","validate[required,min[0.01],max[[@number num = purchaseOrder.midAmount-purchaseOrder.amtToPay formatStr="##0.00"][/@number]]]").validationEngine('validate');
                [#else]
                    $("#amountDouble").val("[@number num = purchaseOrder.sellAmount-purchaseOrder.amtToPay formatStr="##0.00"][/@number]");
                    $("#amountDouble").attr("data-v","validate[required,min[0.01],max[[@number num = purchaseOrder.sellAmount-purchaseOrder.amtToPay formatStr="##0.00"][/@number]]]").validationEngine('validate');
                [/#if]

                $("#amount").val($("#amountDouble").val());
                $(".radio"+$("#buyCurrency").html()).hide().prop("checked",false);
                $(".radio"+$("#sellCurrency").html()).show();

                $("#h4a").html("From Bank");
                $("#h4b").html("To Bank");

            }else{
                $("#buyCurrency").show();
                $("#sellCurrency").hide();
                $("#amountDouble").val("[@number num = purchaseOrder.buyAmount-purchaseOrder.amtToReceive formatStr="##0.00"][/@number]");
                $("#amountDouble").attr("data-v","validate[required,min[0.01],max[[@number num = purchaseOrder.buyAmount-purchaseOrder.amtToReceive formatStr="##0.00"][/@number]]]").validationEngine('validate');
                $("#amount").val($("#amountDouble").val());
                $(".radio"+$("#sellCurrency").html()).hide().prop("checked",false);
                $(".radio"+$("#buyCurrency").html()).show();
                $("#h4a").html("To Bank");
                $("#h4b").html("From Bank");
            }

        }).trigger("change");

        showLength("#comment","#commentMsg",100);
        window.blurAmt = function(){
            $("#amount").val($("#amountDouble").val());
        };
        $("#amountDouble").on("blur",function(){
            $t=$(this);
            $("#amount").val($t.val());
        }).trigger("blur");

       var $other = $("input[name='toBankId']").on("change",function(){
            $("#toBankName").val($(this).attr("bankname"));
            $("#toAccountName").val($(this).attr("accountname"));
            $("#toAccountNumber").val($(this).attr("accountno"));
        })
        $other.trigger("change");


        $("#form1").validationEngine().on("submit",function(){
//                if($("#c2").prop("checked")&&uoloaded){
//                alertM("至少上传一个文件",{cls:"cross"})
//                return false;
//            }
//            else{
                if($("#bank_info1").is(":hidden")){
                    alertM("Please select a from bank",{cls:"error"});
                    return false;
                }
                alertM.end("saveDelivery.action",$("#form1").serialize(),function(){
                    var pageNumber = $("#pageNumber").val();
                    window.location.href="/purchaseOrder/list.action";
                })
//            }
            return false;
        }).on("click",".delete_d",function(){
            $(this).parent().parent().remove();
        });

        var up= swfupload({
            bind: "#upfile",
            url: "/upload/uploadFileDoc.action?folderNameId=${module.code}",
            fileName: "file",
            //            type:/(.*)+\.(jpg|jpeg|gif|png)$/i,
            succ: function (data) {
                for(var i=0;i<data.length;i++){
                    var html = '<span class="file_up">';
                    if (data[i].type == "images")
                        html += '<span class="file_up_images" style="background-image:url(' + data[i].filePath  + ')" data-title="' + data[i].i_txt + '" data-src="' + data[i].filePath + '"></span>'
                    else
                        html += '<a class="file_up_txt" href="/upload/down.action?fileUrl=' + data[i].urlF +'&fileName='+ data[i].i_txt + '" target="_blank" data-icon="2"></a>'
                    $s.show().append(html + '<a class="remove" href="javascript:" data-fid="' + data[i].key + '">&times;</a><input type="text" class="file_txt" name="fileName' + data[i].key + '" value="' + data[i].i_txt + '"><input type="hidden" name="key" value="' + data[i].key + '"></span>')
                }
            }
        }),
            up_i=21124,
            $s = $("#f_upload_p").on("click", ".remove", function () {
                $(this).parent().remove();
                if(!$s.find(".file_up").length)
                    $s.hide()
            });
            piczoom("#f_upload_p",".file_up_images")
            if($s.find(".file_up").length)
                $s.show()

        $("#add_bank1").on("click",function(){
            var $dir = $("#direction").val();
            var curr ;
            if($dir==1){
                curr="${purchaseOrder.sellCurrency}"
                [#if purchaseOrder.purchaseType==2]
                curr="${purchaseOrder.midCurrency}"
                [/#if]

            }else{
                curr="${purchaseOrder.buyCurrency}"
            }
            alertM("bankList.action?currency="+curr,{
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

        window.getBank=function(i){
            var  $add_d= $("#bank_info1");
            alertM.end("/settleOrder/selectAccount.action","id="+i,function(data){
                $add_d.find(".bankId").val(i)
                $add_d.find(".bank_name").text(data.data.bankName)
                $add_d.find(".country").text(data.data.country)
                $add_d.find(".at_name").text(data.data.bank.accountName)
                $add_d.find(".at_no").text(data.data.bank.accountNo)
                if(data.data.availableBalance-0<0)
                    $add_d.find(".balance").text("-"+fixMoney(0-data.data.availableBalance))
                else
                    $add_d.find(".balance").text(fixMoney(data.data.availableBalance))

                $("#amount").val($("#amountDouble").val());
                $add_d.show();
            })
        }

//        $("#table_1").on("click",".td_down",function(){
//            $(this).parent().parent().toggleClass("tr_next_show")
//        })
    })
</script>
</body>
</html>
</html>
