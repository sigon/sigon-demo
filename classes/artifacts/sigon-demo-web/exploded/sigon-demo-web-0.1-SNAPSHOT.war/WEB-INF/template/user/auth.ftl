[#assign title="Auth"]
[#assign header="user"]
[#assign nav="traderAuth"]
<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
[#if msg??]
    <script>
        seajs.use("alert",function(alertM){
            alertM("${msg}");
        });
    </script>
[/#if]
</head>
<body>
        <h2 class="page_title">Auth</h2>
        <form id="editForm"  action="updateAuth.action" class="form" method="post">
            <input type="hidden" name="userId" id="userId" value="${mrpuser.userId}"/>
            <menu>
            <div class="form">
            <p class="f_1p">
                <label class="f_info">User ID</label>
            ${mrpuser.userId}
            </p>

            <p class="f_1p">
                <label class="f_info">copy from</label>
                <select id="co-reg">
                [#list users as user]
                    [#if user.userId != "admin"]
                    <option value="${user.userId}" [#if mrpuser.accountName==user.accountName] selected="selected"[/#if]>${user.accountName}(${user.role})</option>
                    [/#if]
                [/#list]
                </select>
            </p>
            </div>
            </menu>
            [#if error??]
            <p class="red">
                [#if error==0]
                    Authority failure,retry later!
                [/#if]
                [#if error==-1]
                    user not exist!
                [/#if]
            </p>
            [/#if]
            <div class="table">
            [#list urlResources as c2]
                <fieldset class="mainfieldset"><legend><input type="checkbox" name="codes" value="${c2.code}" id="a${c2.code}" class="mainMenu" [#if c2.name=="Task"]checked[/#if] [#if c2.code=="01"]disabled checked[/#if]><label for="a${c2.code}" class=\"f_for\">${c2.name}</label></legend>
                    <input type="hidden" id="hid_name${c2.code}" value="${c2.name}">
                    [#list c2.children as c4]
                            [#assign h4="<input type=\"checkbox\" name=\"codes\" value=\"${c4.code}\" id=\"a${c4.code}\" class=\"secondMenu\" ${curChecked}><label for=\"a${c4.code}\" class=\"f_for\">${c4.name}</label>"]
                            <input type="hidden" id="hid_name${c4.id}" value="${c4.name}">
                            [#assign h4has=1]
                            [#list c4.children as c6]
                                    [#if h4has==1]
                                        [#assign h4="<fieldset><legend>${h4}</legend>"]
                                        [#assign h4has=0]
                                    [/#if]
                                    [#assign h4="${h4}<input type=\"checkbox\" name=\"codes\" class=\"leafMenu\" value=\"${c6.code}\" id=\"a${c6.code}\"><label for=\"a${c6.code}\" class=\"f_for\">${c6.name}</label>"]
                            [/#list]
                            [#if h4has==0]
                                [#assign h4="${h4}</fieldset>"]
                            [/#if]
                            ${h4}
                    [/#list]
                </fieldset>
            [/#list]
            </div>
            <br/><br/>
            <p class="fixed_b">
                <a href="/user/list.action" class="btn" data-icon="p">Cancel</a>
                <button type="submit" class="btn bg_blue" data-icon="y">Submit</button>
                <button type="reset" class="btn">Reset</button>

            </p>
        </form>
[#include "/include/footer.ftl"]
<script>
    seajs.use(["alert","validation"],function(alertM){
        $.ajax({
            dataType:"json",
            cache:false,
            data:"userId="+$("#userId").val(),
            url:"/auth/getallurls.action",
            success:function(data){
                if(data == null){
                    return;
                }
                for(var i= 0,l=data.length;i<l;i++){
                    $("#a"+data[i].code).prop("checked",true);
                };
                $(".mainfieldset").each(function(){
                    var $t=$(this);
                    $t.find(".secondMenu").on("change",function(){
                        if($(this).parent().is("legend")){
                            if($(this).prop("checked"))
                                $(this).parent().parent().find(".leafMenu").prop("disabled",false)
                            else
                                $(this).parent().parent().find(".leafMenu").prop("disabled",true)
                        }
                    });
                    $t.find(".mainMenu").on("change",function(){
                        if($(this).prop("checked"))
                            $t.find(".secondMenu").prop("disabled",false).trigger("change")
                        else{
                            $t.find(".secondMenu,.leafMenu").prop("disabled",true)
                        }
                    })
                    $t.find(".secondMenu").trigger("change");
                   $t.find(".mainMenu").trigger("change");

                })
            }
        });

        $("#co-reg").on("change",function(){
            var uid = $("#co-reg").val();
            $.ajax({
                dataType:"json",
                cache:false,
                data:"userId="+uid,
                url:"getallurls.action",
                success:function(data){
                    $("input").prop("checked",false);
                    if(data == null){
                        return;
                    }
                    $.each(data,function(i,ele){
                        $("#a"+ele.code).prop("checked",true);
                    });
                    $("fieldset").each(function(){
                        $(this).find("input").first().trigger("change");
                    })
                }
            });
        });

        $("#editForm").validationEngine().on("submit",function(){
            alertM.end("updateAuth.action",$("#editForm").serialize(),"/auth/auth.action")
            return false
        })

    })
</script>
</body>
</html>