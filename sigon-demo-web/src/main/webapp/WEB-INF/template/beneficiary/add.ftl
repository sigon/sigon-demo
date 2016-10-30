<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
<h2>
[#if action=="add"]
    Add
[#else]
    Edit
[/#if] A Beneficiary</h2>
<form class="form form_short_info" id="form1">
    <input type="hidden" name="total" id="total" />
    <input type="hidden" name="id" value="${beneficiary.id}" />
    <input type="hidden" name="code" value="${merchantCode}" />
    <h3>Beneficiary details</h3>
    <div class="cf">
        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Save beneficiary as</label>
            <input type="text" name="name" data-v="validate[required,maxSize[50]]" value="${beneficiary.name}" class="txt"></p>
    </div>
    <div class="cf">
        <p class="f_1p"><label class="f_info">First name</label>
            <input type="text" name="firstName" data-v="validate[maxSize[50]]" value="${beneficiary.firstName}" class="txt"></p>
        <p class="f_1p"><label class="f_info">Last name</label>
            <input type="text" name="lastName" data-v="validate[maxSize[50]]" value="${beneficiary.lastName}" class="txt"></p>
    </div>
    <div class="cf">
        <p class="f_1p"><label class="f_info">Email address</label>
            <input type="text" name="email" data-v="validate[custom[email],maxSize[50]]" value="${beneficiary.email}" class="txt"></p>
        <p class="f_1p"><label class="f_info">Mobile telephone number</label>
            <select class="fl" name="phoneCode" id="phone_c" style="width:80px">
                [#list countryCodeEnum as code ]
                    <option value="${code.countryCode}" [#if beneficiary.mobilePhone?split(" ")[0]==code.countryCode]selected [/#if]>${code.countryCode}(${code.shortCode})</option>
                [/#list]
            </select>
            <input type="text" class="txt fr" name="phone" id="phone" onblur="this.value=this.value.replace(/^[0\s]*/,'')" value="${beneficiary.mobilePhone?split(" ")[1]}" style="width:345px" data-v="validate[custom[phoneNZD]]"></p>
    </div>
    <p class="cf"><label class="f_info"><span data-icon="S"></span>Upload identity documents</label>
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
    [#--<p id="f_upload_p" style="display: none">--]
        [#----]
    [#--</p>--]
    <p>
        <label for="" class="info"></label><span class="red">Only type is *.jpg,*.png,*.gif,*.txt,*.doc,*.xls,*.pdf,*.docx,*.xlsx</span>
    </p>
    <h3>Beneficiary bank accounts</h3>

        [#list accountList as account]
            <div class="accont_d">
                <input type="hidden" name="id${account_index+1}" value="${account.id}">
            [#if account.currency=="CNY"]
                <div class="cf">
                    <div class="f_1p">
                        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Currency</label>
                            <input type="text"  name="currency${account_index+1}" class="currency_d" readonly value="${account.currency}"/>
                            [#--<select name="currency${account_index+1}" class="currency_d">--]
                                [#--[#list currencyEnum as currency]--]
                                    [#--<option value="${currency.descEng}">${currency.descEng}</option>--]
                                [#--[/#list]--]
                            [#--</select>--]
                        </p>
                    </div>
                </div>
                <div class="cf">
                    <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Account name</label>
                        <input type="text" name="accountName${account_index+1}" value="${account.accountName}" data-v="validate[required,maxSize[50]]" class="txt">
                    </p>
                    <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Account number</label>
                        <input type="text" name="accountNumber${account_index+1}" value="${account.accountNumber}" data-v="validate[required,maxSize[50],custom[onlyNumber]]" class="txt">
                    </p>
                </div>
                <div class="cf">
                    <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Bank name</label>
                        <select class="bank_s1" name="bankName${account_index+1}" data-v="validate[required]">
                            <option value=''>请选择银行</option>
                            [#list bankList as bank]
                                <option value="${bank.code}" [#if account.bankName==bank.name]selected [/#if]>${bank.name}</option>
                            [/#list]
                        </select>
                    </p>
                    <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Province</label>
                        <select class="bank_s1" name="addrProvince${account_index+1}" data-v="validate[required]">
                            <option value=''>请选择省份</option>
                            [#list provinceMap.get(account_index).data as province]
                                <option value="${province}" [#if account.branchAddress?split("@@")[0]==province]selected [/#if]>${province}</option>
                            [/#list]
                        </select>
                    </p>
                </div>
                <div class="cf">
                    <p class="f_1p"><label class="f_info"><span data-icon="S"></span>City / Country</label>
                        <select class="bank_s1" name="addrCity${account_index+1}" data-v="validate[required]">
                            <option value=''>请选择城市</option>
                            [#list cityMap.get(account_index).data as city]
                                <option value="${city}" [#if account.branchAddress?split("@@")[1]==city]selected [/#if]>${city}</option>
                            [/#list]
                        </select>
                    </p>
                    <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Bank branch</label>
                        <select class="bank_s1" name="bankBranch${account_index+1}" data-v="validate[required,maxSize[100]]">
                            <option value=''>请选择分行</option>
                            [#list branchMap.get(account_index).data as branch]
                                <option value="${branch.code}" [#if account.unionCode==branch.code]selected [/#if]>${branch.bankName}</option>
                            [/#list]
                        </select>
                    </p>
                </div>
                <div class="cf">
                    <p class="f_1p"><label class="f_info"><span data-icon="S"></span>CNAPS code</label>
                        <input name="unionCode${account_index+1}" value="${account.unionCode}" type="text" readonly class="txt bank_s1">
                    </p>
                    <p class="f_1p"><label class="f_info">Reference</label>
                        <input name="reference${account_index+1}" value="${account.reference}" type="text" data-v="validate[maxSize[25]]" class="txt">
                    </p>
                </div>
                <div class="cf">
                    <p class="f_1p"><label class="f_info"><span data-icon="S"></span>National ID name</label>
                        <input name="idName${account_index+1}" value="${account.idName}" type="text" data-v="validate[required,custom[chinese],maxSize[40]]" class="txt">
                    </p>
                    <p class="f_1p"><label class="f_info"><span data-icon="S"></span>National ID number</label>
                        <input name="idNumber${account_index+1}" value="${account.idNumber}" type="text" data-v="validate[required,chinaId]" class="txt">
                    </p>
                </div>
            [#else]
                <div class="cf">
                    <div class="f_1p">
                        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Currency</label>
                            <input type="text"  name="currency${account_index+1}" class="currency_d" readonly value="${account.currency}"/>
                            [#--<select name="currency${account_index+1}" class="currency_d">--]
                                [#--[#list currencyEnum as currency]--]
                                    [#--<option value="${currency.descEng}">${currency.descEng}</option>--]
                                [#--[/#list]--]
                            [#--</select>--]
                        </p>
                        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Country</label>
                            <select name="country${account_index+1}">
                                [#list countryEnum as country]
                                    [#if country.code!=4]
                                        <option value="${country.code}" [#if account.country==country.code]selected [/#if] >${country.descEng}</option>
                                    [/#if]
                                [/#list]

                            </select>
                        </p>
                    </div>
                </div>
                <div class="cf">
                    <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Account name</label>
                        <input type="text" name="accountName${account_index+1}" value="${account.accountName}"  data-v="validate[required,maxSize[50]]" class="txt">
                    </p>
                    <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Account number</label>
                        <input type="text" name="accountNumber${account_index+1}" value="${account.accountNumber}" data-v="validate[required,maxSize[50],custom[onlyLetterNumber]]" class="txt">
                    </p>
                </div>
                <div class="cf">
                    <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Bank name</label>
                        <input type="text" name="bankName${account_index+1}" value="${account.bankName}" data-v="validate[required,maxSize[50]]" class="txt">
                    </p>
                    <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Swift code</label>
                        <input type="text" name="unionCode${account_index+1}" value="${account.unionCode}" data-v="validate[required,maxSize[20],custom[onlyLetterNumber]]" class="txt">
                    </p>
                </div>
                <div class="cf">
                    <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Bank branch</label>
                        <input type="text" name="bankBranch${account_index+1}" value="${account.bankBranch}" data-v="validate[required,maxSize[50]]" class="txt">
                    </p>
                    <p class="f_1p"><label class="f_info">Reference</label>
                        <input type="text" name="reference${account_index+1}" value="${account.reference}" data-v="validate[maxSize[25]]" class="txt">
                    </p>
                </div>
                <div class="cf">
                    <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Branch address</label>
                        <textarea name="branchAddress${account_index+1}"  data-v="validate[required,maxSize[200]]">${account.branchAddress}</textarea>
                    </p>
                    <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Beneficiary Address</label>
                        <textarea name="beneficiaryAddress${account_index+1}" data-v="validate[required,maxSize[200]]">${account.beneficiaryAddress}</textarea>
                    </p>
                </div>
            [/#if]
            <p class="cf">

                <label class="fl delete_d blue [#if editLength==1]d_none[/#if]" data-icon="d">Remove this bank account</label>

                <label for="fav${account_index+1}" class="fr">Make this the primary bank account?<input type="radio" name="isPrimary" class="input_fav" [#if account_index==0||account.isPrimary==1]checked [/#if] id="fav${account_index+1}" value="${account_index+1}"></label>
            </p>
            <hr>
            </div>
        [/#list]
    [#if action=="add"]
        <div class="accont_d">
        </div>
    [/#if]

    <p><label class="red" id="add_d" data-icon="a"><span>Add a bank account for this beneficiary</span></label></p>
    <div class="cf" style="margin:32px 0">
        <a href="javascript:window.history.back()" class="btn" data-icon="p">Cancel</a>
        <button class=" btn bg_blue" type="submit" data-icon="y">Save Beneficiary</button>

    </div>
</form>
<div id="NZD_f" style="display: none">
    <div class="cf">
        <div class="f_1p">
            <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Currency</label>
                <select name="currency_0" class="currency_d">
                    [#list currencyEnum as currency]
                        <option value="${currency.descEng}">${currency.descEng}</option>
                    [/#list]
                </select>
            </p>
            <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Country</label>
                <select name="country_0">
                    [#list countryEnum as country]
                        [#if country.code!=4]
                            <option value="${country.code}">${country.descEng}</option>
                        [/#if]
                    [/#list]

                </select>
            </p>
        </div>
    </div>
    <div class="cf">
        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Account name</label>
            <input type="text" name="accountName_0" data-v="validate[required,maxSize[50]]" class="txt">
        </p>
        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Account number</label>
            <input type="text" name="accountNumber_0" data-v="validate[required,maxSize[50],custom[onlyLetterNumber]]" class="txt">
        </p>
    </div>
    <div class="cf">
        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Bank name</label>
            <input type="text" name="bankName_0" data-v="validate[required,maxSize[50]]" class="txt">
        </p>
        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Swift code</label>
            <input type="text" name="unionCode_0" data-v="validate[required,maxSize[20],custom[onlyLetterNumber]]" class="txt">
        </p>
    </div>
    <div class="cf">
        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Bank branch</label>
            <input type="text" name="bankBranch_0" data-v="validate[required,maxSize[50]]" class="txt">
        </p>
        <p class="f_1p"><label class="f_info">Reference</label>
            <input type="text" name="reference_0" data-v="validate[maxSize[25]]" class="txt">
        </p>
    </div>
    <div class="cf">
        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Branch address</label>
            <textarea name="branchAddress_0" data-v="validate[required,maxSize[200]]"></textarea>
        </p>
        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Beneficiary Address</label>
            <textarea name="beneficiaryAddress_0" data-v="validate[required,maxSize[200]]"></textarea>
        </p>
    </div>
    <p class="cf">
        <label class="fl delete_d blue" data-icon="d">Remove this bank account</label>
        <label for="fav_0" class="fr">Make this the primary bank account?<input type="radio" name="isPrimary" class="input_fav" id="fav_0" value="_0"></label>
    </p>
    <hr>
</div>
<div id="CNY_f" style="display: none">
    <div class="cf">
        <div class="f_1p">
            <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Currency</label>
                <select name="currency_0" class="currency_d">
                    [#list currencyEnum as currency]
                        <option value="${currency.descEng}">${currency.descEng}</option>
                    [/#list]
                </select>
            </p>
        </div>
    </div>
    <div class="cf">
        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Account name</label>
            <input type="text" name="accountName_0" data-v="validate[required,maxSize[50]]" class="txt">
        </p>
        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Account number</label>
            <input type="text" name="accountNumber_0" data-v="validate[required,maxSize[50],custom[onlyNumber]]" class="txt">
        </p>
    </div>
    <div class="cf">
        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Bank name</label>
            <select class="bank_s1" name="bankName_0" data-v="validate[required]">
                <option value=''>请选择银行</option>
                [#list bankList as bank]
                    <option value="${bank.code}">${bank.name}</option>
                [/#list]
            </select>
        </p>
        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Province</label>
            <select class="bank_s1" name="addrProvince_0" data-v="validate[required]">
                <option value=''>请选择省份</option>
            </select>
        </p>
    </div>
    <div class="cf">
        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>City / Country</label>
            <select class="bank_s1" name="addrCity_0" data-v="validate[required]">
                <option value=''>请选择城市</option>
            </select>
        </p>
        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>Bank branch</label>
            <select class="bank_s1" name="bankBranch_0" data-v="validate[required]">
                <option value=''>请选择分行</option>
            </select>
        </p>
    </div>
    <div class="cf">
        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>CNAPS code</label>
            <input name="unionCode_0" type="text" readonly class="txt bank_s1">
        </p>
        <p class="f_1p"><label class="f_info">Reference</label>
            <input name="reference_0" type="text" data-v="validate[maxSize[25]]" class="txt">
        </p>
    </div>
    <div class="cf">
        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>National ID name</label>
            <input name="idName_0" type="text" data-v="validate[required,custom[chinese],maxSize[40]]" class="txt">
        </p>
        <p class="f_1p"><label class="f_info"><span data-icon="S"></span>National ID number</label>
            <input name="idNumber_0" type="text" data-v="validate[required,chinaId]" class="txt">
        </p>
    </div>
    <p class="cf">
        <label class="fl delete_d blue" data-icon="d">Remove this bank account</label>
        <label for="fav_0" class="fr">Make this the primary bank account?<input type="radio" name="isPrimary" class="input_fav" id="fav_0" value="_0"></label>
    </p>
    <hr>
</div>
<script>
    seajs.use(["alert","piczoom","upload","validation"],function(alertM,piczoom,swfupload){
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
        var form_length=("${editLength}"==null?0:"${editLength}"),
            $f=$("#form1").on("click",".delete_d",function(){
                    $(this).parent().parent().remove();
                    show_remove()
                }).validationEngine().on("submit",function(){
                    if($s.find("span").length<1)
                        alertM("Please upload at least ONE file",{cls:"error"})
                    else{
                        $("#total").val(form_length);
                        alertM.end("save.action",$f.serialize(),"list.action?code=${merchantCode}")
                    }
                    return false;
                }),
                NZD_f=$("#NZD_f").html(),
                CNY_f=$("#CNY_f").html(),
                select_bind=function(t){
                    var $s=$(t).find(".bank_s1")
                    $s.eq(0).on("change",function(){
//                            select_change($s.eq(1),this.name,this.value,"/jsonBankAccount/province.action")
                        $.ajax({
                            url: "/jsonBankAccount/province.action",
                            data: {
                                headBankCode:$(this).val()
                            }
                        }).done(function (data) {
                            var html = "<option value=''>请选择省份</option>";
                            if(data.status=="succ"){
                                for (var i = 0; i < data.data.length; i++) {
                                    var item = data.data[i];
                                    html += "<option value='" + item + "'>" + item + "</option>";
                                }
                                $s.eq(1).html(html)
                                $s.eq(2).html("<option value=''>请选择城市</option>")
                                $s.eq(3).html("<option value=''>请选择分行</option>")
                                $s.eq(4).val("")
                            }else{
                                $s.eq(1).html(html)
                                $s.eq(2).html("<option value=''>请选择城市</option>")
                                $s.eq(3).html("<option value=''>请选择分行</option>")
                                $s.eq(4).val("")
                            }
                        });
                    })
                    $s.eq(1).on("change",function(){
//                            select_change($s.eq(2),this.name,this.value,"/jsonBankAccount/city.action")
                        $.ajax({
                            url:"/jsonBankAccount/city.action",
                            dataType:"json",
                            method:"POST",
                            data:{
                                headBankCode:$s.eq(0).val(),
                                province:$(this).val()
                            }
                        }).done(function(data){
                            var html = "<option value=''>请选择城市</option>";
                            if(data.status=="0"){
                                for (var i = 0; i < data.data.length; i++) {
                                    var item = data.data[i];
                                    html += "<option value='" + item + "'>" + item + "</option>";
                                }
                                $s.eq(2).html(html)
                                $s.eq(3).html("<option value=''>请选择分行</option>")
                                $s.eq(4).val("")
                            }else if(data.status == "1"){
                                $s.eq(2).html(html)
                                $s.eq(3).html("<option value=''>请选择分行</option>")
                                $s.eq(4).val("")
                            }
                        });
                    })
                    $s.eq(2).on("change",function(){
//                            select_change($s.eq(3),this.name,this.value,"/jsonBankAccount/area.action")
                        $.ajax({
                            url:"/jsonBankAccount/area.action",
                            dataType:"json",
                            method:"POST",
                            data:{
                                headBankCode:$s.eq(0).val(),
                                province:$s.eq(1).val(),
                                city:$(this).val()
                            }
                        }).done(function(data){
                            var html = "<option value=''>请选择分行</option>";
//                                if(data.status=="0"){
                            for (var i = 0; i < data.data.length; i++) {
                                var item = data.data[i];
                                html += "<option value='" + item.code + "'>" + item.bankName + "</option>";
                            }
                                $s.eq(3).html(html);
                                $s.eq(4).val("")
                        });
                    })
                    $s.eq(3).on("change",function(){
                        $s.eq(4).val($(this).val())
                    })
                }
                html_change=function($t,type){
                    $t.html(type=="CNY"?CNY_f.replace(/_0/g,++form_length):NZD_f.replace(/_0/g,++form_length)).on("change",".currency_d",function(){
                        html_change($t,this.value)
                    }).find(".currency_d").val(type?type:"NZD");
                    if(type=="CNY"){
                        select_bind($t)
                    }
                    show_remove()
                },
                show_remove=function(){
                    var $t=$f.find(".accont_d"),
                            $r=$f.find(".input_fav")
                    if(!$r.filter(":checked").length)
                        $r.eq(0).prop("checked",true)
                    if($t.length==1)
                        $t.find(".delete_d").addClass("d_none")
                    else{
                        $f.find(".d_none").removeClass("d_none");
                    }
                },
                $add_d=$("#add_d").on("click",function(){
                    html_change($('<div class="accont_d"></div>').insertBefore($add_d))
                }).parent(),
                $phone=$("#phone"),
                $phone_c=$("#phone_c").on("change",function(){
                    if(this.value=="+64"){
                        $phone.attr("data-v","validate[custom[phoneNZD]]")
                }else if(this.value=="+86"){
                        $phone.attr("data-v","validate[custom[phoneCNY]]")
                }else{
                        $phone.attr("data-v","validate[custom[number],maxSize[20]]")
                    }
                }).trigger("change")


[#if action=="add"]
    html_change($(".accont_d"))
[#else]
    $(".accont_d").each(function(){
        select_bind(this)
    })
[/#if]

    });
</script>
</body>
</html>
