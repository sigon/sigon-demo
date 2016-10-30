<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body class="iframe">
<form id="addForm" method="post" class="form form_short_info">
        <input type="hidden" name="id"  id="id" value="${bankName.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S" ></span>Bank name</label>
            <input type="text" id="fullName" name="fullName" value="${bankName.fullName}" data-v="validate[required,maxSize[100]]">
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S" ></span>abbreviation</label>
            <input type="text" id="shortName" name="shortName" value="${bankName.shortName}"  data-v="validate[required,maxSize[15]],ajax[checkShortName.action?id=${bankName.id}]">
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"></span>Country</label>
            <select id="country" name="country" data-v="validate[required]" >
                <option value="" >Please select</option>
            [#list bankCountryList as item]
                <option  value="${item.name}" [#if item.name==bankName.country]selected[/#if]>${item.name}</option>
            [/#list]
                <option value="new" >Other</option>
            </select>
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S" ></span>Website</label>
            <input type="text" id="website" name="website" value="${bankName.website}" data-v="validate[required,maxSize[350]]">
        </p>
    </div>
    <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S" ></span>Online banking</label>
            <input type="text" id="internetBank" name="internetBank" value="${bankName.internetBank}" data-v="validate[required,maxSize[350]]">
        </p>
    </div>

    <p>
        <a href="javascript:" id="cancl" class="btn" data-icon="p">Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>
    </p>
</form>
<script>
    seajs.use(["alert","role","validation"], function (alertM,role) {

        $("#addForm").validationEngine().on("submit",function(){
            alertM.end("/bankName/"+$("#action").val()+".action",$("#addForm").serialize(),function(){
                window.parent.refresh(1)
            })
            return false;

        })

        $("#cancl").on("click",function(){
            window.parent.refresh()
        })

        role("#country","新增属地","mrp-country","属地");

    })
</script>
</body>
</html>