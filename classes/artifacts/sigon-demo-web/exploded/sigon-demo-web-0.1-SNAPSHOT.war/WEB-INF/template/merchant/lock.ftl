<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body class="iframe">
<form id="editForm" method="post" class="form " action="/merchant/doLock.action">
    <input type="hidden" name="lockState" value="1">
    <input type="hidden" id="code" name="code" value="${code}">
    <p>
        <label class="f_info"><span data-icon="S"  ></span>Lock For Trader</label>
        <textarea id="lockForTrader" name="lockForTrader" maxlength="100" data-v="validate[required]"></textarea>
        <br/>
        <span id="tip_lft"></span>
    </p>
    <p>
        <label class="f_info"><span data-icon="S"  ></span>Lock For Merchant</label>
        <textarea id="lockForMerchant" name="lockForMerchant" maxlength="100" data-v="validate[required]"></textarea>
        <br/>
        <span id="tip_lfm"></span>
    </p>
    <p>
        <a href="javascript:" id="cancel" class="btn" data-icon="p" >Cancel</a>
        <Button type="submit" id="sbEdit" class="btn bg_blue" data-icon="y">Lock</Button>

    </p>
</form>
<script>
    seajs.use(["alert", "validation"], function (alertM) {
        $("#editForm").validationEngine().on("submit",function(){
            alertM.end($(this).attr("action"),$("#editForm").serialize(),function(){
                window.parent.refresh(1);
            });
            return false

        });
        $("#cancel").on("click",function(){
            window.parent.refresh()
        });
        $("#lockForTrader").on("keyup",function(){
            if($("#lockForTrader").val().length<=100)
                $("#tip_lft").html('You have entered <span class="red">'+$("#lockForTrader").val().length+'</span> characters, <span class="red">'+(100-$("#lockForTrader").val().length)+'</span> spaces left.')
            else
                $("#tip_lft").html('You have entered more than <span class="red">'+($("#lockForTrader").val().length-100)+'</span>characters')
        }).trigger("keyup") ;
        $("#lockForMerchant").on("keyup",function(){
            if($("#lockForMerchant").val().length<=100)
                $("#tip_lfm").html('You have entered <span class="red">'+$("#lockForMerchant").val().length+'</span> characters, <span class="red">'+(100-$("#lockForMerchant").val().length)+'</span> spaces left.')
            else
                $("#tip_lfm").html('You have entered more than <span class="red">'+($("#lockForMerchant").val().length-100)+'</span>characters')
        }).trigger("keyup") ;
        window.parent.setAMCSS({"height":$("body").height()+32})
    })
</script>
</body>
</html>
