<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">MerchantInfo List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
                    [@inputRegion id="sanctionAlert" type="date" start=merchantInfo.sanctionAlertStart end=merchantInfo.merchantInfoEnd]
                    [#include "/include/inputregion.ftl"]
                    [/@inputRegion]
            <p class="f_1p">
                <label class="f_info">Code</label>
                <input type="text" id="code" name="code" value="${merchantInfo.code}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Occupation</label>
                <input type="text" id="occupation" name="occupation" value="${merchantInfo.occupation}" >
            </p>
                    [@inputRegion id="nextChecklistDate" type="date" start=merchantInfo.nextChecklistDateStart end=merchantInfo.merchantInfoEnd]
                    [#include "/include/inputregion.ftl"]
                    [/@inputRegion]
            <p class="f_1p">
                <label class="f_info">RiskLevel</label>
                <input type="text" id="riskLevel" name="riskLevel" value="${merchantInfo.riskLevel}" >
            </p>
            <p class="f_1p">
                <label class="f_info">CompanyType</label>
                <input type="text" id="companyType" name="companyType" value="${merchantInfo.companyType}" >
            </p>
            <p class="f_1p">
                <label class="f_info">BusinessName</label>
                <input type="text" id="businessName" name="businessName" value="${merchantInfo.businessName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">BusinessNature</label>
                <input type="text" id="businessNature" name="businessNature" value="${merchantInfo.businessNature}" >
            </p>
            <p class="f_1p">
                <label class="f_info">SourceOfFunds</label>
                <input type="text" id="sourceOfFunds" name="sourceOfFunds" value="${merchantInfo.sourceOfFunds}" >
            </p>
            <p class="f_1p">
                <label class="f_info">RegistrationAddress</label>
                <input type="text" id="registrationAddress" name="registrationAddress" value="${merchantInfo.registrationAddress}" >
            </p>
            <p class="f_1p">
                <label class="f_info">OfficeAddress</label>
                <input type="text" id="officeAddress" name="officeAddress" value="${merchantInfo.officeAddress}" >
            </p>
                    [@inputRegion id="sanctionCheck" type="date" start=merchantInfo.sanctionCheckStart end=merchantInfo.merchantInfoEnd]
                    [#include "/include/inputregion.ftl"]
                    [/@inputRegion]
            <p class="f_1p">
                <label class="f_info">PreferedName</label>
                <input type="text" id="preferedName" name="preferedName" value="${merchantInfo.preferedName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">ProfilePicture</label>
                <input type="text" id="profilePicture" name="profilePicture" value="${merchantInfo.profilePicture}" >
            </p>
            <p class="f_1p">
                <label class="f_info">TradeName</label>
                <input type="text" id="tradeName" name="tradeName" value="${merchantInfo.tradeName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">PostalAddress</label>
                <input type="text" id="postalAddress" name="postalAddress" value="${merchantInfo.postalAddress}" >
            </p>
            <p class="f_1p">
                <label class="f_info">RegistNumber</label>
                <input type="text" id="registNumber" name="registNumber" value="${merchantInfo.registNumber}" >
            </p>
            <p class="f_1p">
                <label class="f_info">LockForTrader</label>
                <input type="text" id="lockForTrader" name="lockForTrader" value="${merchantInfo.lockForTrader}" >
            </p>
                    [@inputRegion id="checklistCompletionDate" type="date" start=merchantInfo.checklistCompletionDateStart end=merchantInfo.merchantInfoEnd]
                    [#include "/include/inputregion.ftl"]
                    [/@inputRegion]
                    [@inputRegion id="incorporationDate" type="date" start=merchantInfo.incorporationDateStart end=merchantInfo.merchantInfoEnd]
                    [#include "/include/inputregion.ftl"]
                    [/@inputRegion]
            <p class="f_1p">
                <label class="f_info">LockForMerchant</label>
                <input type="text" id="lockForMerchant" name="lockForMerchant" value="${merchantInfo.lockForMerchant}" >
            </p>
            <p class="f_1p">
                <label class="f_info">IncorporationCountry</label>
                <input type="text" id="incorporationCountry" name="incorporationCountry" value="${merchantInfo.incorporationCountry}" >
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>
        <a href="add.action" class="btn add" data-icon="a">Add</a>
    </menu>
    <div class="table">
        <table>
            <tr>
                <th>sanctionAlert</th>
                <th>code</th>
                <th>occupation</th>
                <th>nextChecklistDate</th>
                <th>riskLevel</th>
                <th>companyType</th>
                <th>businessName</th>
                <th>businessNature</th>
                <th>sourceOfFunds</th>
                <th>registrationAddress</th>
                <th>officeAddress</th>
                <th>sanctionCheck</th>
                <th>preferedName</th>
                <th>profilePicture</th>
                <th>tradeName</th>
                <th>postalAddress</th>
                <th>registNumber</th>
                <th>lockForTrader</th>
                <th>checklistCompletionDate</th>
                <th>incorporationDate</th>
                <th>lockForMerchant</th>
                <th>incorporationCountry</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>

<td> ${item.sanctionAlert?datetime} </td>
<td> ${item.code} </td>
<td> ${item.occupation} </td>
<td> ${item.nextChecklistDate?datetime} </td>
<td> ${item.riskLevel} </td>
<td> ${item.companyType} </td>
<td> ${item.businessName} </td>
<td> ${item.businessNature} </td>
<td> ${item.sourceOfFunds} </td>
<td> ${item.registrationAddress} </td>
<td> ${item.officeAddress} </td>
<td> ${item.sanctionCheck?datetime} </td>
<td> ${item.preferedName} </td>
<td> ${item.profilePicture} </td>
<td> ${item.tradeName} </td>
<td> ${item.postalAddress} </td>
<td> ${item.registNumber} </td>
<td> ${item.lockForTrader} </td>
<td> ${item.checklistCompletionDate?datetime} </td>
<td> ${item.incorporationDate?datetime} </td>
<td> ${item.lockForMerchant} </td>
<td> ${item.incorporationCountry} </td>                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                         <a href="edit.action?id=${item.id}" class="edit" data-icon="e">Edit</a>

                            <a href="delete.action?id=${item.id}" class="delete" data-icon="e">Delete</a>
                    </span>
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
        $(".edit,.add").on("click",function(){
            var title=$(this).is(".add")?"MerchantInfo Add":"MerchantInfo Edit";
            alertM(this.href,{
                title:title,
                time:"y",
                width:660,
                height:400,
                iframe:1
            })
            return false;
        });
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
