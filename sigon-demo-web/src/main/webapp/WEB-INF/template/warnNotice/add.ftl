<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body class="iframe">
<form id="inputForm" method="post" class="form form_short_info" action="${method}.action">
    <input type="hidden" id="id" name="id" value="${warnNotice.id}">
    <input  type="hidden" name="action"  id="action" value="${method}"/>
            <p>
                <label class="f_info"> Email </label>
                <input type="text"  id="email" name="email"  value="${warnNotice.email}"  data-v="validate[custom[email],maxSize[50]]"/>
            </p>
            [#--<p class="f_1p">
                <label class="f_info"> Tel </label>
                <select name="addressEnum" id="addressEnum" class="f_short">
                    [#list addressEnum as item]
                        <option value="${item.countryCode}" [#if item.code==0]selected[/#if]>${item.countryCode}</option>
                    [/#list]
                </select>
                [#if warnNotice.tel!=null]
                    <input type="text"  id="phone" name="phone" value="${warnNotice.tel?substring(3)}" pattern=".{1,15}"/>
                    <span class="gray">Max Length is 15.</span>
                [#else ]
                    <input type="text"  id="phone" name="phone" value="${warnNotice.tel}" pattern=".{1,15}"/>
                    <span class="gray">Max Length is 15.</span>
                [/#if]
            </p>--]
            <p>
                <label class="f_info"  >Tel</label>
                [@phoneNum phoneNum=phoneNumParam  style="width:212px;margin: 0;"]
                    [#include "/include/phoneNum.ftl"]
                [/@phoneNum]
            </p>
    <p>
    <span class="red" id="tip" hidden>Email和Tel至少填一个</span>
        </p>
    <div>
            <p id="enum">
                <label class="f_info"><span data-icon="S" title="Required"></span>WarnType</label>
                <select name="warnType" id="warnType"  data-v="validate[required]">
                    <option value="">Please select</option>
                    <!--对枚举进行遍历-->
                    [#list warnTypeEnum as item]
                    <option value="${item.id}"  [#if warnNotice.warnType == item.id]selected[/#if]>${item.descEng}</option>
                    [/#list]
                </select>
            </p>
        </div>
    <!--提交和取消按钮-->
    <p >
        <a href="javascript:" id="cancel" class="btn" data-icon="p">Cancel</a>
        <button type="subNmit" class="btn bg_blue" data-icon="y">Submit</button>
    </p>

</form>
<script>
    seajs.use(["alert","validation"],function(alertM) {
        $("#email,#phoneNumParam").on("blur",function(){
            if($.trim($("#phoneNumParam").val())=="" && $.trim($("#email").val())==""){
                $("#tip").show()
                return false;
            }else {
                $("#tip").hide()
            }
        })
        $("#inputForm").validationEngine().on("submit",function(){
            if($.trim($("#phoneNumParam").val())=="" && $.trim($("#email").val())==""){
                $("#tip").show()
                return false;
            }
            alertM.end($("#action").val()+".action",$("#inputForm").serialize(),function(){
                window.parent.refresh(1)
            })
            return false

        })
        $("#cancel").on("click",function(){
            window.parent.refresh()
        })

    })

</script>
[#include "/include/footer.ftl"]
</body>
</html>