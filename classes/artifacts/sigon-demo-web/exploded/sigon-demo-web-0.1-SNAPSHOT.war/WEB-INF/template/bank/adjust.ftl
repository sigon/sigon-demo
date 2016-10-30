<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body class="iframe">

<form id="inputForm" method="post" class="form form_short_info">
    <input type="hidden" name="id" value="${bank.id}">

    <p><label class="f_info"><span data-icon="S"></span>Account:</label><span>${bankName}-${bank.accountNo}-${bank.accountName}-${bank.currency}</span></p>


    <p id="enum">
        <label class="f_info"><span data-icon="S"></span>Type</label>
        <select id="tradeType" name="tradeType" data-v="validate[required]">
            <option value="">Please Select</option>
            [#list tradeTypeEnum as item]
                [#if item.code<5]
                <option value="${item.code}" [#if item.desc==bank.tradeType||(bank.tradeType==null&&item.code=="")]selected[/#if]  >${item.desc}</option>
                [/#if]
            [/#list]
        </select>
    </p>

    <p>
        <label class="f_info"><span data-icon="S"></span>Amount</label>
        <input type="text" id="doubleAmount"  onblur="blurToMoney(this)"  pattern="^(\d*)(\.\d\d)?$" name="adjustAmount" data-v="validate[min[0.01],max[10000000],required]" />
    </p>


    <p>
        <label class="f_info">Comment</label>
        <textarea id="comment" maxlength="100"  name="remark" data-v="validate[maxSize[100]]" ></textarea>
        <br/><span id="msg"></span>
    </p>


    <p>
        <a href="javascript:" id="cancel" class="btn" data-icon="p">Cancel</a>
        <button type="submit" class="btn bg_blue" data-icon="y">Submit</button>
    </p>
</form>
<script>
    seajs.use(["alert","validation"],function(alertM){
        showLength("#comment","#msg",100)
        $("#inputForm").validationEngine().on("submit",function(){
            alertM.end("/bank/adjustInsert.action",$("#inputForm").serialize(),function(){
                window.parent.location.href="/bank/list.action";
            });
            return false;
        }).on('jqv.form.result',function(){
            window.parent.setAH($("body").height()+12);
        });
        $("#cancel").on("click",function(){
            window.parent.refresh()
        });
        window.parent.setAH($("body").height()+12);
    })
</script>
</body>
</html>
