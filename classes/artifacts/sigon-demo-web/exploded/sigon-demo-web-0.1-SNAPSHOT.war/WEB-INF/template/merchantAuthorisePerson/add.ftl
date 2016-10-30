<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2 id="h2"> </h2>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${merchantAuthorisePerson.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>LastName</label>
            <input type="text" id="lastName" name="lastName" value="${merchantAuthorisePerson.lastName}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Code</label>
            <input type="text" id="code" name="code" value="${merchantAuthorisePerson.code}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Role</label>
            <input type="text" id="role" name="role" value="${merchantAuthorisePerson.role}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Address</label>
            <input type="text" id="address" name="address" value="${merchantAuthorisePerson.address}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>FirstName</label>
            <input type="text" id="firstName" name="firstName" value="${merchantAuthorisePerson.firstName}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>PostalAddress</label>
            <input type="text" id="postalAddress" name="postalAddress" value="${merchantAuthorisePerson.postalAddress}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Nationality</label>
            <input type="text" id="nationality" name="nationality" value="${merchantAuthorisePerson.nationality}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>MobilePhone</label>
            <input type="text" id="mobilePhone" name="mobilePhone" value="${merchantAuthorisePerson.mobilePhone}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Dob</label>
            <input type="text" id="dob" onclick="WdatePicker()" class="Wdate" name="dob" value="[#if merchantAuthorisePerson.dob??]${merchantAuthorisePerson.dob?date}[/#if]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>PrimaryContact</label>
            <input type="text" id="primaryContact" name="primaryContact" value="${merchantAuthorisePerson.primaryContact}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>PhysicalAddress</label>
            <input type="text" id="physicalAddress" name="physicalAddress" value="${merchantAuthorisePerson.physicalAddress}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>MiddleName</label>
            <input type="text" id="middleName" name="middleName" value="${merchantAuthorisePerson.middleName}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>PreferredName</label>
            <input type="text" id="preferredName" name="preferredName" value="${merchantAuthorisePerson.preferredName}" data-v="validate[required,maxSize[20]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Email</label>
            <input type="text" id="email" name="email" value="${merchantAuthorisePerson.email}" data-v="validate[required,maxSize[20]]">
        </p>
        </div>

    <p>
        <Button type="submit" id="sbEdit" class="btn bg_blue">Submit</Button>
        <a href="javascript:" id="cancel" class="btn" onclick="go(-1)" >Cancel</a>
    </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                window.location.href="list.action";
            })
            return false

        })
        $("#h2").html("MerchantAuthorisePerson " + $("#action").val() == "save"?"Add":"Edit");
    })
</script>
</body>
</html>
