<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body class="iframe">
<form action="accountList.action" id="listForm" method="POST">
    <input type="hidden" name="currency" value="${bankParam.currency}" />
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Bank Name</label>
                <select name="bankNameId" id="">
                    <option value="">All</option>
                    [#list bankNameMap.keySet() as key]
                        <option value="${key}" [#if bankParam.bankNameId==key]selected [/#if]>${bankNameMap.get(key)}</option>
                    [/#list]

                </select>
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>
    </menu>

    <div class="table">
        [#--<p>--]
            [#--<a href="javascript:" class="btn bg_blue" id="select">Select</a><span class="red" id="msgSelect" style="display: none;">请选择一条记录</span>--]
        [#--</p>--]
        [#--<hr>--]
    <table>
        <tr>
            <th>Bank name</th>
            <th>Account Name</th>
            <th>Account No</th>
            <th>Bank Type</th>
            <th>Currency</th>
            <th>Pending Balance</th>
            <th>Available Balance</th>
        </tr>
        [#list page.content as bank]
            <tr data-val="${bank.bank.id}">
                <td>${bank.bankName}</td>
                <td>${bank.bank.accountName}</td>
                <td>${bank.bank.accountNo}</td>
                <td>${accountTypeEnum.get(bank.bank.accountType).desc}</td>
                <td>${bank.bank.currency}</td>
                <td>[@number num = bank.pendingBalance][/@number]</td>
                <td>[@number num = bank.availableBalance][/@number]</td>
            </tr>
        [/#list]

    </table>
[@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
    [#include "/include/pagination.ftl"]
[/@pagination]

</div>
</form>
<script>
    seajs.use("alert", function (alertM) {
        window.parent.setAH($("body").height()+12);
//        $("#select").on("click",function(){
//            if(!$(".radio1").filter(":checked").length){
////                $("#msgSelect").show()
//                return false;
//            }
//            window.parent.getBank($(".radio1").filter(":checked").val())
//        })
//        $(".radio1").on("click",function(){
//            $("#msgSelect").hide()
//        })
        $("td").on("dblclick",function(){
//            $("#msgSelect").hide()
            window.parent.getBank($(this).parent().data().val)
        })
    })
</script>
</body>
</html>
