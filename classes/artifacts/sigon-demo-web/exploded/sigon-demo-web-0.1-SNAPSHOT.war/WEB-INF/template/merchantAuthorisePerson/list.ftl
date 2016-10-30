<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">MerchantAuthorisePerson List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">LastName</label>
                <input type="text" id="lastName" name="lastName" value="${merchantAuthorisePerson.lastName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Code</label>
                <input type="text" id="code" name="code" value="${merchantAuthorisePerson.code}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Role</label>
                <input type="text" id="role" name="role" value="${merchantAuthorisePerson.role}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Address</label>
                <input type="text" id="address" name="address" value="${merchantAuthorisePerson.address}" >
            </p>
            <p class="f_1p">
                <label class="f_info">FirstName</label>
                <input type="text" id="firstName" name="firstName" value="${merchantAuthorisePerson.firstName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">PostalAddress</label>
                <input type="text" id="postalAddress" name="postalAddress" value="${merchantAuthorisePerson.postalAddress}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Nationality</label>
                <input type="text" id="nationality" name="nationality" value="${merchantAuthorisePerson.nationality}" >
            </p>
            <p class="f_1p">
                <label class="f_info">MobilePhone</label>
                <input type="text" id="mobilePhone" name="mobilePhone" value="${merchantAuthorisePerson.mobilePhone}" >
            </p>
                    [@inputRegion id="dob" type="date" start=merchantAuthorisePerson.dobStart end=merchantAuthorisePerson.merchantAuthorisePersonEnd]
                    [#include "/include/inputregion.ftl"]
                    [/@inputRegion]
            <p class="f_1p">
                <label class="f_info">PrimaryContact</label>
                <input type="text" id="primaryContact" name="primaryContact" value="${merchantAuthorisePerson.primaryContact}" >
            </p>
            <p class="f_1p">
                <label class="f_info">PhysicalAddress</label>
                <input type="text" id="physicalAddress" name="physicalAddress" value="${merchantAuthorisePerson.physicalAddress}" >
            </p>
            <p class="f_1p">
                <label class="f_info">MiddleName</label>
                <input type="text" id="middleName" name="middleName" value="${merchantAuthorisePerson.middleName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">PreferredName</label>
                <input type="text" id="preferredName" name="preferredName" value="${merchantAuthorisePerson.preferredName}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Email</label>
                <input type="text" id="email" name="email" value="${merchantAuthorisePerson.email}" >
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
                <th>lastName</th>
                <th>code</th>
                <th>role</th>
                <th>address</th>
                <th>firstName</th>
                <th>postalAddress</th>
                <th>nationality</th>
                <th>mobilePhone</th>
                <th>dob</th>
                <th>primaryContact</th>
                <th>physicalAddress</th>
                <th>middleName</th>
                <th>preferredName</th>
                <th>email</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>

<td> ${item.lastName} </td>
<td> ${item.code} </td>
<td> ${item.role} </td>
<td> ${item.address} </td>
<td> ${item.firstName} </td>
<td> ${item.postalAddress} </td>
<td> ${item.nationality} </td>
<td> ${item.mobilePhone} </td>
<td> ${item.dob?datetime} </td>
<td> ${item.primaryContact} </td>
<td> ${item.physicalAddress} </td>
<td> ${item.middleName} </td>
<td> ${item.preferredName} </td>
<td> ${item.email} </td>                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
                         <a href="edit.action?id=${item.id}" class="edit" data-icon="e">Edit</a>
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
