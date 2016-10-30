<!DOCTYPE html>
<html>
<head>
[#include "/include/head.ftl"]
</head>
<body>

<h2 class="page_title">Branch List</h2>
<form id="listForm" action="list.action" method="post">
    <input type="hidden" id="queryint" name="queryint" value="1">
    <menu>
        <div class="form">
            <p class="f_1p">
                <label class="f_info">Name</label>
                <input type="text" id="name" name="name" value="${branch.name}" >
            </p>

            <p class="f_1p">
                <label class="f_info">Status</label>
                <select id="status" name="status" >
                    <option value="" >All</option>
                [#list priceCategoryEnum as item]
                    <option value="${item.index}" [#if item.index==branch.status]selected[/#if]>${item.descEng}</option>
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
        <table>
        [@showMenu code ="070201"]
            <a href="/branch/add.action?method=insert" class="btn add bg_green" data-icon="a">Add</a>
        [/@showMenu]
            <hr>
            <tr>
                <th>Name[@pageOrder pageable=page.pageable property="name"][/@pageOrder]</th>
                <th>Clearing Price</th>
                <th>Status</th>
                <th>Comment</th>
                <th width="64">Actions</th>
            </tr>

        [#list page.content as item]
            <tr>
                <td>${item.name}</td>
                <td> ${categoryMap.get(item.priceCategoryId)} </td>
                <td>${priceCategoryEnumMap.get(item.status).descEng}</td>
                <td>[@subString content=item.comment length=20][/@subString]</td>
                <!--修改和删除操作-->
                <td>
                    <span class="btn_i item_menu">
                        o<span data-itemid="${item.id}">
            [@showMenu code ="070202"]
                         <a href="/branch/edit.action?id=${item.id}&method=editSave" class="edit" data-icon="e">Edit</a>
            [/@showMenu]
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
            var title=$(this).is(".add")?"Branch Add":"Branch Edit";
            alertM(this.href,{
                title:title,
                time:"y",
                width:480,
                height:420,
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