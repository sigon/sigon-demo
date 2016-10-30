<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
    <script src="/js_mrptrader/datepicker/wdatepicker.js" type="text/javascript"></script>
</head>
<body>
<h2 id="h2"> </h2>
<form id="editForm" method="post" class="form form_short_info" action="${action}.action">
    <input type="hidden" name="id"  id="id" value="${gateways.id}"/>
        <input  type="hidden" name="action"  id="action" value="${action}"/>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>Code</label>
                <input type="text" id="code" name="code"  onblur="this.value=$.trim(this.value)"  value="${gateways.code}" [#if action!="update"] data-v="validate[required,maxSize[4],custom[integer],ajax[check.action]]"[#else] readonly [/#if]>
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>Type</label>
                <select id="type" name="type" data-v="validate[required]">
                    <option value="" >Please select</option>
                [#list gatewayTypeEnum as item]
                    <option value="${item.code}" [#if item.code==gateways.type]selected[/#if]>${item.desc}</option>
                [/#list]
                </select>
            </p>
        </div>
        <div class="showtips showtips_1" style="display: none">
            <p class="f_1p">
            </p>
            <p class="f_1p">
                <label class="gray">首信的新网关添加后，需要沟通首信技术添加ip调用白名单和打开代付批次权限。</label>
            </p>
        </div>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>Name</label>
                <input type="text" id="name" name="name" value="${gateways.name}" data-v="validate[required,maxSize[50]]">
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>Feerate</label>
                <input type="text" id="feerate" name="feerateDouble" style="width: 230px;" value="${feerateDouble}"  data-v="validate[required,maxSize[11],custom[number]]">‰
            </p>
        </div>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>Version</label>
                <input type="text" id="version" name="version" value="${gateways.version}" data-v="validate[required,maxSize[20]]">
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>AccountCode</label>
                <input type="text" id="accountCode" name="accountCode" value="${gateways.accountCode}" data-v="validate[required,maxSize[20]]">
            </p>
        </div>
        <div class="showtips showtips_2" style="display: none">
            <p class="f_1p">

            </p>
            <p class="f_1p">
                <label class="gray">登录<a target="_blank" href="https://auth.gopay.com.cn/login?service=https://portal.gopay.com.cn/auth">国付宝</a>后,在基本信息中的商户ID</label>
            </p>
        </div>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>SecretKey</label>
                <input type="text" id="secretKey" name="secretKey" value="${gateways.secretKey}" data-v="validate[required,maxSize[40]]">
            </p>
            <p class="f_1p">
                <label class="f_info"><span id="VircardnoinSpan" data-icon="S" style="display: none;" ></span>Vircardnoin</label>
                <input type="text" id="vircardnoin" name="vircardnoin" value="${gateways.vircardnoin}" data-v="validate[maxSize[20]]">
            </p>
        </div>
    <div class="showtips showtips_2" style="display: none">
        <p class="f_1p">
            <label class="gray">登录<a target="_blank" href="https://auth.gopay.com.cn/login?service=https://portal.gopay.com.cn/auth">国付宝</a>后,在安全管理-设置商户识别码里的商户识别码</label>
        </p>
        <p class="f_1p">
            <label class="gray">登录<a target="_blank" href="https://auth.gopay.com.cn/login?service=https://portal.gopay.com.cn/auth">国付宝</a>后,在账户-我的账户下，账户列表中的账号</label>
        </p>
    </div>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>BankName</label>
                <select id="bankId" name="bankId" data-v="validate[required]">
                    <option value="">Please select</option>
                    [#list bankMap.keySet() as keyItem]
                        <option value="${keyItem}" [#if keyItem==gateways.bankId]selected[/#if]>${bankMap.get(keyItem)}</option>
                    [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"  ></span>Single Least</label>
                <input type="text" id="singleLeast" onblur="blurToMoney(this)" name="singleLeastDb" value="[@number m=100 num=gateways.singleLeast/]" data-v="validate[required,custom[number],maxSize[10]]">
            </p>
        </div>
        <div class="showtips showtips_3" style="display: none">
            <p class="f_2p">
                <label class="f_info"></span>params</label>
                <textarea type="text" id="params"  name="params"  data-v="validate[maxSize[200]]">${gateways.params}</textarea>
            </p>
            <p class="f_2p">
                <label class="gray" style="word-break: break-all">京东代付功能必填，passWord（加密密码），pri（加密证书），singKey（签名秘钥），customer_no（账户号），参数样例：{"passWord":"654321","pri":"cert.pfx","singKey":"360080004000784317abc","customer_no":"360080004000784317"}</label>
            </p>
        </div>
        <div>
            <p class="f_1p">
                <label class="f_info"><span data-icon="S"></span>Status</label>
            [#list priceCategoryEnum as item]
                <input type="radio" name="status" value="${item.index}" id="status${item.index}" data-v="validate[required]" [#if gateways.status==item.index||gateways.status==null]checked[/#if] > &nbsp;<label class="f_for" for="status${item.index}">${item.descEng}</label>
            [/#list]
            </p>
        </div>
            <p>
                <a href="javascript:history.go(-1)" id="cancel" class="btn" data-icon="p" >Cancel</a>
                <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Submit</Button>
            </p>
</form>
<script>
    seajs.use(["alert","validation"], function (alertM) {
        $("#singleLeast").trigger("blur");
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($("#action").val()+".action",$("#editForm").serialize(),function(){
                window.location.href="list.action";
            })
            return false

        });
        $("#type").on("change",function(){
            $("#VircardnoinSpan").hide();
            $("#vircardnoin").attr("data-v","validate[maxSize[20]]");
            $(".showtips").hide();
            if($(this).val()=="1"){
                $(".showtips_1").show();
            }else if($(this).val()=="2"){
                $(".showtips_2").show();
                $("#VircardnoinSpan").show();
                $("#vircardnoin").attr("data-v","validate[required,maxSize[20]]");
            }else if($(this).val()=="3"){
                $(".showtips_3").show();
            }
        })
        $("#type").trigger("change");
        $("#h2").html("Gateways " + ($("#action").val() == "save" ? "Add":"Edit"));
    })
</script>
</body>
</html>
