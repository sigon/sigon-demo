<form id="editForm" method="post" class="form form_short_info" action="${action}">
    <input type="hidden" name="code" value="${code}">
    [#if hasStep]
    <div class="step">
        <a href="#" class="on">Step1 Merchant Profile</a>
        <a href="#">Step 2 Authorise Person</a>
        <a href="#">Step 3 Gateway Setting</a>
    </div>
    [/#if]
    <div>
    [#if isEdit]
        <p class="f_1p">
            <label class="f_info">Merchant Code</label>
        ${mbase.code}
        </p>
    [/#if]
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"></span><span data-icon="E" ></span>Merchant Type</label>
            [#if isEdit]
            ${merchantTypeEnumMap.get(mbase.merchantType).desc}
            <input type="hidden" id="merchantType" name="merchantType" value="${mbase.merchantType}">
            [#else]
                [#if addSame]
                    [#assign merchantType=mbase.merchantType]
                [#else]
                    [#assign merchantType=2]
                [/#if]
            <select id="merchantType" name="merchantType">
            [#list merchantTypeEnumList as item]
                <option value="${item.code}" [#if item.code=merchantType]selected[/#if]>${item.desc}</option>
            [/#list]
            </select>
            [/#if]
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"></span>System Type</label>
        [#if isEdit]
        ${systemTypeEnumMap.get(mbase.systemType).desc}
            <input type="hidden" id="systemType" name="systemType" value="${mbase.systemType}">
        [#else]
            [#if addSame]
                [#assign systemType=mbase.systemType]
            [#else]
                [#assign systemType=1]
            [/#if]
            <select id="systemType" name="systemType">
                [#list systemTypeEnumList as item]
                    <option value="${item.code}" [#if item.code=systemType]selected[/#if]>${item.desc}</option>
                [/#list]
            </select>
        [/#if]
        </p>
    </div>
    <div class="Company">
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span><span data-icon="E" ></span>Company Type</label>
            [#if isEdit || addSame]
                [#assign companyType=info.companyType]
            [#else]
                [#assign companyType=1]
            [/#if]
        [#list companyTypeEnumList as item]
            &nbsp;&nbsp;<input type="radio" id="companyType${item.code}" name="companyType" value="${item.code}" data-v="validate[required]" [#if item.code=companyType||item_index==0]checked[/#if]>&nbsp;&nbsp;<label for="companyType${item.code}">${item.desc}</label>
        [/#list]
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span><span data-icon="E" ></span>Business Name</label>
            <input type="text" id="businessName" name="businessName" value="${info.businessName}" data-v="validate[required,maxSize[50]]">
        </p>
    </div>
    <div class="Individual">
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Title</label>

            <select id="title" name="title">
            [#list genderEnumList as item]
                <option value="${item.id}" [#if info.companyType==item.id]selected[/#if]>${item.desc}</option>
            [/#list]
            </select>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span><span data-icon="E" ></span>First Name</label>
            <input type="text" id="firstName" name="firstName" value="${info.businessName}" data-v="validate[required,maxSize[50]]">
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="E" class="Company"></span><span class="Company">Trade Name</span><span class="Individual">Middle Name</span> </label>
            <input type="text" id="tradeName" name="tradeName" value="${info.tradeName}" data-v="validate[maxSize[25]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span><span data-icon="E" ></span><span class="Company">Registration Number</span><span class="Individual">Last Name</span> </label>
            <input type="text" id="registNumber" name="registNumber" value="${info.registNumber}" data-v="validate[required,maxSize[25]]">
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span><span data-icon="E" ></span><span class="Company">Incorporation Date</span><span class="Individual">DOB</span></label>
            <input type="text" id="incorporationDate" onclick="WdatePicker()" class="Wdate" name="incorporationDate" data-v="validate[required,custom[date]]" value="[#if info.incorporationDate??]${info.incorporationDate?date}[/#if]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span><span data-icon="E" ></span><span class="Company">Incorporation Country</span><span class="Individual">Nationality</span></label>
            <select id="incorporationCountry" name="incorporationCountry" data-v="validate[required]">
                <option value="">Please select</option>
            [#list countryEnumList as item]
                <option value="${item.code}" [#if info.incorporationCountry==item.code]selected[/#if]>${item.descEng}</option>
            [/#list]
            </select>
        </p>
    </div>
    <div class="Individual">
        <p class="f_1p">
            <label class="f_info">Preferred Name</label>
            <input type="text" id="preferedName" name="preferedName" value="${info.preferedName}" data-v="validate[maxSize[25]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span><span data-icon="E" ></span>Occupation</label>
            <input type="text" id="occupation" name="occupation" value="${info.occupation}"  data-v="validate[required,maxSize[25]]">
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span><span data-icon="E" ></span>Mobile Phone</label>
        [@phoneNum phoneNum=phoneNumParam  style="width: 212px;margin: 0;" required=true]
            [#include "/include/phoneNum.ftl"]
        [/@phoneNum]
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span><span data-icon="E" ></span>Email</label>
            [#if isEdit && mbase.status == 2]
                ${mbase.email}
            [#else]
                <input type="text" id="email" name="email" value="[#if !addSame]${mbase.email}[/#if]" data-v="validate[required,maxSize[50],custom[email],ajax[/merchant/email.action]]">
            [/#if]
        </p>
    </div>
    <p>
        <label class="f_info"><span data-icon="S"  ></span><span data-icon="E" ></span><span class="Company">Registration Address</span><span class="Individual">Physical Address</span> </label>
        <input type="text" id="registrationAddress" name="registrationAddress" value="${info.registrationAddress}" data-v="validate[required,maxSize[100]]">
    </p>

    <p class="Company">
        <label class="f_info"><span data-icon="S"></span>Office Address</label>
        <input type="text" id="officeAddress" name="officeAddress" value="${info.officeAddress}" data-v="validate[required,maxSize[100]]">
    </p>

    <p class="Individual">
        <label class="f_info">Other Contact</label>
        <textarea id="otherContact" name="otherContact" maxlength="100">${info.officeAddress}</textarea>
        <br/>
        <span id="tip_fy">You have entered <span class="red">0</span> characters,<span class="red">100</span> spaces left.</span>
    </p>
    <p>
        <label class="f_info">Postal Address</label>
        <input type="text" id="postalAddress" name="postalAddress" value="${info.postalAddress}" data-v="validate[maxSize[100]]">
    </p>
    <p class="Company">
        <label class="f_info"><span data-icon="S"  ></span><span data-icon="E" ></span>Business Nature</label>
        <input type="text" id="businessNature" name="businessNature" value="${info.businessNature}" data-v="validate[required,maxSize[50]]">
    </p>
    <div>
    <p>
        <label class="f_info">Profile Picture</label>
        <span id="uploadSpan">
        <input type="file" name="logofile" id="logofile">
        </span>
        <input type="hidden" id="profilePicture" name="profilePicture" value="${info.profilePicture}">
        <span id="logo_upload_p">[#if info.profilePicture != ""]<span class="file_up"><span class="file_up_images" style="background-image:url(${info.profilePicture})"  data-src="${info.profilePicture}"></span><a class="remove" href="javascript:" data-fid="26">×</a></span>[/#if]</span>
    </p>
    </div>
    [#list directorList as item]
        <div>
            <p class="f_1p">
                <label class="f_info">Director First Name:</label>
                <input type="text" name="directorFirstNames" data-v="validate[maxSize[25]]" value="${item.firstName}">
            </p>
            <p class="f_1p">
                <label class="f_info">Director Last Name:</label>
                <input type="text" style="width:200px;" name="directorLastNames" data-v="validate[maxSize[25]]" value="${item.lastName}"><span></span>
                <a type="button" class="delete_d btn bg_red" data-icon="d">Delete</a>
            </p>
        </div>
    [/#list]
    <div>
        <p class="f_1p">
            <a type="button" id="add_d" data-icon="a" class="btn bg_green">Add Director</a>
        </p>
    </div>
    <div id="ad1" style="display: none;">
        <p class="f_1p">
            <label class="f_info">Director First Name:</label>
            <input type="text" name="directorFirstNames" data-v="validate[maxSize[25]]">
        </p>
        <p class="f_1p">
            <label class="f_info">Director Last Name:</label>
            <input type="text" style="width:200px;" name="directorLastNames" data-v="validate[maxSize[25]]"><span></span>
            <a type="button" class="delete_d btn bg_red" data-icon="d">Delete</a>
        </p>
    </div>
    <hr>
    <div>
        <h4>Office Use Info</h4>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="E" ></span>Source of Funds</label>
            <input type="text" id="sourceOfFunds" name="sourceOfFunds" value="${info.sourceOfFunds}" data-v="validate[maxSize[25]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="E" ></span>Sanction Check</label>
            <input type="text" id="sanctionCheck" onclick="WdatePicker()" class="Wdate" name="sanctionCheck" data-v="validate[custom[date]]" value="[#if !addSame && info.sanctionCheck??]${info.sanctionCheck?date}[/#if]">
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="E" ></span>Sanction Alert</label>
            <input type="text" id="sanctionAlert" onclick="WdatePicker()" class="Wdate" name="sanctionAlert" data-v="validate[custom[date]]" value="[#if !addSame && info.sanctionAlert??]${info.sanctionAlert?date}[/#if]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="E" ></span>Checklist Completion Date</label>
            <input type="text" id="checklistCompletionDate" onclick="WdatePicker()" class="Wdate" name="checklistCompletionDate" data-v="validate[custom[date]]" value="[#if !addSame && info.checklistCompletionDate??]${info.checklistCompletionDate?date}[/#if]">
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="E" ></span>Next Checklist Date</label>
            <input type="text" id="nextChecklistDate" onclick="WdatePicker()" class="Wdate" name="nextChecklistDate" data-v="validate[custom[date]]" value="[#if !addSame && info.nextChecklistDate??]${info.nextChecklistDate?date}[/#if]">
        </p>
    [#if isEdit]
        [#assign blevel=mbase.level]
    [#elseif addSame]
        [#assign blevel=mbase.level]
    [#else]
        [#assign blevel=1]
    [/#if]
    [#if level == 2]
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Data</label>

            [#list dataLevelEnumList as item]
                &nbsp;&nbsp;<input type="radio" id="level${item.code}" name="level" value="${item.code}" [#if item.code==blevel]checked[/#if]>&nbsp;&nbsp;<label for="level${item.code}">${item.desc}</label>
            [/#list]
        </p>
    [#else]
        <input type="hidden" name="level" value="${blevel}">
    [/#if]
    </div>
    <p><label class="f_info">Risk Level</label>
    [#if riskLevelEnum??]
        <span style="color:${riskLevelEnum.color}">${riskLevelEnum.desc}:${riskScore}</span>
    [#else]
        Unspecified
    [/#if]
    </p>
    <p>
        <a href="javascript:" id="cancel" class="btn" data-icon="p"  >Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Save</Button>
    </p>
</form>
<script>
    seajs.use(["alert","upload","piczoom", "validation"], function (alertM, upload,piczoom) {
        $("#merchantType").on("change", function(){
            $(".Company").each(function(){
                $(this).hide();
            });
            $(".Individual").each(function (){
                $(this).hide();
            });
            if($(this).val() == 1){
                var c = "Individual";
                $("#addrUpload").html("<label class=\"f_info\" id=\"adddrUpload\"><span data-icon=\"S\"></span>"+"Physical address receipts"+"</label>")
            }else if($(this).val() == 2){
                var c = "Company";
                $("#addrUpload").html("<label class=\"f_info\" id=\"adddrUpload\"><span data-icon=\"S\"></span>"+"Office address receipts"+"</label>")
            }
            $("." + c).each(function (){
                $(this).show();
            });
        }).trigger("change");
        upload({
            bind: "#logofile",
            url: "/upload/uploadFileDoc.action?folderNameId=3",
            type: /(.*)+\.(jpg|jpeg|gif|png)$/i,
            multiple:0,
            fileName: "file",
            succ: function (d) {
                var data = d[0];
                var html = '<span class="file_up">';
                html += '<span class="file_up_images" style="background-image:url(' + data.filePath + ')" data-title="' + data.i_txt + '" data-src="' + data.filePath + '"></span>';
                html += '<a class="remove" href="javascript:" data-fid="26">×</a>';
                html += '</span>';
                $("#profilePicture").val(data.urlO);
                $("#logo_upload_p").show().html(html);
                piczoom("#logo_upload_p",".file_up_images");
                $("#uploadSpan").hide();
            }
        });

        $("#logo_upload_p").on("click", ".remove", function () {
            $(this).parent().remove();
            $("#profilePicture").val("");
            $("#uploadSpan").show();
        });

        $("#editForm").validationEngine().on("submit",function(){
            if($.find("span").length<1){
                alertM("Please upload at least ONE file",{cls:"error"})
                return false;
            }

            var firstNames = new Array();
            var lastNames = new Array();
            $("input[name='directorFirstNames']").each(
                    function(){
                        firstNames.push($(this).val());
                    }
            );

            $("input[name='directorLastNames']").each(
                    function(){
                        lastNames.push($(this).val());
                    }
            );
            for(var i=0; i<firstNames.length ; i ++){
                if((firstNames[i] == "") != (lastNames[i] == "") ){
                    alertM("Director First Name or Director Last Name has null value")
                    return false;
                }
            }
            alertM.end($(this).attr("action"), $("#editForm").serialize(),callback);
            return false

        }).on("click", ".delete_d", function(){
            $(this).parent().parent().remove();
        });

        var $add_d=$("#add_d").on("click",function(){
            $('<div >' + $("#ad1").html() + '</div>').insertBefore($add_d.parent())
        }).parent();

        $("#cancel").on("click",function(){
            [#if backUrl]
                window.location.href="${backUrl}";
            [#else]
                window.location.href="/merchantView/list.action";
            [/#if]

        });
[#if info.profilePicture != ""]
        piczoom("#logo_upload_p",".file_up_images");
        $("#uploadSpan").hide();
[/#if]
        $("#otherContact").on("keyup",function(){
            if($("#otherContact").val().length<=100)
                $("#tip_fy").html('You have entered <span class="red">'+$("#otherContact").val().length+'</span> characters, <span class="red">'+(100-$("#otherContact").val().length)+'</span> spaces left.')
            else
                $("#tip_fy").html('You have entered more than <span class="red">'+($("#otherContact").val().length-100)+'</span>characters')
        }).trigger("keyup") ;


    })




</script>