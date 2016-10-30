<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">MRP Trader Provider</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" name="queryint" value="1" >
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Name</label>
                <input type="text" id="name" name="name" value="${provider.name}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Abbreviation</label>
                <input type="text" id="abbreviation" name="abbreviation" value="${provider.abbreviation}" >
            </p>
            <p class="f_1p">
                <label class="f_info">Status</label>
                <select id="status" name="status" >
                    <option value="" >All</option>
                [#list priceCategoryEnum as item]
                    <option value="${item.index}" [#if item.index==provider.status]selected[/#if]>${item.descEng}</option>
                [/#list]
                </select>
            </p>
        [#if dataLevelEnum != null]
            <p class="f_1p">
                <label class="f_info">Data</label>
                <select id="data" name="data" >
                    <option value="" >All</option>
                [#list dataLevelEnum as item]
                    <option value="${item.code}" [#if item.code==provider.data]selected[/#if]>${item.desc}</option>
                [/#list]
                </select>
            </p>
        [/#if]
            <!--搜索和重置按钮-->
            <p  class="f_1p">
                <button type="submit" id="searchForm" class="btn bg_blue" data-icon="s">Search</button>
                <a href="javascript:" id="reset" class="btn" onclick="resetForm('#listForm')">Reset</a>
            </p>
        </div>

    </menu>
    <div class="table">
    [@showMenu code="100101"]
        <a href="/provider/add.action" class="btn add bg_green" data-icon="a">Add</a>
        <hr>
    [/@showMenu]
        <table>
            <tr>
                <th>Name</th>
                <th>Abbreviation</th>
                <th>Status</th>
                <th>Manager</th>
                <th>Mobile Phone</th>
                <th>Phone</th>
                <th>Fax</th>
                <th>Email</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td> <a href="/provider/edit.action?id=${item.id}"> [@subString content=item.name length=20][/@subString] </a> </td>
                <td> ${item.abbreviation} </td>
                <td> ${priceCategoryEnumMap.get(item.status).descEng} </td>
                <td> ${item.manager} </td>
                <td> ${item.mobilePhone?replace("Other ", "")} </td>
                <td> ${item.phone?replace("Other ", "")} </td>
                <td> ${item.fax?replace("Other ", "")} </td>
                <td> ${item.email} </td>
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
