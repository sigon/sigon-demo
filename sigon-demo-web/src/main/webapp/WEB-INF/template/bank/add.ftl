<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2 >${title}</h2>
    <form id="submitForm" action="${method}.action" method="post" class="form form_short_info">
            <h4 >Basic Info</h4>
        <input type="hidden" name="id"  id="id" value="${bank.id}"/>
        <input type="hidden" name="method" id="method" value="${method}">
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Country</label>
                <select id="country" name="country" data-v="validate[required]" >
                    <option value="" >Please select</option>
                [#list bankCountryList as item]
                    <option  value="${item.name}" [#if item.name==bank.country]selected[/#if]>${item.name}</option>
                [/#list]
                    <option value="new" >Other</option>
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Bank</label>
                <select id="bankNameId" name="bankNameId" data-v="validate[required]" >
                    <option value="" >Please select</option>
                [#list bankNameList as item]
                    <option value="${item.id}" [#if item.id==bank.bankNameId]selected[/#if]>${item.shortName}</option>
                [/#list]
                </select>
            </p>
        </div>
        [#--currency&Balance--]
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Currency</label>
                <select id="currency" name="currency" data-v="validate[required]" [#if method=="update"]disabled[/#if] >
                    <option value="" >Please select</option>
                [#list currencyEnum as item]
                    <option value="${item.descEng}" [#if item.descEng==bank.currency]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>
            <p id="pass" class="f_1p">
                <label class="f_info">Balance</label>
                <input type="text" id="balanceDouble" name="balanceDouble"  value="[@number num = bank.balance][/@number]" data-v="validate[custom[number]]" readonly onblur="blurToMoney(this)" />
            </p>
        </div>
        [#--AccountNo&AccountName--]
        <div>
            <p id="pass" class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Account No</label>
                <input type="text" id="accountNo" name="accountNo" value="${bank.accountNo}" data-v="validate[required,custom[onlyLetterNumber],maxSize[50]]" />
            </p>
            <p id="pass" class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Account Name</label>
                <input type="text" id="accountName" name="accountName" value="${bank.accountName}" data-v="validate[required,maxSize[100]]" />
            </p>
        </div>
        [#--账号类型和Status--]
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Bank Type</label>
                [#if addAndBack]
                    <input type="hidden" id="accountType" name="accountType" value="3">
                    Provider
                [#else]
                <select id="accountType" name="accountType" data-v="validate[required]" >
                    <option value="" >Please select</option>
                [#list accountTypeEnum as item]
                    <option value="${item.code}" [#if item.code==bank.accountType||(bank.accountType==null&&item.code==1)]selected[/#if]>${item.desc}</option>
                [/#list]
                [/#if]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Status</label>
                [#list priceCategoryEnum as item]
                    <input type="radio" name="status" value="${item.index}" id="status${item.index}" data-v="validate[required]" [#if bank.status==item.index||bank.status==null]checked[/#if] > &nbsp;<label class="f_for" for="status${item.index}">${item.descEng}</label>
                [/#list]
            </p>

        </div>
        [#--联行号和KeyExpired和SwiftCode--]
        <div>
            <p class="f_1p">
                <span data-icon="S" class="red" id="numberTypeSpan"></span>
                <select id="numberType" style="width:278px;margin:0" name="numberType" data-v="validate[required]">
                    <option value="" >Please select</option>
                [#list numberTypeList as item]
                    <option value="${item.name}" [#if item.name==bank.numberType||(bank.numberType==null&&item.name=="CNAPS code")]selected[/#if]>${item.name}</option>
                [/#list]
                    <option value="new" >Other</option>
                </select>
                <input type="text" id="number" name="number" value="${bank.number}"  data-v="validate[required,custom[onlyLetterNumber],maxSize[20]]" />

            </p>
            [#if bank.keyExpired??]
                [#if c==true]
                <p class="f_1p red" id="keyTime" >
                    <label class="f_info"><span data-icon="S" id="keyExpired1Span"></span>Ukey Expiration Date</label>
                    <input type="text" id="keyExpired1" name="keyExpired" onClick="WdatePicker()"   data-v="validate[required,custom[date],future[now]]"
                           class="Wdate red"  [#if bank.keyExpired?if_exists] value="${bank.keyExpired?string("yyyy-MM-dd")}"[/#if] />
                </p>
                [#else]
                    <p class="f_1p" id="keyTime" >
                        <label class="f_info"><span data-icon="S" id="keyExpired2Span"></span>Ukey Expiration Date</label>
                        <input type="text" id="keyExpired2" name="keyExpired" onClick="WdatePicker()"   data-v="validate[required,custom[date],future[now]]"
                               class="Wdate"  [#if bank.keyExpired?if_exists] value="${bank.keyExpired?string("yyyy-MM-dd")}"[/#if]/>
                    </p>
                [/#if]
            [#else]
                <p class="f_1p" id="keyTime2">
                    <label class="f_info"><span data-icon="S" id="keyExpired3Span"></span>Ukey Expiration Date</label>
                    <input type="text" id="keyExpired3" name="keyExpired" onClick="WdatePicker()"   data-v="validate[required,custom[date],future[now]]"
                           class="Wdate" />
                </p>
            [/#if]
            <p id="swiftInput" class="f_1p"  >
                <label class="f_info"><span data-icon="S" id="swiftCodeSpan"></span>Swift Code</label>
                <input id="swiftCode" type="text" name="swiftCode" value="${bank.swiftCode}" data-v="validate[required,maxSize[15],custom[onlyLetterNumber]]"/>
            </p>
        </div>
        [#--Description--]
        <div>
            <p >
                <label class="f_info">Description</label>
                <input id="description" type="text" name="description" value="${bank.description}" data-v="validate[maxSize[100]]"/>
            </p>
        </div>
        [#--SMS DESC--]
        <div>
            <p >
                <label class="f_info"><span data-icon="S" id="smsDescSpan"></span>SMS Desc</label>
                <input id="smsDesc" type="text" name="smsDesc" value="${bank.smsDesc}" data-v="validate[required,maxSize[100]]" />
            </p>
        </div>
        [#--Branch--]
        <div>
            <p >
                <label class="f_info">Branch</label>
                <input id="branch" type="text" name="branch" value="${bank.branch}" data-v="validate[maxSize[100]]" />
            </p>
        </div>
        [#--Bank Address--]
        <div>
            <p id="bankAddressInput">
                <label class="f_info">Bank Address</label>
                <input id="bankAddress" type="text" name="bankAddress" value="${bank.bankAddress}" data-v="validate[maxSize[100]]"/>
            </p>
        </div>
        [#--Beneficiary Address--]
        <div>
            <p id="beneficiaryAddressInput">
                <label class="f_info">Beneficiary Address</label>
                <input id="beneficiaryAddress" type="text" name="beneficiaryAddress" value="${bank.beneficiaryAddress}" data-v="validate[maxSize[100]]"/>
            </p>
        </div>
        [#--Comment--]
        <div>
            <p >
                <label class="f_info">Comment</label>
                <textarea id="comment"  name="comment" maxlength="300">${bank.comment}</textarea>
                <span id="commentMsg" class="red"></span>
            </p>
        </div>
        <h4>Bank manager</h4>
        <div>
            <p class="f_1p">
                <label class="f_info">Name</label>
                <input id="name" type="text" name="name" value="${bank.name}" data-v="validate[maxSize[10]]" />
            </p>
            <p class="f_1p">
                <label class="f_info">Phone</label>
                <input id="phone" type="text" name="phone" value="${bank.phone}" data-v="validate[custom[onlyNumber],maxSize[20]]" />
            </p>
        </div>
        <div>
            <p class="f_1p">
                <label class="f_info">Mobile</label>
                <input id="mobile" type="text" name="mobile" value="${bank.mobile}" data-v="validate[custom[onlyNumber],maxSize[20]]" />
            </p>
            <p class="f_1p">
                <label class="f_info">Fax</label>
                <input id="fax" type="text" name="fax" value="${bank.fax}" data-v="validate[custom[onlyLetterNumber],maxSize[20]]" />
            </p>
        </div>
        <div>
            <p >
                <label class="f_info">Email</label>
                <input id="email" type="text" name="email" value="${bank.email}" data-v="validate[custom[email],maxSize[50]]" />
            </p>
        </div>

        <h4>Transactions Setting</h4>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Daily Limit</label>
                <input id="daily" type="text" name="daily" value="${bank.daily}" data-v="validate[required,custom[integer],min[0],max[999999999]]"/>
            </p>
            <p class="f_1p">
                <label class="f_info">临时调整备注</label>
                <input id="tempComment" type="text" name="tempComment" value="${bank.tempComment}" data-v="validate[maxSize[100]]"/>
            </p>
        </div>

        <div>
            ${strLevel}

        </div>
        <div>
            <p >
                <a id="cancel" href="javascript:" class="btn" data-icon="p">Cancel</a>
                <button id="searchForm" type="submit" class="btn bg_blue" data-icon="y">[#if addAndBack]Save&Back To Provider Add[#else]Save[/#if]</button>
            </p>
        </div>
    </form>
<script>
    seajs.use(["alert","role","validation"],function(alertM,role){
        showLength("#comment","#commentMsg",300);
        $(document).ready(function(){
            if($("#numberType").val()=="CNAPS code"){
                $("#swiftInput").hide();
                $("#bankAddressInput").hide();
                $("#beneficiaryAddressInput").hide();
                $("#keyTime").show();
                $("#keyTime2").show();
            }
            else{
                $("#swiftInput").show();
                $("#bankAddressInput").show();
                $("#beneficiaryAddressInput").show();
                $("#keyTime").hide();
                $("#keyTime2").hide();
            }
        })

        var $t = $("#accountType").on("change",function(){
            if( $(this).val()=="2"){
                $("#numberTypeSpan").hide();
                $("#numberType").attr("data-v","");
                $("#number").attr("data-v","validate[custom[onlyLetterNumber],maxSize[20]]");
                $("#swiftCodeSpan").hide();
                $("#swiftCode").attr("data-v","validate[maxSize[15],custom[onlyLetterNumber]]");
                $("#keyExpired1Span").hide();
                $("#keyExpired2Span").hide();
                $("#keyExpired3Span").hide();
                $("#keyExpired1").attr("data-v","validate[custom[date],future[now]]");
                $("#keyExpired2").attr("data-v","validate[custom[date],future[now]]");
                $("#keyExpired3").attr("data-v","validate[custom[date],future[now]]");
                $("#smsDescSpan").hide();
                $("#smsDesc").attr("data-v","validate[maxSize[100]]");
            }else {
                $("#numberTypeSpan").show();
                $("#numberType").attr("data-v","validate[required]");
                $("#number").attr("data-v","validate[required,custom[onlyLetterNumber],maxSize[20]]");
                $("#swiftCodeSpan").show();
                $("#swiftCode").attr("data-v","validate[required,maxSize[15],custom[onlyLetterNumber]]");
                $("#keyExpired1Span").show();
                $("#keyExpired2Span").show();
                $("#keyExpired3Span").show();
                $("#keyExpired1").attr("data-v","validate[required,custom[date],future[now]]");
                $("#keyExpired2").attr("data-v","validate[required,custom[date],future[now]]");
                $("#keyExpired3").attr("data-v","validate[required,custom[date],future[now]]");
                $("#smsDescSpan").show();
                $("#smsDesc").attr("data-v","validate[required,maxSize[100]]");
            }
        });
        $(function (){
            $t.trigger("change");
        })

        $("#cancel").on("click",function(){
            [#if backUrl]
                window.location.href = "${backUrl}";
            [#else]
                window.location.href = "/bank/list.action";
            [/#if]
        });

        $("#numberType").on("change",function(){
            if( $(this).val()=="CNAPS code"){
                $("#swiftInput").hide();
                $("#bankAddressInput").hide();
                $("#beneficiaryAddressInput").hide();
                $("#keyTime").show();
                $("#keyTime2").show();
            }else {
                $("#swiftInput").show();
                $("#bankAddressInput").show();
                $("#beneficiaryAddressInput").show();
                $("#keyTime").hide();
                $("#keyTime2").hide();
            }
        });


        $("#submitForm").validationEngine().on("submit",function(){
            alertM.end("/bank/"+$("#method").val()+".action",$("#submitForm").serialize(),function(){
                var addAndBack = "${addAndBack}";
                if(addAndBack != "") {
                    window.location.href = "${backUrl}";
                } else {
                    window.location.href = "/bank/list.action";
                }
            });
            return false;
        });
        role("#country","新增属地","mrp-country","属地");
        role("#numberType","New UnionCode","mrp-UnionCode","类型");
    });
</script>
</body>
</html>