<form id="editForm" method="post" class="form form_short_info" action="/merchant/gatewaySave.action">
    <input  type="hidden" name="code"  id="code" value="${code}"/>
    <input type="hidden" name="init" value="${init}">
    [#if hasStep]
    <div class="step">
        <a href="">Step1 Merchant Profile</a>
        <a href="">Step 2 Authorise Person</a>
        <a href="" class="on">Step 3 Gateway Setting</a>
    </div>
    [/#if]
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S" ></span><span data-icon="E" ></span>Payment Gateway</label>
            <select id="gatewayId" name="gatewayId" data-v="validate[required]">
                <option value="">Please Select</option>
            [#list gatewayList as item]
                <option value="${item.code}" [#if item.code==gateway.gatewayId]selected[/#if]>${gatewayEnum.get(item.type).desc} - ${item.name} (${item.accountCode})</option>
            [/#list]
            </select>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="E" ></span>API currency</label>
            [#if init=="true"]
            <select id="apiCurrency" name="apiCurrency">
            [#list currencyEnumList as item]
                <option value="${item.descEng}" [#if item.descEng=="USD"]selected[/#if]>${item.descEng}</option>
            [/#list]
            </select>
            [#else]
            ${gateway.apiCurrency}
            <input type="hidden" name="apiCurrency" value="${gateway.apiCurrency}">
            [/#if]
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="E" ></span>Service charge rate</label>
            <input type="text" id="feeRate" name="feeRate" value="[@number num=gateway.feeRate m=10 formatStr="0" s=false/]" data-v="validate[custom[integer],min[0],maxSize[20],max[1000]]" style="width: 200px">‰
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="E" ></span>Merchant Key</label>
            <input type="text" id="signKey" name="signKey" value="${gateway.signKey}" data-v="validate[custom[onlyLetterNumber],maxSize[40]]">
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="E" ></span>Settlement Date</label>
            <input type="text" id="settlementDate" name="settlementDate" value="${gateway.settlementDate}" data-v="validate[custom[integer],min[0],maxSize[4]]">
        </p>
        <p class="f_1p">
            <label class="f_info">CNY payment?</label>
        [#list whetherEnumList as item]
            &nbsp;&nbsp;<input type="radio" name="isCny" id="isCny${item.index}" value="${item.index}" [#if item.index==gateway.isCny]checked[/#if]>&nbsp;&nbsp;<label for="isCny${item.index}">${item.descEng}</label>
        [/#list]
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info">Merchant transfer</label>
        [#list whetherEnumList as item]
            &nbsp;&nbsp;<input type="radio" name="isTransfer" id="isTransfer${item.index}" value="${item.index}" [#if item.index==gateway.isTransfer]checked[/#if]>&nbsp;&nbsp;<label for="isTransfer${item.index}">${item.descEng}</label>
        [/#list]
        </p>
        <p class="f_1p">
            <label class="f_info">Come from agent?</label>
        [#list whetherEnumList as item]
            &nbsp;&nbsp;<input type="radio" name="isProxy" id="isProxy${item.index}" value="${item.index}" [#if item.index==gateway.isProxy]checked[/#if]>&nbsp;&nbsp;<label for="isProxy${item.index}">${item.descEng}</label>
        [/#list]
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="E" ></span>Bond percentage</label>
            <input type="text" id="bondRate" name="bondRate" value="[@number num=gateway.bondRate m=10 formatStr="0" s=false/]" data-v="validate[custom[integer],min[0],maxSize[20],max[1000]]" style="width: 200px">‰
        </p>
        <p class="f_1p">
            <label class="f_info">Initial bond amount</label>
            <span id="initBondCurrency">${gateway.apiCurrency}</span>&nbsp;&nbsp;<input type="text" id="initBondAmount" name="initBondAmount" style="width: 200px" value="[#if gateway.initBondAmount??]${gateway.initBondAmount / 100}[/#if]" data-v="validate[custom[integer],min[0],max[10000000],maxSize[11]]">
        </p>
    </div>
    <div>
        <p class="f_2p">
            <label class="f_info">Bond period</label>
        [#list periodEnumList as item]
            &nbsp;&nbsp;<input type="radio" name="bondDate" id="bondDate${item.code}" value="${item.code}" [#if item.code==gateway.bondDate]checked[/#if]>&nbsp;&nbsp;<label for="bondDate${item.code}">${item.desc}</label>
        [/#list]
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info">Display exchange rate</label>
        [#list whetherEnumList as item]
            &nbsp;&nbsp;<input type="radio" name="isCurrency" id="isCurrency${item.index}" value="${item.index}" [#if item.index==gateway.isCurrency]checked[/#if]>&nbsp;&nbsp;<label for="isCurrency${item.index}">${item.descEng}</label>
        [/#list]
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="E" ></span>Language</label>
        [#list languageEnumList as item]
            &nbsp;&nbsp;<input  type="radio" name="language" id="language${item.lang}" value="${item.lang}" [#if item.lang ==gateway.language]checked[/#if]>&nbsp;&nbsp;<label for="language${item.lang}">${item.desc}</label>
        [/#list]
        </p>

    </div>
    <div>
        <p class="f_2p">
            <a href="javascript:" id="cancel" class="btn" data-icon="p" >Cancel</a>

            [#--[@showMenu code="030233"]--]
            [#--<a href="javascript:" id="sendEmail" class="btn bg_green" data-icon="y">Send Account Email</a>--]
            [#--[/@showMenu]--]
            <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>
        </p>
    </div>

</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        $("#apiCurrency").on("change", function(){
            $("#initBondCurrency").html($(this).val());
        }).trigger("change");
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($(this).attr("action"),$("#editForm").serialize(),callback);
            return false
        });
        $("#cancel").on("click",function(){
            window.location.href = "/merchantView/list.action";
        })

        $("#sendEmail").on("click",function(){
            if($('#editForm').validationEngine('validate'))
                alertM('We will send to this email <input placeholder="not blank" type="text" id="sendMail" data-v="validate[required,custom[email],maxSize[50]]" value="${mbase.email}"> an account email, please check the email address is correct.',{
                    time:"y",
                    title:"Send Email",
                    btns:[
                        {
                            txt:"Send",
                            cls:"bg_blue",
                            func:function(){
                                $("#sendMail").on("keyup",function(){
                                   var $t=$(this);
                                    $t.removeClass("v_error");
                                    $t.next().html("");
                                })
                                if($('#sendMail').validationEngine('validate')){
                                    alertM.end("/merchant/gatewaySave.action?email="+$("#sendMail").val(),$("#editForm").serialize(),"")
                                }
                                return false;
                            }
                        },
                        {
                            txt:"Cancel",
                        }
                    ]
                })
                return false;
        })

    })
</script>