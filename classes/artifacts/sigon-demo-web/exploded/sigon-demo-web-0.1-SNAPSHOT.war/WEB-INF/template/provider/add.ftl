<!DOCTYPE html>
<html>
<head>
    [#if action == "update"]
        [#assign isEdit=true]
    [#else]
        [#assign isEdit=false]
    [/#if]

[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2 >${title}</h2>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <h4 >Basic Info</h4>
    <input type="hidden" name="id"  id="id" value="${provider.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Name</label>
        [#if isEdit]
            ${provider.name}
        [#else]
            <input type="text" id="name" name="name" value="${provider.name}" data-v="validate[required,maxSize[25][#if action=="save"],ajax[/provider/same.action][/#if]]">
        [/#if]
        </p>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"  ></span>Abbreviation</label>
        [#if isEdit]
            ${provider.abbreviation}
        [#else]
            <input type="text" id="abbreviation" name="abbreviation" value="${provider.abbreviation}" data-v="validate[required,maxSize[10][#if action=="save"],ajax[/provider/same.action][/#if]]">
        [/#if]
        </p>
        </div>
        <p class="f_1p">
            <label class="f_info"><span data-icon="S"></span>Status</label>
        [#list priceCategoryEnum as item]
            <input type="radio" name="status" value="${item.index}" id="status${item.index}" data-v="validate[required]" [#if provider.status==item.index||provider.status==null]checked[/#if] > &nbsp;<label class="f_for" for="status${item.index}">${item.descEng}</label>
        [/#list]
        </p>
        <div>
        <p id="p3" class="f_2p"><label class="f_info">Bank</label>
            <select id="s3" style="width:212px" >
            [#list bankList as item]
                <option value="${item.id}">${item.name}</option>
            [/#list]
            </select>
            <a href="javascript:" class="btn bg_green" title="Select" id="select_s">Select</a>
    [@showMenu code ="050201"]
            <a href="/bank/add.action?type=addAndBack&backUrl=[#if action=="save"]/provider/add.action[#else]/provider/edit.action?id=${provider.id}[/#if]" class="btn bg_green" title="Add" id="add_s">New Bank</a>
    [/@showMenu]
        [#if action=="update"]
            [#list bankMap.keySet() as keyItem]
                <span class="tag bg_green">
                        <input id="tag_${keyItem}" type="hidden" name="bankIds" value="${keyItem}">
                ${bankMap.get(keyItem)}
                        <a class="remove" href="javascript:">×</a>
                    </span>
            [/#list]
        [/#if]
        </p>
        </div>
        <h4>Manager Info</h4>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>Manager</label>
            [#if isEdit]
                ${provider.manager}
            [#else]
                <input type="text" id="manager" name="manager" value="${provider.manager}" data-v="validate[required,maxSize[25][#if action=="save"],ajax[/provider/same.action][/#if]]">
            [/#if]
            </p>
            <p class="f_1p">
                <label class="f_info">Mobile Phone</label>
                <select id="mobileCodeParam" name="mobileCodeParam" class="f_short" >
                [#list addressCountryEnum as item]
                    <option value="${item.countryCode}" [#if item.countryCode==mobileNumParam.mobileCodeParam]selected[/#if] >${item.countryCode}</option>
                [/#list]
                    <option value="Other" [#if "Other"==mobileNumParam.mobileCodeParam]selected[/#if] >Other</option>
                </select>
                    <input id="mobileNumParam" style="width: 212px;margin: 0;" type="text" name="mobileNumParam" value="${mobileNumParam.mobileNumParam}" onblur="this.value=$.trim(this.value.replace(/^[0\s]*/,''))" maxlength="25" >
            </p>
        </div>
        <div>
            <p class="f_1p">
                <label class="f_info">Phone</label>
                <select id="phoneCodeParam" name="phoneCodeParam" class="f_short" >
                [#list addressCountryEnum as item]
                    <option value="${item.countryCode}" [#if item.countryCode==phoneNumParam.phoneCodeParam]selected[/#if] >${item.countryCode}</option>
                [/#list]
                    <option value="Other" [#if "Other"==phoneNumParam.phoneCodeParam]selected[/#if] >Other</option>
                </select>
                <input id="phoneNumParam" style="width: 212px;margin: 0;" type="text" name="phoneNumParam" value="${phoneNumParam.phoneNumParam}" onblur="this.value=$.trim(this.value.replace(/^[0\s]*/,''))" maxlength="25" data-v="validate[maxSize[25],groupRequired[phoneGroup]]">
            </p>
            <p class="f_1p">
                <label class="f_info">Fax</label>
                <select id="faxCodeParam" name="faxCodeParam" class="f_short" >
                [#list addressCountryEnum as item]
                    <option value="${item.countryCode}" [#if item.countryCode==faxNumParam.faxCodeParam]selected[/#if] >${item.countryCode}</option>
                [/#list]
                    <option value="Other" [#if "Other"==faxNumParam.faxCodeParam]selected[/#if] >Other</option>
                </select>
                <input id="faxNumParam" style="width: 212px;margin: 0;" type="text" name="faxNumParam" value="${faxNumParam.faxNumParam}" onblur="this.value=$.trim(this.value.replace(/^[0\s]*/,''))" maxlength="25" data-v="validate[maxSize[25]]">
            </p>
        </div>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>Email</label>
                <input type="text" id="email" name="email" value="${provider.email}" data-v="validate[required,custom[email],maxSize[50]]">
            </p>
        [#if isEdit]
            [#assign blevel=provider.data]
        [#else]
            [#assign blevel=1]
        [/#if]
        [#if level == 2]
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>Data</label>
                [#list dataLevelEnumList as item]
                    &nbsp;&nbsp;<input type="radio" id="level${item.code}" name="data" value="${item.code}" [#if item.code==blevel]checked[/#if]>&nbsp;&nbsp;<label for="level${item.code}">${item.desc}</label>
                [/#list]
            </p>
        [#else]
            <input type="hidden" name="level" value="${blevel}">
        [/#if]
        </div>
        <div>
        <p class="f_2p">
            <label class="f_info">Comment</label>
            <textarea id="comment" name="comment" data-v="validate[maxSize[100]]" maxlength="100">${provider.comment}</textarea> <br>
            <span id="commentMsg" class="red"></span>
        </p>
        </div>
        <p>
            <a href="javascript:" id="cancel" class="btn" data-icon="p">Cancel</a>
            <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>
        </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        showLength("#comment", "#commentMsg", 100);
        var $mobileCodeParam = $("#mobileCodeParam");
        var $mobileNumParam = $("#mobileNumParam");
        if ($mobileCodeParam.val() == "+64") {
            $mobileNumParam.attr("data-v", "validate[[#if required]required,[/#if]custom[phoneNZD],groupRequired[phoneGroup]]")
        } else if ($mobileCodeParam.val() == "+86") {
            $mobileNumParam.attr("data-v", "validate[[#if required]required,[/#if]custom[phoneCNY],groupRequired[phoneGroup]]")
        } else {
            $mobileNumParam.attr("data-v", "validate[[#if required]required,[/#if]custom[number],groupRequired[phoneGroup],maxSize[25]]")
        }
        $mobileCodeParam.on("change",function(e,v){
            if($mobileCodeParam.val()=="+64")
                $mobileNumParam.attr("data-v","validate[[#if required]required,[/#if]custom[phoneNZD],groupRequired[phoneGroup]]")
            else if($mobileCodeParam.val()=="+86")
                $mobileNumParam.attr("data-v","validate[[#if required]required,[/#if]custom[phoneCNY],groupRequired[phoneGroup]]")
            else
                $mobileNumParam.attr("data-v", "validate[[#if required]required,[/#if]custom[number],groupRequired[phoneGroup],maxSize[25]]")
            $mobileNumParam.trigger("blur")
        })

        $("#mobileNumParam").on("blur",function(){
            $("#phoneNumParam").trigger("blur");
        })

        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),"list.action")
            return false

        })

        $("#cancel").on("click",function(){
            window.location.href="/provider/list.action";
        })

        $s3=$("#s3"),
                $p3=$("#p3")

        $("#select_s").on("click",function(){
            if(!$("#tag_"+$s3.val()).length && $s3.val().length != 0)
                $p3.append('<span class="tag bg_green"><input type="hidden" id="tag_'+$s3.val()+'" name="bankIds" value="'+$s3.val()+'">'+$s3.find(":selected").html()+'<a class="remove" href="javascript:">×</a></span>')
        })

        $("#p3").on("click",".remove",function(){
            $(this).parent().remove()
        })

    })
</script>
</body>
</html>
