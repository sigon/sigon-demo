<div id="rightNav">
[@showMenu code="030203"]
    <a href="/basicInfo/edit.action?code=${code}" id="menuBasic">Basic</a>
[/@showMenu]

[@showMenu code="030204"]
    <a href="/basicInfo/authoriseList.action?code=${code}" id="menuAuthorise">Authorise Person</a>
[/@showMenu]

[@showMenu code="030205"]
    <a href="/basicInfo/gateway.action?code=${code}" id="menuGateway">Gateway</a>
[/@showMenu]

[@showMenu code="030206"]
    <a href="/merchantWallet/detail.action?code=${code}">Wallet</a>
[/@showMenu]

[@showMenu code="030207"]
    <a href="/merchantDoc/list.action?code=${code}" id="menuDoc">ID</a>
[/@showMenu]
[@showMenu code="030228"]
    <a href="/merchantOtherDoc/list.action?code=${code}" id="menuOtherDoc">Doc</a>
[/@showMenu]
[@showMenu code="030208"]
    <a href="/questionShow/edit.action?code=${code}" id="menuRisk">Risk Assessment</a>
[/@showMenu]
[@showMenu code="030209"]
    <a href="/beneficiary/list.action?code=${code}" id="menuBeneficiaries">Beneficiaries</a>
[/@showMenu]
[@showMenu code="030210"]
    [#if mbase.status == 1]
        <a href="/merchant/active.action?code=${code}" id="menuVerify">Active</a>
    [#elseif mbase.status == 3]
        <a href="/merchant/verify.action?code=${code}" id="menuVerify">Verify</a>
    [#else]
        <span>Verified</span>
    [/#if]
[/@showMenu]
[@showMenu code="030211"]
    <a href="/merchant/lock.action?code=${code}" id="menuLock">[#if mbase.lockState == 2]Lock[#else]Unlock[/#if]</a>
[/@showMenu]

[@showMenu code="030212"]
    <a href="/merchantLog/listLog.action?code=${code}" id="menuLog">Log</a>
[/@showMenu]

[@showMenu code="030213"]
    <a href="/merchantOutPut/list.action?merchantCode=${code}" id="menuOut">Connected Merchant</a>
[/@showMenu]
    <a href="/dailyPaymentMoney/merchantDaily.action?code=${code}" id="menuDaily">Daily Payment Limit</a>
</div>
<script>
    seajs.use(["alert"], function (alertM) {
        $("#menu${menu}").addClass("on");
    [#if mbase.status != 2]
        $("#menuVerify").on("click",function(){
            var title=$(this).html();
            alertM(this.href,{
                title:title,
                time:"y",
                width:400,
//                height:250,
                iframe:1
            })
            return false;
        });
    [/#if]
        $.ajax({
            url:"/basicInfo/hasTransfer.action",
            dataType:"text",
            data:{
                code:"${code}"
            }
        }).done(function(data){
            if(data != 1){
                $("#menuOut").remove();
            }
        });
        $("#menuLock").on("click",function(){
            var title="[#if mbase.lockState == 2]Lock[#else]Unlock[/#if]";
            alertM(this.href,{
                title:title,
                time:"y",
                width:400,
                iframe:1
            })
            return false;
        });
        window.refresh=function(t){
            if(t)
                window.location.reload()
            alertM.remove()
        }
    })
</script>