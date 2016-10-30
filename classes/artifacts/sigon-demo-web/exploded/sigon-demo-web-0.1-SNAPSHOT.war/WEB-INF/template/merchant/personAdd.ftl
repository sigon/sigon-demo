<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body class="iframe">
<form id="editForm" method="post" class="form form_short_info" action="/merchant/${action}.action">
    <input type="hidden" id="code" name="code" value="${code}">
    <input type="hidden" id="id" name="id" value="${merchantAuthorisePerson.id}">
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Role</label>
            <select id="role" name="role" data-v="validate[required]">
                <option value="">Please select</option>
            [#list rolesList as item]
                <option value="${item.name}" [#if merchantAuthorisePerson.role == item.name]selected[/#if] >${item.name}</option>
            [/#list]
                <option value="new" >Custom</option>
            </select>
        </p>

        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Title</label>
            <select id="title" name="title">
                [#list genderEnumList as item]
                    <option value="${item.id}" [#if merchantAuthorisePerson.title == item.id]selected[/#if]>${item.desc}</option>
                [/#list]
            </select>
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>First Name</label>
            <input type="text" id="firstName" name="firstName" value="${merchantAuthorisePerson.firstName}" data-v="validate[required,maxSize[25]]">
        </p>
        <p class="f_1p">
            <label class="f_info">Middle Name</label>
            <input type="text" id="middleName" name="middleName" value="${merchantAuthorisePerson.middleName}" data-v="validate[maxSize[25]]">
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Last Name</label>
            <input type="text" id="lastName" name="lastName" value="${merchantAuthorisePerson.lastName}" data-v="validate[required,maxSize[25]]">
        </p>
        <p class="f_1p">
            <label class="f_info">Preferred Name</label>
            <input type="text" id="preferredName" name="preferredName" value="${merchantAuthorisePerson.preferredName}" data-v="validate[maxSize[25]]">
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Nationality</label>
            <select id="nationality" name="nationality" data-v="validate[required]">
                <option value="">Please select</option>
                [#list countryEnumList as item]
                    <option value="${item.code}" [#if merchantAuthorisePerson.nationality == item.code]selected[/#if]>${item.desc}</option>
                [/#list]
            </select>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>DOB</label>
            <input type="text" id="dob" onclick="WdatePicker()" class="Wdate" name="dob" data-v="validate[required,custom[date]]" value="[#if merchantAuthorisePerson.dob??]${merchantAuthorisePerson.dob?date}[/#if]">
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Mobile Phone</label>
        [@phoneNum phoneNum=phoneNumParam  style="width: 212px;margin: 0;" required=true]
            [#include "/include/phoneNum.ftl"]
        [/@phoneNum]
        </p>
        <p class="f_1p">
            <label class="f_info">Email</label>
            <input type="text" id="email" name="email" value="${merchantAuthorisePerson.email}" data-v="validate[custom[email],maxSize[50]]">
        </p>
    </div>
    <p >
        <label class="f_info"><span data-icon="S"  ></span>Physical Address</label>
        <input type="text" id="physicalAddress" name="physicalAddress" value="${merchantAuthorisePerson.physicalAddress}" data-v="validate[required,maxSize[100]]">
    </p>
    <p >
        <label class="f_info">PostalAddress</label>
        <input type="text" id="postalAddress" name="postalAddress" value="${merchantAuthorisePerson.postalAddress}" data-v="validate[maxSize[100]]">
    </p>
    <p >
        <label class="f_info">Address</label>
        <input type="text" id="address" name="address" value="${merchantAuthorisePerson.address}" data-v="validate[maxSize[100]]">
    </p>
    <p >
        <label class="f_info">Other Contact</label>
    </p>
    [#list contactList as contact]
    <div>
        <p>
            <select id="contactTypes" name="contactTypes" style="width: 100px">
                [#list contactEnumList as item]
                    <option value="${item.code}" [#if contact.contactType == item.code]selected[/#if]>${item.desc}</option>
                [/#list]
            </select>
            <input type="text" name="contacts" style="width: 400px" data-v="validate[maxSize[25]]" value="${contact.contact}"><span></span>
            <a type="button" class="delete_d btn bg_red" data-icon="d">Remove</a>
        </p>
    </div>
    [/#list]
    <p>
        <a type="button" id="add_d" class="btn bg_green" data-icon="a">Add</a>
    </p>
    <div id="ad1" style="display: none;">
        <p class="f_2p" >
            <select id="contactTypes" name="contactTypes" style="width: 100px">
            [#list contactEnumList as item]
                <option value="${item.code}" >${item.desc}</option>
            [/#list]
            </select>
            <input type="text" name="contacts" style="width: 400px" data-v="validate[maxSize[25]]"><span></span>
            <a type="button" class="delete_d btn bg_red" data-icon="d">Remove</a>
        </p>
    </div>
    <p >
        <label class="f_info">Primary Contact</label>
        [#list whetherEnumList as item]
            &nbsp;&nbsp;<input type="radio" id="primaryContact${item.index}" name="primaryContact" value="${item.index}" [#if item.index == merchantAuthorisePerson.primaryContact || item.index==0]checked[/#if] >&nbsp;&nbsp;<label for="primaryContact${item.index}">${item.descEng}</label>
        [/#list]
    </p>
    <p>
        <a href="javascript:" id="cancel" class="btn" data-icon="p"  >Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>
    </p>
</form>
<script>
    seajs.use(["alert","role","validation"], function (alertM, role) {
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($(this).attr("action"),$("#editForm").serialize(),function(){
                window.parent.refresh(1);
            });
            return false

        }).on("click", ".delete_d", function(){
            $(this).parent().parent().remove();
        });

        var $add_d=$("#add_d").on("click",function(){
            $('<div >' + $("#ad1").html() + '</div>').insertBefore($add_d)
        }).parent();
        $("#cancel").on("click",function(){
            window.parent.refresh()
        });
        role("#role");
    })
</script>
</body>
</html>
