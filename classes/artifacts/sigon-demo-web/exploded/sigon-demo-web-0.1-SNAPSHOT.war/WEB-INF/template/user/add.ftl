<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
[#include "/include/head.ftl"]
</head>
<body>
<h2 >${title}</h2>
    <form id="submitForm" action="list.action" method="post" class="form form_short_info">
            <h4 >Basic Info</h4>
            <input id="oldId" type="hidden" name="oldId" value="${oldId}">
            <input id="adminId" type="hidden" value="${admin}">
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>User ID</label>
                <input id="userId" type="text" name="userId" value="${mrpUser.userId}" [#if oldId!=""]readonly[#else] onblur="this.value=$.trim(this.value)" data-v="validate[required,maxSize[20],custom[onlyLetterNumber],ajax[checkUserId.action]]"[/#if] >
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Account Name</label>
                <input id="accountName" type="text" name="accountName" value="${mrpUser.accountName}" data-v="validate[required,maxSize[20]]" onblur="this.value=$.trim(this.value)">
            </p>
        </div>
        <div>
        [#if oldId!=""]
            <p class="f_1p">
                <label for="passBox" class="f_info">Confirm To Change The Password <input id="passBox" type="checkbox" name="passBox" value="1" ></label>
            </p>
        [/#if]
            <p id="pass" class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Password</label>
                <input id="password" type="password" name="password" value="" data-v="validate[required,minSize[6],maxSize[32],custom[onlyLetterNumber]]" onblur="this.value=$.trim(this.value)">
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Branch</label>
                <select id="branch" name="branch" data-v="validate[required]" >
                    <option value="" >Please select</option>
                [#list branchList as item]
                    <option priceCategoryId="${item.priceCategoryId}" value="${item.id}" [#if item.id==mrpUser.branch]selected[/#if]>${item.name}</option>
                [/#list]
                </select>
            </p>
        </div>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Clearing Price</label>
                <select id="clearingPrice" name="clearingPrice" data-v="validate[required]" >
                    <option value="" >Please select</option>
                [#list priceCategoryList as item]
                    <option value="${item.id}" [#if item.id==mrpUser.clearingPrice]selected[/#if]>${item.name}</option>
                [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Role</label>
                <select id="role" name="role" data-v="validate[required]" >
                    <option value="" >Please select</option>
                    [#list rolesList as item]
                        <option value="${item.name}" [#if item.name==mrpUser.role]selected[/#if] >${item.name}</option>
                    [/#list]
                    <option value="new" >Custom</option>
                </select>
            </p>
        </div>
        <div>
            <p >
                <label class="f_info">Mobile Phone</label>
                [@phoneNum phoneNum=phoneNumParam  style="width: 212px;margin: 0;"]
                    [#include "/include/phoneNum.ftl"]
                [/@phoneNum]
            </p>
        </div>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Status</label>
                [#list priceCategoryEnum as item]
                    <input type="radio" name="status" value="${item.index}" [#if item.index==mrpUser.status]checked[/#if] id="status${item.index}"><label for="status${item.index}">${item.descEng}</label>&nbsp;&nbsp;
                [/#list]
            </p>
            <p class="f_1p">
                <br>
                <input type="checkbox" id="dataAuthority" name="dataAuthority" value="2" [#if mrpUser.dataAuthority=="2"]checked[/#if]>
                <label for="dataAuthority">Data Authority</label>
            </p>
        </div>
            <h4 >Email Setting</h4>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Email</label>
                <input id="email" type="text" name="email" value="${mrpUser.email}" data-v="validate[required,custom[email],maxSize[50]]">
            </p>

        </div>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Host</label>
                <input id="host" type="text" name="host" value="${mrpUser.host}" data-v="validate[required,maxSize[30]]">
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Port</label>
                <input id="port" type="text" name="port" value="${mrpUser.port}" data-v="validate[required,maxSize[5],custom[integer]]" >
            </p>
        </div>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Email User</label>
                <input id="emailUser" type="text" name="emailUser" value="${mrpUser.emailUser}" data-v="validate[required,custom[email],maxSize[50]]">
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Email Password</label>
                <input id="emailPassword" type="password" name="emailPassword" value="${mrpUser.emailPassword}"  data-v="validate[required,maxSize[30]]" >
            </p>
        </div>
            <p >
                <label class="f_info">Email Comment</label>
                <textarea id="emailComment" maxlength="300"  name="emailComment" data-v="validate[maxSize[300]]">${mrpUser.emailComment}</textarea><br>
                <span id="emailCommentMsg" class="red"></span>
            </p>
        <p>
            <a href="javascript:history.go(-1)" class="btn" data-icon="p">Cancel</a>
            <button id="searchForm" type="submit" class="btn bg_blue" data-icon="y">Submit</button>
        </p>
    </form>
<script>
    seajs.use(["alert","role","validation"],function(alertM,role){
        showLength("#emailComment","#emailCommentMsg",300);
        //修改密码 选择
        var $password = $("#password");
        var $passBox=$("#passBox");
        var $pass=$("#pass");
        if(document.getElementById("passBox")!=undefined){
            var $pf=$("#passBox").on("change",function(){
                if($passBox.prop("checked")){

                    $pass.show();
                    $pf.parent().parent().removeClass("f_1p")
                }else{
                    $pass.hide();
                    $password.val("");
                    $pf.parent().parent().addClass("f_1p")
                }
            })
            $pf.trigger("change");
        }
        //提交表单
        $form = $("#submitForm").validationEngine().on("submit",function(){
           alertM.end("save.action",$form.serialize(),function(){
               window.location.href = "/user/list.action";
           });
           return false;
        });
        //部门级联
        $("#branch").on("change",function(){
            if($(this).val()=="") {
                $("#clearingPrice").val("")
            }else{
                var obj=document.getElementById("branch");
                var clearingPrice = obj.options[obj.selectedIndex].getAttribute("priceCategoryId");
                $("#clearingPrice").val(clearingPrice);
                $("#clearingPrice").blur();
            }
        });

        role("#role");
    });
</script>
</body>
</html>