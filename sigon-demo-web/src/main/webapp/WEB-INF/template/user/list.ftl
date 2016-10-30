<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
[#include "/include/head.ftl"]
</head>
<body>
<h2>User List</h2>
    <form id="submitFrom" action="list.action" method="post" >
        <input type="hidden" id="queryint" name="queryint" value="1">
        <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">User ID</label>
                <input id="userId" type="text" name="userId" value="${mrpUser.userId}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Account Name</label>
                <input id="accountName" type="text" name="accountName" value="${mrpUser.accountName}">
            </p>
            <p class="f_1p">
                <label class="f_info">Branch</label>
                <select id="branch" name="branch"  >
                    <option value="" >All</option>
                [#list branchList as item]
                    <option priceCategoryId="${item.priceCategoryId}" value="${item.id}" [#if item.id==mrpUser.branch]selected[/#if]>${item.name}</option>
                [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Clearing Price</label>
                <select id="clearingPrice" name="clearingPrice"  >
                    <option value="" >All</option>
                [#list priceCategoryList as item]
                    <option value="${item.id}" [#if item.id==mrpUser.clearingPrice]selected[/#if]>${item.name}</option>
                [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Role</label>
                <select id="role" name="role" >
                    <option value="" >All</option>
                    [#list rolesList as item]
                        <option value="${item.name}" [#if item.name==mrpUser.role]selected[/#if]>${item.name}</option>
                    [/#list]
                </select>
            </p>
            <p class="f_1p">
                <label class="f_info">Status</label>
                <select id="status" name="status" >
                    <option value="-1" >All</option>
                    [#list priceCategoryEnum as item]
                        <option value="${item.index}" [#if item.index==mrpUser.status]selected[/#if]>${item.descEng}</option>
                    [/#list]
                </select>
            </p>
            <p class="f_1p">
                <button id="searchForm" type="submit" class="btn bg_blue" data-icon="s">Search</button>
                <a id="reset" href="javascript:" class="btn" onclick="resetForm('#submitFrom')">Reset</a>
            </p>

            </div>

        </menu>
        <div class="table">
        [@showMenu code="070101"]
            <a href="add.action" class="btn add bg_green" data-icon="a">Add</a>
            <hr>
        [/@showMenu]
            <table>
                <tr>
                    <th>User ID</th>
                    <th>Account Name</th>
                    <th>Branch</th>
                    <th>Clearing Price</th>
                    <th>Role</th>
                    <th>Status</th>
                    <th width="64">Actions</th>
                </tr>
                [#list page.content as item]
                    <tr>
                        <td>${item.userId}</td>
                        <td>${item.accountName}</td>
                        <td>${branchMapList.get(item.branch)}</td>
                        <td>${priceCategoryMapList.get(item.clearingPrice)}</td>
                        <td>${item.role}</td>
                        <td>${priceCategoryMap.get(item.status).descEng}</td>
                        <td>
                            <span class="btn_i item_menu">
                                o
                                <span>
                    [@showMenu code="070102"]
                                    <a href="edit.action?oldId=${item.userId}" data-icon="e">Edit</a>
                    [/@showMenu]
                    [@showMenu code="070103"]
                        [#if item.userId!="admin"]<a href="/auth/auth.action?userId=${item.userId}" data-icon="e">Roles</a> [/#if]
                    [/@showMenu]
                                </span>
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
    seajs.use("alert",function(alertM){
        $("#reset").on("click",function(){
            $("#status").val("1");
        })
    });
</script>
</body>
</html>
