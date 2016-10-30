<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${merchantInfo.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>SanctionAlert</label>
            <input type="text" id="sanctionAlert" onclick="WdatePicker()" class="Wdate" name="sanctionAlert" value="[#if merchantInfo.sanctionAlert??]${merchantInfo.sanctionAlert?date}[/#if]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Code</label>
            <input type="text" id="code" name="code" value="${merchantInfo.code}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Occupation</label>
            <input type="text" id="occupation" name="occupation" value="${merchantInfo.occupation}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>NextChecklistDate</label>
            <input type="text" id="nextChecklistDate" onclick="WdatePicker()" class="Wdate" name="nextChecklistDate" value="[#if merchantInfo.nextChecklistDate??]${merchantInfo.nextChecklistDate?date}[/#if]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>RiskLevel</label>
            <input type="text" id="riskLevel" name="riskLevel" value="${merchantInfo.riskLevel}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>CompanyType</label>
            <input type="text" id="companyType" name="companyType" value="${merchantInfo.companyType}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BusinessName</label>
            <input type="text" id="businessName" name="businessName" value="${merchantInfo.businessName}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>BusinessNature</label>
            <input type="text" id="businessNature" name="businessNature" value="${merchantInfo.businessNature}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>SourceOfFunds</label>
            <input type="text" id="sourceOfFunds" name="sourceOfFunds" value="${merchantInfo.sourceOfFunds}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>RegistrationAddress</label>
            <input type="text" id="registrationAddress" name="registrationAddress" value="${merchantInfo.registrationAddress}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>OfficeAddress</label>
            <input type="text" id="officeAddress" name="officeAddress" value="${merchantInfo.officeAddress}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>SanctionCheck</label>
            <input type="text" id="sanctionCheck" onclick="WdatePicker()" class="Wdate" name="sanctionCheck" value="[#if merchantInfo.sanctionCheck??]${merchantInfo.sanctionCheck?date}[/#if]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>PreferedName</label>
            <input type="text" id="preferedName" name="preferedName" value="${merchantInfo.preferedName}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>ProfilePicture</label>
            <input type="text" id="profilePicture" name="profilePicture" value="${merchantInfo.profilePicture}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>TradeName</label>
            <input type="text" id="tradeName" name="tradeName" value="${merchantInfo.tradeName}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>PostalAddress</label>
            <input type="text" id="postalAddress" name="postalAddress" value="${merchantInfo.postalAddress}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>RegistNumber</label>
            <input type="text" id="registNumber" name="registNumber" value="${merchantInfo.registNumber}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>LockForTrader</label>
            <input type="text" id="lockForTrader" name="lockForTrader" value="${merchantInfo.lockForTrader}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>ChecklistCompletionDate</label>
            <input type="text" id="checklistCompletionDate" onclick="WdatePicker()" class="Wdate" name="checklistCompletionDate" value="[#if merchantInfo.checklistCompletionDate??]${merchantInfo.checklistCompletionDate?date}[/#if]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>IncorporationDate</label>
            <input type="text" id="incorporationDate" onclick="WdatePicker()" class="Wdate" name="incorporationDate" value="[#if merchantInfo.incorporationDate??]${merchantInfo.incorporationDate?date}[/#if]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>LockForMerchant</label>
            <input type="text" id="lockForMerchant" name="lockForMerchant" value="${merchantInfo.lockForMerchant}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>IncorporationCountry</label>
            <input type="text" id="incorporationCountry" name="incorporationCountry" value="${merchantInfo.incorporationCountry}" data-v="validate[required,maxSize[20]]">
            <span id="checkId"></span>
        </p>
        </div>

    <p>
        <Button type="submit" id="sbEdit" class="btn bg_blue">Submit</Button>
        <a href="javascript:" id="cancel" class="btn"  >Cancel</a>
    </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
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
