[#if configuration.skey??]
    [#assign method="update"]
    [#assign methodTitle="Update"]
[#else]
    [#assign method="save"]
    [#assign methodTitle="Add"]
[/#if]
[#assign title="Configuration ${methodTitle}"]
[#assign header="setting"]
[#assign nav="configurationList"]
<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
[#include "/include/header.ftl"]
[#include "/include/nav.ftl"]
    <h2 class="page_title">Configuration</h2>
    [#--[#include "/include/uploadExcel.ftl"]--]
    <form id="inputForm" method="post" class="form form_short_info" action="${method}.action">
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S" title="Required"></span> Key </label>
                <input type="text"  id="skey" name="skey" required  value="${configuration.skey?if_exists}" pattern=".{1,50}" placeholder="" [#if configuration.skey??]readonly class="gray"[/#if]/>
                <span class="gray">Max Length is 50. Not allowed to modify after save!</span>
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S" title="Required"></span> Value </label>
                <input type="text"  id="svalue" name="svalue" required  value="${configuration.svalue?if_exists}" pattern=".{1,100}" placeholder=""/>
                <span class="gray">Max Length is 100.</span>
            </p>
        </div>
        <div>
            <p class="f_1p">
                <label class="f_info">References</label>
                <input type="text" name="remark"  value="${configuration.remark?if_exists}" pattern=".{0,200}" placeholder=""/><span class="gray">Max Length is 200.</span>
            </p>
        </div>
        <p>
            <a id="succ_btn1" href="/configuration/list.action" class="btn" data-icon="p">Cancel</a>
            <button type="submit" class="btn bg_blue" data-icon="y">Submit</button>
        </p>
    </form>
    <script>
        seajs.use("alert",function(alertM){
            $("#inputForm").on("submit",function(){
                if($.trim($("#skey").val())==''){
                    alertM("Key is required!",{cls:"error"});
                    return false;
                }
                if($.trim($("#svalue").val())==''){
                    alertM("Value is required!",{cls:"error"});
                    return false;
                }
                $.ajax({
                    url:"${method}.action",
                    dataType:"json",
                    method:"post",
                    data:$("#inputForm").serialize()
                }).done(function(data){
                    alertM(data.msg,{cls:data.status,rf:function(){
                        if(data.status=="succ")
                           $("#succ_btn1")[0].click()
                    }})

                })
                return false;
            })
//            <!--
            $("#go").on("click",function(){
                window.location.href="list.action";
            })
//            -->

        })
    </script>
[#include "/include/footer.ftl"]
</body>
</html>