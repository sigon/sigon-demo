<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">BankCode List</h2>
<form id="listForm" action="list.action" method="post">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Code</label>
                <input type="text" id="code" name="code" value="${bankCode.code}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Name</label>
                <input type="text" id="name" name="name" value="${bankCode.name}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Forshort</label>
                <input type="text" id="forshort" name="forshort" value="${bankCode.forshort}" >
            </p>
            <p class="f_1p">
                <label class="f_info">IsAble</label>
                <select id="isAble" name="isAble" >
                    <option value="" >All</option>
                [#list whetherEnum as item]
                    <option value="${item.index}" [#if item.index==bankCode.isAble]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>
        [#--<a href="add.action" class="btn add" data-icon="a">Add</a>--]
    </menu>
    <div class="table">
        <table>
            <tr>
                <th>code</th>
                <th>name</th>
                <th>forshort</th>
                <th>iconName</th>
                <th>isAble</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>
            <td> ${item.code} </td>
            <td> ${item.name} </td>
            <td> ${item.forshort} </td>
            <td> ${item.iconName} </td>
            <td> ${whetherMap.get(item.isAble).descEng} </td>
            <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.code}">
            [@showMenu code="991101"]<a href="edit.action?code=${item.code}" class="edit" data-icon="e">Edit</a>[/@showMenu]
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
