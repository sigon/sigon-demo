<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>
[#assign menu="Beneficiaries"]
[#include "/basicInfo/menu.ftl"]
<h2 class="page_title">Beneficiary List</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" name="code" value="${code}" />
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Beneficiary Name</label>
                <input type="text" id="name" name="name" value="${beneficiary.name}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Currency</label>
                <select name="currency" id="currency">
                        <option value="">All</option>
                    [#list currencyEnum as enum]
                        <option value="${enum.descEng}" [#if beneficiary.currency==enum.descEng]selected [/#if]>${enum.descEng}</option>
                    [/#list]
                </select>
                [#--<input type="text" id="currency" name="currency" value="${beneficiary.currency}" >--]
            </p>
            <p class="f_1p">
                <label class="f_info">Verified</label>
                <select name="isIdverify" id="isIdverify">
                    <option value="">All</option>
                    [#list whetherEnum as enum]
                        <option value="${enum.index}" [#if beneficiary.isIdverify==enum.index]selected [/#if]>${enum.descEng}</option>
                    [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Bank Name</label>
                <input type="text" id="bankName" name="bankName" value="${beneficiary.bankName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Account No</label>
                <input type="text" id="accountNo" name="accountNo" value="${beneficiary.accountNo}" >
            </p>

            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>


    </menu>

    <div class="table">
    [@showMenu code="030219"]
        <a href="add.action?merchantCode=${beneficiary.code}" class="btn add bg_green" data-icon="a">Add</a>
        <hr>
    [/@showMenu]
        <table>
            <tr>
                <th>Beneficiary Name</th>
                <th>Verified</th>
                <th>Primary Bank Account</th>
                <th>Bank Name</th>
                <th>Currency</th>
                <th>Actions</th>
            </tr>

        [#list page.content as item]
            <tr>

                <td> [@subString content=item.name length=20][/@subString] </td>
                <td> ${whetherMap.get(item.isIdverify).descEng} </td>
                <td> [@subString content=item.accountNumber length=20][/@subString]</td>
                <td> [@subString content=item.bankName length=20][/@subString] </td>
                <td> ${item.currency} </td>
                <td>
                    [#if item.sysType==1]
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                         [@showMenu code="030220"]
                             <a href="edit.action?id=${item.id}" class="edit" data-icon="e">Edit</a>
                         [/@showMenu]

                    </span>
                    [/#if]
                </td>
            </tr>
        [/#list]
        </table>
    [@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
        [#include "/include/pagination.ftl"]
    [/@pagination]
    </div>
</form>

<script>

    seajs.use(["alert","validation"], function (alertM) {
        $("#reset").on("click",function(){
            $("#status").val("1");
        })

        window.refresh=function(t){
            if(t)
                window.location.reload()
            alertM.remove()
        }
    })
</script>
[#include "/include/footer.ftl"]
</body>
</html>
